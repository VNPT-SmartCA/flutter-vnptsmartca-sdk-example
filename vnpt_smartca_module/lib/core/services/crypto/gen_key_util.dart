import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pointycastle/api.dart';

import '../../../configs/injector/injector.dart';
import 'aes_encryption_util.dart';
import 'kak_utils.dart';

class GenkeyModel {
  final String userPIN;
  final String keyChallengeSig;
  final String kakPub;
  final String kakPrivate;

  GenkeyModel({
    required this.userPIN,
    required this.keyChallengeSig,
    required this.kakPub,
    required this.kakPrivate,
  });
}

class GenKeyUtil {
  static GenkeyModel genKeyWithPinCode({
    String pinCode = "",
  }) {
    // init service
    final rsaKeyService = getIt<RsaKeyService>();
    final aesEncryptionService = getIt<AESEncryptionService>();

    SecureRandom secureRandom = rsaKeyService.getSecureRandom();
    final keyPair = rsaKeyService.generateKeypair(secureRandom);

    String privKey = rsaKeyService.encodePrivateKeyToPem(keyPair.privateKey);
    String pubKey = rsaKeyService.encodePublicKeyToPem(keyPair.publicKey);

    final map = <String, Object>{};
    map['data'] = utf8.encode(privKey);
    map['key'] = utf8.encode(pinCode);
    final encrypted = aesEncryptionService.encryptList(map);
    final encryptedBase64 = base64.encode(encrypted!);

    Uint8List challengeSig = rsaKeyService.getKeyInitializeChallenge(keyPair);
    return GenkeyModel(
      keyChallengeSig: base64.encode(challengeSig),
      kakPrivate: encryptedBase64,
      kakPub: pubKey,
      userPIN: pinCode,
    );
  }
}
