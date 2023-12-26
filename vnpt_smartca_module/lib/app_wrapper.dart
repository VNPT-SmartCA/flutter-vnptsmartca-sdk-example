// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:vnpt_smartca_module/method_channel_handler.dart';
import '../../../views/controller/app_controller.dart';
import '../../../views/controller/auth_controller.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/login/index.dart';
import '../../../views/pages/warning/index.dart';
import '../../../views/utils/enums.dart';
import '../../../views/widgets/show_snackbar_widget.dart';

import 'configs/app_config.dart';
import 'views/pages/certificate/select_cert_screen.dart';
import 'views/pages/main/main_page.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({Key? key}) : super(key: key);

  @override
  State<AppWrapper> createState() => _SmartCAAppState();
}

class _SmartCAAppState extends State<AppWrapper> {
  final appController = Get.find<AppController>();
  final authController = Get.find<AuthController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appController.isNetworkConnected.listen(_getNetworkStatus);
  }

  _getNetworkStatus(bool value) {
    if (value == false) {
      showSnackBarWidget(
        message: AppLocalizations.current.noInternet,
        icon: const Icon(
          Icons.wifi_off,
          color: Colors.white,
          size: 32,
        ),
      );
    } else {
      if (Get.isSnackbarOpen) Get.back(closeOverlays: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Kiểm tra thiết bị thật hay ko
      final showWarningScreen = AppConfig.environment != Environment.dev &&
          (appController.isJailbroken.value ||
              !appController.isPhysicalDevice.value ||
              !appController.isValidPlatform.value);

      // Kiểm tra tài khoản
      Widget widget = Container();
      if (showWarningScreen && kReleaseMode) {
        widget = const WarningScreen();
        return widget;
      }

      final authStatus = authController.authStatus.value;
      final currentHostAppMethod = appController.currentHostAppMethod.value;

      switch (authStatus) {
        case AuthenticationStatus.unauthenticated:
          widget = LoginPage();
          break;
        case AuthenticationStatus.authenticated:
          widget = currentHostAppMethod == MethodChannelNames.getAuthentication ?
          SelectCertScreen() : MainPage();///Todo : check
          break;
        case AuthenticationStatus.unknown:
        case AuthenticationStatus.unactivated:
        case AuthenticationStatus.expired:
          break;
      }

      return widget;

      // return GestureDetector(
      //   // ignore: prefer-extracting-callbacks
      //   onTap: () {
      //     final currentFocus = FocusScope.of(context);
      //     if (!currentFocus.hasPrimaryFocus) {
      //       currentFocus.unfocus();
      //     }
      //   },
      //   child: widget,
      // );
    });
  }
}
