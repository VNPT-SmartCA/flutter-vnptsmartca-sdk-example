// ignore_for_file: unnecessary_null_comparison

import 'package:crypto/crypto.dart';

import '../../dart_otp.dart';

abstract class AlgorithmUtil {
  static Hmac? createHmacFor(
      {required OTPAlgorithm algorithm, required List<int> key}) {
    if (key == null) {
      return null;
    }

    switch (algorithm) {
      case OTPAlgorithm.SHA1:
        return Hmac(sha1, key);
      case OTPAlgorithm.SHA256:
        return Hmac(sha256, key);
      case OTPAlgorithm.SHA384:
        return Hmac(sha384, key);
      case OTPAlgorithm.SHA512:
        return Hmac(sha512, key);

      default:
        return null;
    }
  }

  static String? rawValue({required OTPAlgorithm algorithm}) {
    switch (algorithm) {
      case OTPAlgorithm.SHA1:
        return 'SHA1';
      case OTPAlgorithm.SHA256:
        return 'SHA256';
      case OTPAlgorithm.SHA384:
        return 'SHA384';
      case OTPAlgorithm.SHA512:
        return 'SHA512';

      default:
        return null;
    }
  }
}
