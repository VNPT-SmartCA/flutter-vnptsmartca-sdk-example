import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import "package:asn1lib/asn1lib.dart";
import "package:pointycastle/export.dart";

List<int> decodePEM(String pem) {
  var startsWith = [
    "-----BEGIN PUBLIC KEY-----",
    "-----BEGIN PRIVATE KEY-----",
    "-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
    "-----BEGIN PGP PRIVATE KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
  ];
  var endsWith = [
    "-----END PUBLIC KEY-----",
    "-----END PRIVATE KEY-----",
    "-----END PGP PUBLIC KEY BLOCK-----",
    "-----END PGP PRIVATE KEY BLOCK-----",
  ];
  bool isOpenPgp = pem.contains('BEGIN PGP');

  for (var s in startsWith) {
    if (pem.startsWith(s)) {
      pem = pem.substring(s.length);
    }
  }

  for (var s in endsWith) {
    if (pem.endsWith(s)) {
      pem = pem.substring(0, pem.length - s.length);
    }
  }

  if (isOpenPgp) {
    var index = pem.indexOf('\r\n');
    pem = pem.substring(0, index);
  }

  pem = pem.replaceAll('\n', '');
  pem = pem.replaceAll('\r', '');

  return base64.decode(pem);
}

class RSAHashSigner implements Signer {
  final AsymmetricBlockCipher _rsa = PKCS1Encoding(RSAEngine());
  final Digest _digest;
  late Uint8List _digestIdentifier; // DER encoded with trailing tag (06)+length byte
  // bool _forSigning;

  RSAHashSigner(this._digest, String digestIdentifierHex) {
    _digestIdentifier = _hexStringToBytes(digestIdentifierHex);
  }

  Uint8List _derEncode(Uint8List hash) {
    var out = Uint8List(2 + 2 + _digestIdentifier.length + 2 + 2 + hash.length);
    var i = 0;

    // header
    out[i++] = 48;
    out[i++] = out.length - 2;

    // algorithmIdentifier.header
    out[i++] = 48;
    out[i++] = _digestIdentifier.length + 2;

    // algorithmIdentifier.bytes
    out.setAll(i, _digestIdentifier);
    i += _digestIdentifier.length;

    // algorithmIdentifier.null
    out[i++] = 5;
    out[i++] = 0;

    // hash.header
    out[i++] = 4;
    out[i++] = hash.length;

    // hash.bytes
    out.setAll(i, hash);

    return out;
  }

  Uint8List _hexStringToBytes(String hex) {
    var result = Uint8List(hex.length ~/ 2);
    for (var i = 0; i < hex.length; i += 2) {
      var num = hex.substring(i, i + 2);
      var byte = int.parse(num, radix: 16);
      result[i ~/ 2] = byte;
    }
    return result;
  }

  @override
  String get algorithmName => '${_digest.algorithmName}/RSA';

  @override
  void reset() {
    _digest.reset();
    _rsa.reset();
  }

  @override
  void init(bool forSigning, CipherParameters params) {
    // _forSigning = forSigning;

    AsymmetricKeyParameter akparams;
    akparams = params is ParametersWithRandom
        ? params.parameters as AsymmetricKeyParameter<AsymmetricKey>
        : params as AsymmetricKeyParameter<AsymmetricKey>;

    var k = akparams.key as RSAAsymmetricKey;

    if (forSigning && (k is! RSAPrivateKey)) {
      throw ArgumentError('Signing requires private key');
    }

    if (!forSigning && (k is! RSAPublicKey)) {
      throw ArgumentError('Verification requires public key');
    }

    reset();

    _rsa.init(forSigning, params);
  }

  @override
  Signature generateSignature(Uint8List message) {
    var data = _derEncode(message);
    var out = Uint8List(_rsa.outputBlockSize);
    var len = _rsa.processBlock(data, 0, data.length, out, 0);
    return RSASignature(out.sublist(0, len));
  }

  @override
  bool verifySignature(Uint8List message, Signature signature) {
    throw UnimplementedError();
  }
}

class RsaKeyService {
  ///
  SecureRandom getSecureRandom() {
    SecureRandom secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));
    return secureRandom;
  }

  ///
  ///
  ///
  AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateKeypair(dynamic secureRandom) {
    var keyParams = RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 12);

    var rngParams = ParametersWithRandom(keyParams, secureRandom);
    var k = RSAKeyGenerator();
    k.init(rngParams);

    final keypair = k.generateKeyPair();
    return AsymmetricKeyPair(keypair.publicKey as RSAPublicKey, keypair.privateKey as RSAPrivateKey);
  }

  Uint8List? getKeyInitializeChallengeFromPem(Map<String, String> data) {
    try {
      final privPem = data['privPem'];
      final pubPem = data['pubPem'];
      final priv = parsePrivateKeyFromPem(privPem);
      final pub = parsePublicKeyFromPem(pubPem);
      AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> keypair = AsymmetricKeyPair(pub, priv);

      return getKeyInitializeChallenge(keypair);
    } catch (e) {
      return null;
    }
  }

  ///
  ///
  ///
  Uint8List getKeyInitializeChallenge(AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> keypair) {
    // String privPem =
    //     'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC64WDH+Fr7eo4dapL+E6OCsTCAObfqIbD1lHtV1iWUo0OW256QS6qtjZcbIJyoDgaKHGtFGwxKo1mNL7ztRc2KF7WkYsCBYxRqfdqA3Kl/pFEOdeBY0Kw7Tbzip5ILzdxkRNaXYGtKLwn9suS7Awomy6hnu/n5x11fbGFSsWCl1pGAPtVd8sTaU7eUZj9wunGvAz+cEsr3pf5qDBfGhtAgSOnM2bgFkPGbuFqJDG3+miprq7lLrU9rouZ10dM6zh7QNrLFx10e4qTRpB11asGXChLFBXcBKRurNCygk11niU7qfpHIu/SkWf/J6fMy46rZOFb3yR4OITRFfmBHVg8DAgMBAAECggEAQ8sn31MuukTi0jQLwAUiz3H0/Mcze0melvA279QgTPQPPGZOdt0kPRJ8yxgBDIwN/kNB/M9LnbX1chzrxg2I+zwPpmM2n5lwWhNu1Ul3abkTuJG1gbKtkFPqnjSY7BRRi8RXLpIJSd+XmcOwa1E2eQ1vebY9AEo9CrVX9vYm7/GvURz3z86q4FYnJPKFmej4MzPiJHrZ4koIiT45019YWx6BSzzFDbL8SF70QKnQ8fRIoWhZdtpWldLoGNItGowxqiecjdRr8dIZr2ZPsQaz4B1tpZD/tpSohivXfy8AtbBCA+di6d2LZ1kF3uyBgyy0B0sRnxQnRbT+SabPfU6eKQKBgQD429ptxfb3lb2MzoOJgjMFJ3ZAriFX3iqlo6QRRANIsl1M/61wBJMLRTxble+kVn4PXoTZtwY93hAKA2FogKrMxkNqEgFoDxwTPdF8FJWVXQYw2QqPQnBVxImVlxyIi3mJ0gYHYMjIXXydntYhh4YL0FBlwLYff3PdrkWw7spHqQKBgQDAPjlQBRmHpJ0mdZqq/KqZ7iP1C8qrsv0xUZVPD/2XPgmK6zmvILgERMIIstwp0kNvLa6EaD4nHSbyWgwKN8pB44RV1vJZoXFILE5iWbdfsuhmcRBK5Phz8ufMRz1BylftqsToe2GDdFPPqsDF0qT7n0GeI8D0r0o/TF4jrMrcywKBgQCsdWe9FSjeUTYn42HCpKkI1F0d286dnwf8/BeSI4kHExyXZMRj0be5YsS+T3zgbVQ1AHKekjjQHRkOZ2NU0X4MJQXI9ytkWrxBFWEcVQOInAvTREYOG6PPvEEAmtUaR1X1zceBy2+5cxgN/2ozmECr5TQiH9fWojPAl6oSQJmL6QKBgCXa2txH9MwB/TP6indLA6kF/KyfIsyGlVbl0rnb0zq565UgVp6GmdW1WGPwHGxbzA2TeD74a+y1z9p/IsnMTJaG36MrjVNa9/yXROQW+IXuq9aoQuYMimQCm+RcztIqrv/M1bNVwFDrUimdXRJXNUebB4fFUJSeA8fNGOh7eQLbAoGAcIrOtTC5vxAIFpCUHbSSqTY8f8pgH+xspAaaBwdcLLe3kLeARqWeKpPPL4zTnvtkcuUk9JipKLFAyje8h9I4T52ToH99+BVt5i9rDuO5boOx1sFD4s88Jy1uEOigBh36aeZ8mpNgTzeLbDfX9GKb8Af9ysUe8Cmr+Hc1Z+m4YiQ=';
    // String pubPem =
    //     'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuuFgx/ha+3qOHWqS/hOjgrEwgDm36iGw9ZR7VdYllKNDltuekEuqrY2XGyCcqA4GihxrRRsMSqNZjS+87UXNihe1pGLAgWMUan3agNypf6RRDnXgWNCsO0284qeSC83cZETWl2BrSi8J/bLkuwMKJsuoZ7v5+cddX2xhUrFgpdaRgD7VXfLE2lO3lGY/cLpxrwM/nBLK96X+agwXxobQIEjpzNm4BZDxm7haiQxt/poqa6u5S61Pa6LmddHTOs4e0DayxcddHuKk0aQddWrBlwoSxQV3ASkbqzQsoJNdZ4lO6n6RyLv0pFn/yenzMuOq2ThW98keDiE0RX5gR1YPAwIDAQAB';

    final privKey = keypair.privateKey;
    final pubKey = keypair.publicKey;

    var modulus = ASN1Integer.encodeBigInt(pubKey.modulus!);
    var exponent = ASN1Integer.encodeBigInt(pubKey.publicExponent!);

    var challenges = [...modulus, ...exponent];
    var challenge = Uint8List.fromList(challenges);
    final signer = RSASigner(SHA256Digest(), '0609608648016503040201');
    signer.init(true, PrivateKeyParameter<RSAPrivateKey>(privKey));

    final sig = signer.generateSignature(challenge);
    final sigBytes = sig.bytes;
    return sigBytes;
  }

  ///
  ///
  ///
  Uint8List signHash(Map<String, dynamic> data) {
    String privateKey = data['key'];
    RSAPrivateKey privKey = parsePrivateKeyFromPem(privateKey);
    final signer = RSAHashSigner(SHA256Digest(), '0609608648016503040201');
    signer.init(true, PrivateKeyParameter<RSAPrivateKey>(privKey));
    final sig = signer.generateSignature(data['data']) as RSASignature;
    final sigBytes = sig.bytes;
    return sigBytes;
  }

  ///
  ///
  ///
  Uint8List sign(Map<String, dynamic> data) {
    String privateKey = data['key'];
    RSAPrivateKey privKey = parsePrivateKeyFromPem(privateKey);
    final signer = RSASigner(SHA256Digest(), '0609608648016503040201');
    signer.init(true, PrivateKeyParameter<RSAPrivateKey>(privKey));
    final sig = signer.generateSignature(data['data']);
    final sigBytes = sig.bytes;
    return sigBytes;
  }

  ///
  ///
  ///
  String encrypt(String plaintext, RSAPublicKey publicKey) {
    var cipher = RSAEngine()..init(true, PublicKeyParameter<RSAPublicKey>(publicKey));
    var cipherText = cipher.process(Uint8List.fromList(plaintext.codeUnits));

    return String.fromCharCodes(cipherText);
  }

  ///
  ///
  ///
  String decrypt(String ciphertext, RSAPrivateKey privateKey) {
    var cipher = RSAEngine()..init(false, PrivateKeyParameter<RSAPrivateKey>(privateKey));
    var decrypted = cipher.process(Uint8List.fromList(ciphertext.codeUnits));

    return String.fromCharCodes(decrypted);
  }

  ///
  ///
  ///
  RSAPublicKey parsePublicKeyFromPem(pemString) {
    List<int> publicKeyDER = decodePEM(pemString);
    var asn1Parser = ASN1Parser(Uint8List.fromList(publicKeyDER));
    var topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;
    var publicKeyBitString = topLevelSeq.elements[1];

    var publicKeyAsn = ASN1Parser(publicKeyBitString.contentBytes()!);
    final publicKeySeq = publicKeyAsn.nextObject() as ASN1Sequence;
    var modulus = publicKeySeq.elements[0] as ASN1Integer;
    var exponent = publicKeySeq.elements[1] as ASN1Integer;

    RSAPublicKey rsaPublicKey = RSAPublicKey(modulus.valueAsBigInteger!, exponent.valueAsBigInteger!);

    return rsaPublicKey;
  }

  ///
  ///
  ///
  RSAPrivateKey parsePrivateKeyFromPem(pemString) {
    List<int> privateKeyDER = decodePEM(pemString);
    var asn1Parser = ASN1Parser(Uint8List.fromList(privateKeyDER));
    var topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;
    // ignore: unused_local_variable
    var version = topLevelSeq.elements[0];
    // ignore: unused_local_variable
    var algorithm = topLevelSeq.elements[1];
    var privateKey = topLevelSeq.elements[2];

    asn1Parser = ASN1Parser(privateKey.contentBytes()!);
    var pkSeq = asn1Parser.nextObject() as ASN1Sequence;

    version = pkSeq.elements[0];
    var modulus = pkSeq.elements[1] as ASN1Integer;
    // ignore: unused_local_variable
    var publicExponent = pkSeq.elements[2] as ASN1Integer;
    var privateExponent = pkSeq.elements[3] as ASN1Integer;
    var p = pkSeq.elements[4] as ASN1Integer;
    var q = pkSeq.elements[5] as ASN1Integer;
    // ignore: unused_local_variable
    var exp1 = pkSeq.elements[6] as ASN1Integer;
    // ignore: unused_local_variable
    var exp2 = pkSeq.elements[7] as ASN1Integer;
    // ignore: unused_local_variable
    var co = pkSeq.elements[8] as ASN1Integer;

    RSAPrivateKey rsaPrivateKey = RSAPrivateKey(
        modulus.valueAsBigInteger!, privateExponent.valueAsBigInteger!, p.valueAsBigInteger, q.valueAsBigInteger);

    return rsaPrivateKey;
  }

  ///
  ///
  ///
  String encodePublicKeyToPem(RSAPublicKey publicKey) {
    var algorithmSeq = ASN1Sequence();
    var algorithmAsn1Obj =
        ASN1Object.fromBytes(Uint8List.fromList([0x6, 0x9, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0xd, 0x1, 0x1, 0x1]));
    var paramsAsn1Obj = ASN1Object.fromBytes(Uint8List.fromList([0x5, 0x0]));
    algorithmSeq.add(algorithmAsn1Obj);
    algorithmSeq.add(paramsAsn1Obj);

    var publicKeySeq = ASN1Sequence();
    publicKeySeq.add(ASN1Integer(publicKey.modulus!));
    publicKeySeq.add(ASN1Integer(publicKey.exponent!));
    var publicKeySeqBitString = ASN1BitString(Uint8List.fromList(publicKeySeq.encodedBytes));

    var topLevelSeq = ASN1Sequence();
    topLevelSeq.add(algorithmSeq);
    topLevelSeq.add(publicKeySeqBitString);
    var dataBase64 = base64.encode(topLevelSeq.encodedBytes);

    // return """-----BEGIN PUBLIC KEY-----\r\n$dataBase64\r\n-----END PUBLIC KEY-----""";
    return dataBase64;
  }

  ///
  ///
  ///
  String encodePrivateKeyToPem(RSAPrivateKey privateKey) {
    var version = ASN1Integer(BigInt.from(0));

    var algorithmSeq = ASN1Sequence();
    var algorithmAsn1Obj =
        ASN1Object.fromBytes(Uint8List.fromList([0x6, 0x9, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0xd, 0x1, 0x1, 0x1]));
    var paramsAsn1Obj = ASN1Object.fromBytes(Uint8List.fromList([0x5, 0x0]));
    algorithmSeq.add(algorithmAsn1Obj);
    algorithmSeq.add(paramsAsn1Obj);

    var privateKeySeq = ASN1Sequence();
    var modulus = ASN1Integer(privateKey.n!);
    var publicExponent = ASN1Integer(BigInt.parse('65537'));
    // ignore: deprecated_member_use
    var privateExponent = ASN1Integer(privateKey.d!);
    var p = ASN1Integer(privateKey.p!);
    var q = ASN1Integer(privateKey.q!);
    // ignore: deprecated_member_use
    var dP = privateKey.d! % (privateKey.p! - BigInt.from(1));
    var exp1 = ASN1Integer(dP);
    // ignore: deprecated_member_use
    var dQ = privateKey.d! % (privateKey.q! - BigInt.from(1));
    var exp2 = ASN1Integer(dQ);
    var iQ = privateKey.q?.modInverse(privateKey.p!);
    var co = ASN1Integer(iQ!);

    privateKeySeq.add(version);
    privateKeySeq.add(modulus);
    privateKeySeq.add(publicExponent);
    privateKeySeq.add(privateExponent);
    privateKeySeq.add(p);
    privateKeySeq.add(q);
    privateKeySeq.add(exp1);
    privateKeySeq.add(exp2);
    privateKeySeq.add(co);
    var publicKeySeqOctetString = ASN1OctetString(Uint8List.fromList(privateKeySeq.encodedBytes));

    var topLevelSeq = ASN1Sequence();
    topLevelSeq.add(version);
    topLevelSeq.add(algorithmSeq);
    topLevelSeq.add(publicKeySeqOctetString);
    var dataBase64 = base64.encode(topLevelSeq.encodedBytes);

    return """-----BEGIN PRIVATE KEY-----\r\n$dataBase64\r\n-----END PRIVATE KEY-----""";
    // return dataBase64;
  }
}
