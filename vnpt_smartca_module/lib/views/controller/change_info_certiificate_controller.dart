import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/extensions/either_data.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../core/models/response/number_sign_model.dart';
import '../../../core/models/response/order_cert_model.dart';
import '../../../core/models/response/profile_model.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../data/repository/certificate_repository.dart';
import '../../../data/repository/order_cert_repository.dart';
import '../../../views/pages/certificate/change_info/change_info_screen.dart';
import '../../../views/utils/exception_handler.dart';

import '../../core/utils/constants.dart';
import '../widgets/dialog/common_dialog.dart';
import 'base_controler.dart';

class ChangeInfoCertificateController extends BaseController {

  final certRepository = getIt<CertificateRepository>();
  final orderCertRepository = getIt<OrderCertRepository>();
  final secureStorage = getIt<SecureLocalStorageService>();

  ProfileModel? profileModel;

  // use for ma gioi thieu
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  TextEditingController fullNameTEC = TextEditingController();

  Future<int?> getNumberSign(String certId) async {
    showLoading();
    try {
      final failureOrVerified = await certRepository.getNumberSign(certId);
      hideLoading();
      if (failureOrVerified.isLeft()) {
        showErrorModal(exceptionHandler(failureOrVerified.asLeft()));
        return null;
      } else {
        NumberSignModel numberSignModel = NumberSignModel.fromJson(failureOrVerified.asRight().content);
        numberSignModel.id;
        int numberSign = numberSignModel.totalSignLimit! - numberSignModel.signedTurn!;
        return numberSign;
      }
    } catch (e, s) {
      hideLoading();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
      return null;
    }
  }

  Future<OrderCertModel?> createOrder(String certSerial, String pricingCode) async {
    showLoading();
    try {
      if (profileModel == null) {
        String? profileString = await secureStorage.getLastData(LOCAL_USER_PROFILE);
        profileModel = ProfileModel.fromJson(jsonDecode(profileString!));
      }
      final failureOrVerified = await orderCertRepository.createExtendOrder(certSerial, pricingCode);
      hideLoading();
      if (failureOrVerified.isLeft()) {
        showErrorModal(exceptionHandler(failureOrVerified.asLeft()));
        return null;
      } else {
        OrderCertModel numberSignModel = OrderCertModel.fromJson(failureOrVerified.asRight().content);
        numberSignModel.code = failureOrVerified.asRight().code;
        return numberSignModel;
        // int numberSign = numberSignModel.totalSignLimit! - numberSignModel.signedTurn!;
        // return numberSign;
      }
    } catch (e, s) {
      hideLoading();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
      return null;
    }
  }

  handleCert(CertificateModel certificateModel) async {
    String? profileString = await secureStorage.getLastData(LOCAL_USER_PROFILE);
    profileModel = ProfileModel.fromJson(jsonDecode(profileString!));

    // kiem tra tai khoan doanh nghiep hay ca nhan
    if (profileModel == null) {
      return;
    }
    // di chuyen toi man hinh doi thong tin
    Get.to(() => ChangeInfoScreen(profileModel: profileModel!, certificateModel: certificateModel));
  }
}