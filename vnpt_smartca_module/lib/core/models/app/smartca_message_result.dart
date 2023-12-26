// ignore_for_file: constant_identifier_names

import 'dart:convert';

class ResultCodeDesc {
  static const String UNKNOWN_ERROR = "UNKNOWN_ERROR";
  static const String USER_CANCEL = "USER_CANCEL";
  static const String REJECTED_SUCCESS = "REJECTED_SUCCESS";
  static const String CONFIRMED_SUCCESS = "CONFIRMED_SUCCESS";
  static const String ENROLL_SUCCESS = "ENROLL_SUCCESS";
  static const String SUCCESS = "SUCCESS";
  static const String BIOMETRIC_ERROR = "BIOMETRIC_ERROR";
}

class ResultCode {
  static const int BIOMETRIC_ERROR_CODE = 3;
  static const int UNKNOWN_ERROR_CODE = 2;
  static const int USER_CANCEL_CODE = 1;
  static const int SUCCESS_CODE = 0;
  static const int SUCCESS_OPEN = 4;
}

class SmartCaResult {
  final int status;
  final String statusDesc;
  final dynamic data;

  SmartCaResult(this.status, this.statusDesc, [this.data = '']);

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'statusDesc': statusDesc,
      'data': data,
    };
  }

  factory SmartCaResult.fromMap(Map<String, dynamic> map) {
    return SmartCaResult(
      map['status']?.toInt() ?? 0,
      map['statusDesc'] ?? '',
      map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SmartCaResult.fromJson(String source) =>
      SmartCaResult.fromMap(json.decode(source));

  ///
  factory SmartCaResult.sendError(String message) => SmartCaResult(
        ResultCode.UNKNOWN_ERROR_CODE,
        message,
      );

  ///
  factory SmartCaResult.userCancel([String message = "User Cancel"]) =>
      SmartCaResult(
        ResultCode.USER_CANCEL_CODE,
        ResultCodeDesc.USER_CANCEL,
        message,
      );
}
