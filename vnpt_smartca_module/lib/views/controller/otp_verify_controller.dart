import 'package:get/get.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../data/repository/otp_verify_repository.dart';
import '../../../views/controller/base_controler.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

import '../../core/models/request/ekyc_result_model.dart';

class OTPVerifyController extends BaseController {
  final otpVerifyRepository = getIt<OTPVerifyRepository>();

  RxBool successVerifyOTP = false.obs;
  RxBool successResendOTP = false.obs;

  void verifyOTP(EkycResponseModel ekycModel) async {
    showLoading();
    try {
      final failureOrVerified = await otpVerifyRepository.verifyOTP(ekycModel);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          successVerifyOTP.value = true;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void resendOTP(EkycResponseModel ekycModel) async {
    showLoading();
    try {
      final failureOrVerified = await otpVerifyRepository.resendOTP(ekycModel);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          successResendOTP.value = true;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
}
