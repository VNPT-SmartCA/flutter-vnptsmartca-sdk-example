import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/response/check_uid_response.dart';
import '../../../views/controller/base_controler.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

import '../../core/models/app/identity_card_model.dart';
import '../../core/models/request/ekyc_result_model.dart';
import '../../data/repository/confirm_information_repository.dart';
import '../i18n/generated_locales/l10n.dart';
import '../widgets/dialog_notification.dart';

class ConfirmInformationController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
  final formKeyOTP = GlobalKey<FormBuilderState>();

  final confirmInformationRepository = getIt<ConfirmInformationRepository>();

  RxString identifier = "".obs;
  RxBool obscureTextPassword = true.obs;
  RxBool obscureTextRePassword = true.obs;

  RxString statusAccount = "".obs;

  RxBool isCheckTerms = false.obs;
  RxBool isCheckRead = true.obs;
  RxBool isCheckDontWant = false.obs;

  TextEditingController nameTEC = TextEditingController();
  TextEditingController uidTEC = TextEditingController();
  TextEditingController provinceTEC = TextEditingController();
  TextEditingController addressDetailTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController phoneTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  TextEditingController addressOnDocumentTEC = TextEditingController();

  final listAllWards = Rx<List<WardInformationModel>>([]);
  RxBool registerSuccess = false.obs;

  onFormSubmit(EkycResponseModel ekycModel) {
    if (formKey.currentState!.saveAndValidate()) {
      if (isCheckTerms.value) {
        ekycModel.email = emailTEC.text.toLowerCase();
        ekycModel.password = passwordTEC.text;
        ekycModel.ocrResult.recentlyLocation = addressDetailTEC.text;
        ekycModel.ocrResult.street = addressDetailTEC.text.capitalize;
        ekycModel.notAllowReceivedAds = isCheckDontWant.value;

        if (ekycModel.loaiGiayTo == identityCards[0].name) {
          ekycModel.ocrResult.name = ekycModel.ocrResult.name.capitalize!;
        }

        register(ekycModel);
      } else {
        Get.dialog(DialogNotification(
          content: AppLocalizations.current.requestAcceptTerms,
          onlyActionAccept: true,
          titleBtnAccept: AppLocalizations.current.close,
        ));
      }
    }
  }

  void getAllAddress() async {
    try {
      final failureOrVerified =
          await confirmInformationRepository.getAllAddress();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          listAllWards.value = result;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void register(EkycResponseModel ekycModel) async {
    showLoading();
    try {
      final failureOrVerified =
          await confirmInformationRepository.register(ekycModel);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          registerSuccess.value = true;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
}
