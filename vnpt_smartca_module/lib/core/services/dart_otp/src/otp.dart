///
/// @module   : OTP module to generate the password
/// @author   : Gin (gin.lance.inside@hotmail.com)
///

import 'dart:math';
import 'package:base32/base32.dart';
import 'components/otp_algorithm.dart';
import 'components/otp_type.dart';
import 'utils/generic_util.dart';
import 'utils/algorithm_util.dart';
import 'utils/otp_util.dart';

abstract class OTP {
  /// The length of the one-time password, between 6 and 8.
  int digits;

  /// The Base32 secret key used to generate the one-time password.
  String secret;

  /// The crypto algorithm used on HMAC encoding.
  OTPAlgorithm algorithm;

  /// The type of the token.
  OTPType get type;

  /// To access custom properties when generating the url.
  Map<String, dynamic> get extraUrlProperties;

  ///
  /// This constructor will create an OTP instance.
  ///
  /// All parameters are mandatory however [digits] and
  /// [algorithm] have a default value, so can be ignored.
  /// Will throw an exception if the line above isn't satisfied.
  ///
  OTP(
      {required this.secret,
      this.digits = 6,
      this.algorithm = OTPAlgorithm.SHA1});

  ///
  /// When class HOTP or TOTP pass the input params to this
  /// function, it will generate the OTP object with params,
  /// the params may be counter or time.
  ///
  /// All parameters are mandatory however [algorithm] have
  /// a default value, so can be ignored.
  ///
  String generateOTP(
      {required int input, OTPAlgorithm algorithm = OTPAlgorithm.SHA1}) {
    /// base32 decode the secret
    var hmacKey = base32.decode(secret);

    /// initial the HMAC-SHA1 object
    var hmacSha =
        AlgorithmUtil.createHmacFor(algorithm: algorithm, key: hmacKey);

    /// get hmac answer
    var hmac = hmacSha?.convert(Util.intToBytelist(input: input)).bytes;

    /// calculate the init offset
    int offset = hmac![hmac.length - 1] & 0xf;

    /// calculate the code
    int code = ((hmac[offset] & 0x7f) << 24 |
        (hmac[offset + 1] & 0xff) << 16 |
        (hmac[offset + 2] & 0xff) << 8 |
        (hmac[offset + 3] & 0xff));

    /// get the initial string code
    var strCode = (code % pow(10, digits)).toString();
    strCode = strCode.padLeft(digits, '0');

    return strCode;
  }

  ///
  /// Generate a url with OTP instance.
  ///
  /// Use [issuer] and [account] parameters to specify the token information.
  /// All the remaining OTP fields will be exported.
  ///
  String generateUrl({required String issuer, required String account}) {
    final _secret = secret;
    final _type = OTPUtil.otpTypeValue(type: type);
    final _account = Uri.encodeComponent(account);
    final _issuer = Uri.encodeQueryComponent(issuer);

    final _algorithm = AlgorithmUtil.rawValue(algorithm: algorithm);
    final _extra = extraUrlProperties
        .map((key, value) => MapEntry(key, "$key=$value"))
        .values
        .join('&');

    return 'otpauth://$_type/$_account?secret=$_secret&issuer=$_issuer&digits=$digits&algorithm=$_algorithm&$_extra';
  }
}
