///
/// @module   : HOTP module to generate and verify HOTP password
/// @author   : Gin (gin.lance.inside@hotmail.com)
///

// ignore_for_file: unnecessary_null_comparison

import 'otp.dart';
import 'components/otp_type.dart';
import 'components/otp_algorithm.dart';

///
/// HOTP class will generate the OTP (One Time Password) object with given counter.
class HOTP extends OTP {
  /// The counter value for one-time password.
  int counter;

  @override
  OTPType get type => OTPType.HOTP;

  @override
  Map<String, dynamic> get extraUrlProperties => {"counter": counter};

  ///
  /// This constructor will create an HOTP instance.
  ///
  /// All parameters are mandatory however [counter],
  /// [digits] and [algorithm] have a default values, so can be ignored.
  ///
  /// Will throw an exception if the line above isn't satisfied.
  ///
  HOTP(
      {required String secret,
      this.counter = 0,
      int digits = 6,
      OTPAlgorithm algorithm = OTPAlgorithm.SHA1})
      : super(secret: secret);

  ///
  /// Generate the HOTP value with the given count
  ///
  /// ```dart
  /// HOTP hotp = HOTP(secret: 'BASE32ENCODEDSECRET');
  /// hotp.at(counter: 0); // => 432143
  /// ```
  ///
  String? at({required int counter}) {
    if (counter < 0) {
      return null;
    }

    return super.generateOTP(input: counter);
  }

  ///
  /// Verifies the HOTP value passed in against the a given counter.
  ///
  /// All parameters are mandatory.
  ///
  /// ```dart
  /// HOTP hotp = HOTP(secret: 'BASE32ENCODEDSECRET');
  /// hotp.at(counter: 0); // => 432143
  /// // Verify for current time
  /// hotp.verify(otp: 432143, counter: 0); // => true
  /// // Verify after 30s
  /// hotp.verify(otp: 432143, counter: 10); // => false
  /// ```
  ///
  bool verify({required String otp, required int counter}) {
    if (counter == null) {
      return false;
    }

    String? otpCount = at(counter: counter);
    return otp == otpCount;
  }
}
