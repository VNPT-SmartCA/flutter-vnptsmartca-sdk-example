// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../views/controller/auth_controller.dart';
import '../../../views/i18n/generated_locales/l10n.dart';

import '../../configs/injector/injector.dart';
import '../../core/models/app/exceptions.dart';
import '../../core/models/app/user_info_on_device.dart';
import '../../core/services/biometrics.dart';

import '../../core/services/user_info_on_device.dart';
import '../utils/exception_handler.dart';
import '../widgets/dialog/common_dialog.dart';

class LoginController extends GetxController {
  final authController = Get.find<AuthController>();

  final _biometricsService = getIt<BiometricsService>();
  final _userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();

  final formKey = GlobalKey<FormBuilderState>();

  final obscureText = true.obs;
  final userInfoList = Rx<List<UserInfoOnDeviceModel>>([]);
  final showUsernameInput = true.obs;
  @override
  void onReady() {
    super.onReady();

    init();
  }

  init() async {
    try {
      userInfoList.value = await _userInfoOnDeviceService.getAllUsers();
      if (userInfoList.value.isNotEmpty) {
        authController.currentUser.value = userInfoList.value.first;
        showUsernameInput.value = false;
      } else {
        showUsernameInput.value = true;
      }
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  onFormSubmit() async {
    if (formKey.currentState!.saveAndValidate()) {
      final values = formKey.currentState!.value;
      String? uid = values["uid"];
      uid ??= authController.currentUser.value?.uid;

      if (uid == null) return;

      final result = await authController.onLogin(uid, values['password']);
      if (result == true) {
        showUsernameInput.value = false;
        userInfoList.value = await _userInfoOnDeviceService.getAllUsers();
      }
    }
  }

  loginWithBiometric() async {
    try {
      var authenticated = await _biometricsService.authenticateWithBiometrics();

      if (authenticated) {
        authController.onLogin(authController.currentUser.value!.uid,
            authController.currentUser.value!.password);
      }
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  onSelectedAccount(String? onSelected) {
    try {
      if (onSelected == null) return;

      final index = userInfoList.value.indexWhere(
        (element) => element.uid == onSelected,
      );

      formKey.currentState?.reset();

      if (index == -1) {
        authController.currentUser.value = UserInfoOnDeviceModel(
            uid: AppLocalizations.current.addAccount, password: "");

        showUsernameInput.value = true;

        Future.delayed(const Duration(milliseconds: 250),
            () => formKey.currentState?.fields["uid"]?.focus());
      } else {
        authController.currentUser.value = userInfoList.value.firstWhere(
          (element) => element.uid == onSelected,
        );

        showUsernameInput.value = false;
      }
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  removeAccount(String uid) async {
    await _userInfoOnDeviceService.removeUser(uid);

    final allUsers = await _userInfoOnDeviceService.getAllUsers();

    if (allUsers.length == 0) {
      showUsernameInput.value = true;
      authController.currentUser.value;
    } else {
      authController.currentUser.value = allUsers.first;
    }

    Get.back(closeOverlays: true);

    userInfoList.value = allUsers;
  }
}
