import '../../dart_otp.dart';

abstract class OTPUtil {
  static String? otpTypeValue({required OTPType type}) {
    switch (type) {
      case OTPType.TOTP:
        return "totp";

      case OTPType.HOTP:
        return "hotp";

      default:
        return null;
    }
  }
}
