import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/digests/sha256.dart';
import 'package:pointycastle/macs/hmac.dart';
import 'package:pointycastle/pointycastle.dart';

import 'hex_encoder.dart';

class MessageDigestService {
  String hmac256(String key, String data) {
    var dataBytes = utf8.encode(data);
    var keyBytes = utf8.encode(key);

    final hmac = HMac(SHA256Digest(), 64)
      ..init(KeyParameter(Uint8List.fromList(keyBytes)));
    var hmacBytes = hmac.process(Uint8List.fromList(dataBytes));
    return hexEncoder.convert(hmacBytes);
  }
}
