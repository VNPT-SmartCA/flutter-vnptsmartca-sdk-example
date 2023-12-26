// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

import '../../configs/injector/injector.dart';
import 'user_info_on_device.dart';

class BiometricsService {
  late String localizedReason;
  late Iterable<AuthMessages> authMessages;

  init(String localizedReason, Iterable<AuthMessages> authMessages) {
    this.localizedReason = localizedReason;
    this.authMessages = authMessages;
  }

  final LocalAuthentication auth = LocalAuthentication();
  final userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();

  Future<bool> isDeviceSupported() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics =
          await auth.canCheckBiometrics || await auth.isDeviceSupported();
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
    }

    return canCheckBiometrics;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
    }
    return availableBiometrics;
  }

  Future<bool> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: localizedReason,
        authMessages: authMessages,
        options: const AuthenticationOptions(
          stickyAuth: false,
          biometricOnly: true,
          sensitiveTransaction: false,
          useErrorDialogs: true,
        ),
      );
    } catch (e) {
      authenticated = false;
    }

    return authenticated;
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
  }
}
