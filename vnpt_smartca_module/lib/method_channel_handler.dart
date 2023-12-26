import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'core/models/app/smartca_message_result.dart';

typedef ListenerFunc = void Function(dynamic event);

@singleton
class MethodChannelHandler {
  final MethodChannel _channel =
      const MethodChannel('vnpt.plugins.io/smartca_messaging');

  static final MethodChannelHandler _singleton =
      MethodChannelHandler._internal();

  MethodChannelHandler._internal() {
    _channel.setMethodCallHandler(_handleMethod);
  }

  factory MethodChannelHandler() {
    return _singleton;
  }

  final _listeners = <String, ListenerFunc>{};

  Future<dynamic> _handleMethod(MethodCall call) async {
    final params = call.arguments;
    final callback = _listeners[call.method];
    callback!(params);
  }

  /// Hàm lắng nghe sự kiện từ host app
  void listen({required String method, required ListenerFunc listener}) {
    _listeners[method] = listener;
  }

  /// Gửi sự kiện tới host app
  Future<SmartCaResult?> send({required String method, SmartCaResult? data}) {
    return _channel.invokeMethod<SmartCaResult>(method, data?.toMap() ?? Map());
  }

  void dispose() {
    _listeners.clear();
  }
}

class MethodChannelNames {
  static const String getAuthentication = "getAuthentication";
  static String getAuthenticationResult = "getAuthenticationResult";

  static const String getWaitingTransaction = "getWaitingTransaction";
  static String getWaitingTransactionResult = "getWaitingTransactionResult";

  static String userCancel = "userCancel";
  static String configure = "VNPTSmartCASDK#start";
  static String isReady = "VNPTSmartCASDK#isReady";
  static String activeEKYC = "activeEKYC";
  static String activeEContract = "activeEContract";

  static const String getMainInfo = "getMainInfo";
  static String getMainInfoResult = "getMainInfoResult";
}
