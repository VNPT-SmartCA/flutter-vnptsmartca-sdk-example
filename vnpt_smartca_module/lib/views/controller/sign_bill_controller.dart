import 'dart:convert';

import 'package:get/get.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../views/controller/base_controler.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

import '../../core/models/response/order_cert_model.dart';
import '../../data/repository/sign_bill_repository.dart';

class SignBillController extends BaseController {
  final signBillRepository = getIt<SignBillRepository>();

  RxString contentBill = "".obs;
  RxString contentBillSignature = "".obs;
  RxBool checkIRead = true.obs;
  final resultUploadContract = Rx<OrderCertModel?>(null);

  void getBill(String? serial) async {
    if (serial == null) {
      return;
    }
    showLoading();
    try {
      final failureOrVerified = await signBillRepository.getBill(serial);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          contentBill.value = utf8.fuse(base64).decode(result);
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void saveSignatureImage(String? serial, String base64SignatureImage) async {
    if (serial == null) {
      return;
    }
    // showLoading();
    try {
      final failureOrVerified = await signBillRepository.saveSignatureImage(serial, base64SignatureImage);
      // hideLoading();
      failureOrVerified.fold(
        (failure) => {
          Get.back(),
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          contentBillSignature.value = result;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void uploadOrderContract(String? orderId, String base64Contract) async {
    if (orderId == null) {
      return;
    }
    // showLoading();
    try {
      final failureOrVerified = await signBillRepository.uploadOrderContract(orderId, base64Contract);
      // hideLoading();
      failureOrVerified.fold(
        (failure) => {
          Get.back(),
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          resultUploadContract.value = result;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
}
