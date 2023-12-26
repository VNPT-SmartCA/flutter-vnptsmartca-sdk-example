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
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/certificate/extend/select_cert_pack_screen.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog_notification.dart';

import '../../core/utils/constants.dart';
import '../widgets/dialog/common_dialog.dart';
import 'base_controler.dart';

class ExtendCertificateController extends BaseController {
  final certRepository = getIt<CertificateRepository>();
  final orderCertRepository = getIt<OrderCertRepository>();
  final secureStorage = getIt<SecureLocalStorageService>();

  ProfileModel? profileModel;

  // use for ma gioi thieu
  GlobalKey<FormBuilderState> formKey4 = GlobalKey<FormBuilderState>();

  Future<bool> checkIndividualOrBusinessesAccount(String actionText) async {
    try {
      if (profileModel == null) {
        String? profileString = await secureStorage.getLastData(LOCAL_USER_PROFILE);
        profileModel = ProfileModel.fromJson(jsonDecode(profileString!));
      }
      if (profileModel?.isIndividual()) {
        // tai khoan ca nhan
        return true;
      } else {
        // tai khoan doanh nghiep -> hien thi dialog
        Get.dialog(
          DialogNotification(
            content: AppLocalizations.current
                .notice_cert_action_for_business_account(actionText.toLowerCase().replaceAll("\n", " ")),
            onlyActionAccept: false,
            contentAlign: TextAlign.justify,
            titleBtnAccept: AppLocalizations.current.send,
            titleBtnCancel: AppLocalizations.current.close,
            actionCancel: () {
              // todo
            },
            actionAccept: () {
              // todo
            },
          ),
        );
        return false;
      }
    } catch (e) {
      return false;
    }
  }

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

  handleCert(CertificateModel certificateModel) {
    if (certificateModel.serial == null) {
      return;
    }

    int? signType = certificateModel.orderInfo?.signType;

    if (signType == null) {
      return;
    }

    if (signType == 0) {
      Get.to(() => SelectCertPackScreen(
            certSerial: certificateModel.serial!,
          ));
    } else {
      getNumberSign(certificateModel.id).then((value) {
        if (value == null) {
          // nothing todo
        } else if (value <= 0) {
          // chuyen sang man chon goi cuoc
          Get.to(() => SelectCertPackScreen(certSerial: certificateModel.serial!));
        } else if (value > 0) {
          // hien thi thong bao con bao nhieu luot ky
          Get.dialog(
            DialogNotification(
              // title: AppLocalizations.current.you_need_know,
              content: AppLocalizations.current.warning_number_sign(value),
              // image: image,
              // onlyActionCancel: true,
              titleBtnAccept: AppLocalizations.current.extend_now,
              titleBtnCancel: AppLocalizations.current.canceled,
              actionCancel: () {
                // Get.back();
              },
              actionAccept: () {
                Get.to(() => SelectCertPackScreen(certSerial: certificateModel.serial!));
              },
            ),
          );
        }
      });
    }
  }
}
