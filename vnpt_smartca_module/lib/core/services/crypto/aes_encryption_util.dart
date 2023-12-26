import 'dart:typed_data';

import 'package:pointycastle/export.dart';

class AESEncryptionService {
  //Block size is 16bytes
  final String _iv = 'ARAGORN_';

  // using AES-256 with 32bytes key length
  final String _salt = 'ET2ARAGORN_THE_L';

  ///
  ///
  ///
  Uint8List _getIVBytes() {
    return _stringToBytes(_iv);
  }

  ///
  ///
  ///
  static Uint8List _stringToBytes(String data) {
    var list = <int>[];
    data.runes.forEach((element) {
      if (element >= 0x10000) {
        element -= 0x10000;
        int firstWord = (element >> 10) + 0xD800;
        list.add(firstWord >> 8);
        list.add(firstWord & 0xFF);
        int secondWord = (element & 0x3FF) + 0xDC00;
        list.add(secondWord >> 8);
        list.add(secondWord & 0xFF);
      } else {
        list.add(element >> 8);
        list.add(element & 0xFF);
      }
    });
    return Uint8List.fromList(list);
  }

  ///
  ///
  ///

  Uint8List? encryptList(Map<String, Object> datas) {
    final CBCBlockCipher cbcCipher = CBCBlockCipher(AESEngine());

    Uint8List data = datas['data'] as Uint8List;
    Uint8List _key = datas['key'] as Uint8List;
    Uint8List _iv = _getIVBytes();

    Uint8List salted = _stringToBytes(_salt);
    for (int i = 0; i < _key.length; i++) {
      salted[i] = _key[i];
    }

    final ParametersWithIV<KeyParameter> ivParams = ParametersWithIV<KeyParameter>(KeyParameter(salted), _iv);
    final paddingParams = PaddedBlockCipherParameters(ivParams, null);

    final PaddedBlockCipherImpl paddedCipher = PaddedBlockCipherImpl(PKCS7Padding(), cbcCipher);
    paddedCipher.init(true, paddingParams);

    try {
      return paddedCipher.process(data);
    } catch (e) {
      rethrow;
    }
  }

  ///
  ///
  ///

  Uint8List? decryptList(Map<String, Object> datas) {
    Uint8List data = datas['data'] as Uint8List;
    Uint8List _key = datas['key'] as Uint8List;
    Uint8List _iv = _getIVBytes();

    Uint8List salted = _stringToBytes(_salt);
    for (int i = 0; i < _key.length; i++) {
      salted[i] = _key[i];
    }

    final CBCBlockCipher cbcCipher = CBCBlockCipher(AESFastEngine());
    final ParametersWithIV<KeyParameter> ivParams = ParametersWithIV<KeyParameter>(KeyParameter(salted), _iv);
    final PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null> paddingParams =
        PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null>(ivParams, null);
    final PaddedBlockCipherImpl paddedCipher = PaddedBlockCipherImpl(PKCS7Padding(), cbcCipher);
    paddedCipher.init(false, paddingParams);

    try {
      return paddedCipher.process(data);
    } catch (e) {
      return null;
    }
  }
}
