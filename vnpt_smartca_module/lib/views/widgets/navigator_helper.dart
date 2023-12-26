import 'dart:io';

import 'package:flutter/services.dart';
import 'package:vnpt_smartca_module/configs/injector/injector.dart';
import 'package:vnpt_smartca_module/core/models/app/smartca_message_result.dart';
import 'package:vnpt_smartca_module/method_channel_handler.dart';

class NavigatorHandler {
  NavigatorHandler._();

  static final MethodChannelHandler _methodChannelHandler =
  getIt<MethodChannelHandler>();

  ///
  static closeSDK() {
    if (Platform.isIOS) {
      _methodChannelHandler.send(
          method: MethodChannelNames.userCancel,
          data: SmartCaResult.userCancel());
    } else {
      SystemNavigator.pop();
    }
  }
}