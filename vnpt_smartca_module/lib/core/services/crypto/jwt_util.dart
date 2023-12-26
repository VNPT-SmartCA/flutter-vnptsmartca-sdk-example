import 'dart:typed_data';
import 'dart:convert';

import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

Logger _logger = Logger('JWTRsaSha256Signer');

class JWTService {
  String createActiveData(Map<String, dynamic> datas) {
    String privKeyPEM = datas['kakPriv'];
    String sub = datas['sub'];
    String certId = datas['credentialId'];
    String kakPub = datas['kakPub'];
    String deviceId = datas['deviceId'];
    String keyAuthData = datas['keyAuthData'];
    String accessToken = datas['access_token'];
    _logger.info('Generate active data...');

    var builder = JWTBuilder();
    builder
      ..id = Uuid().v4()
      ..subject = sub
      ..audience = deviceId
      ..issuer = 'VNPT SIC component'
      ..issuedAt = DateTime.now()
      ..expiresAt = DateTime.now().add(const Duration(minutes: 5))
      ..setClaim('seElnSadext', {
        'credentialId': certId,
        'kakPub': kakPub,
        'keyAuthData': keyAuthData,
        'access_token': accessToken
      })
      ..getToken();

    var signer = JWTRsaSha256Signer(privateKey: privKeyPEM);
    var signedToken = builder.getSignedToken(signer);
    var stringToken = signedToken.toString();
    return stringToken;
  }

  /// Create SAD data for authorisize signing key
  ///
  ///

  String createAssignKeyData(Map<String, dynamic> datas) {
    String sub = datas['sub'];
    String appId = datas['appId'];
    String tranId = datas['tranId'];
    int signReqId = datas['challengeId'];
    List<dynamic> docs = datas['docs'];
    String privKeyPEM = datas['privKeyPEM'];

    String accessToken = datas['access_token'];
    String keyAuthData = datas['keyAuthData'];
    String deviceId = datas['deviceId'];

    _logger.info('Generate SAD...');
    var builder = JWTBuilder();
    builder
      ..id = Uuid().v4()
      ..subject = sub
      ..audience = appId
      ..issuer = 'VNPT SIC component'
      ..issuedAt = DateTime.now()
      ..expiresAt = DateTime.now().add(const Duration(minutes: 5))
      ..setClaim('seElnSadext', {
        'irt': tranId,
        'attr': 'urn:oid:1.2.752.29.4.13',
        'loa': 'http://id.elegnamnden.se/loa/1.0/loa3-sigmessage',
        'requestId': signReqId,
        'deviceId': deviceId,
        'keyAuthData': keyAuthData,
        'access_token': accessToken,
        'docs': docs[0]
      })
      ..getToken();

    var signer = JWTRsaSha256Signer(privateKey: privKeyPEM);
    var signedToken = builder.getSignedToken(signer);
    var stringToken = signedToken.toString();
    return stringToken;
  }

  /// Create SAD data for authorisize signing key
  ///
  ///

  String createSAD(Map<String, dynamic> datas) {
    String sub = datas['sub'];
    String appId = datas['appId'];
    String tranId = datas['tranId'];
    int signReqId = datas['challengeId'];
    List<dynamic> docs = datas['docs'];
    String privKeyPEM = datas['privKeyPEM'];

    String accessToken = datas['access_token'];
    String keyAuthData = datas['keyAuthData'];
    String deviceId = datas['deviceId'];

    _logger.info('Generate SAD...');
    var builder = JWTBuilder();
    var bytes = BytesBuilder();
    for (int i = 0; i < docs.length; i++) {
      Uint8List hash = base64.decode(docs[i]['hash']);
      bytes.add(hash);
    }
    String docString = base64.encode(bytes.toBytes());
    builder
      ..id = Uuid().v4()
      ..subject = sub
      ..audience = appId
      ..issuer = 'VNPT SIC component'
      ..issuedAt = DateTime.now()
      ..expiresAt = DateTime.now().add(const Duration(minutes: 5))
      ..setClaim('seElnSadext', {
        'irt': tranId,
        'attr': 'urn:oid:1.2.752.29.4.13',
        'loa': 'http://id.elegnamnden.se/loa/1.0/loa3-sigmessage',
        'requestId': signReqId,
        'deviceId': deviceId,
        'keyAuthData': keyAuthData,
        'access_token': accessToken,
        'docs': docString
      })
      ..getToken();

    var signer = JWTRsaSha256Signer(privateKey: privKeyPEM);
    var signedToken = builder.getSignedToken(signer);
    var stringToken = signedToken.toString();
    return stringToken;
  }
}
