import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/injector/injector.dart';
import '../../../data/repository/authen_repository.dart';
import '../../../views/controller/base_controler.dart';
import '../../../views/pages/input_otp/index.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

class InputOTPController extends BaseController {
  final repository = getIt<AuthenRepository>();

  final formKeyCountTimeOTP = GlobalKey<CountTimeOTPWidgetState>();

  RxBool isCallSuccess = false.obs;

  Future sendOTP(String citizenId, String phoneNumber) async {
    isCallSuccess.value = false;
    showLoading();
    final result = await repository.sendOTP(citizenId, phoneNumber);

    result.fold(
        (failure) => showErrorModal(exceptionHandler(failure), callback: () {
              Get.back();
            }), (r) {
      isCallSuccess.value = true;
      formKeyCountTimeOTP.currentState?.startTimer();
    });
    hideLoading();
  }

  Future verifyOTP(String citizenId, String phoneNumber, String otp) async {
    isCallSuccess.value = false;
    showLoading();
    final result = await repository.verifyOTP(citizenId, phoneNumber, otp);
    result.fold((failure) {
      hideLoading();
      showErrorModal(exceptionHandler(failure));
    }, (r) {
      // isCallSuccess.value = true;
      // formKeyCountTimeOTP.currentState?.startTimer();
      // OTPResponse otpResponse = OTPResponse.fromJson(r);
      hideLoading();
      Get.back(result: true);
      // todo success
    });
  }
}
