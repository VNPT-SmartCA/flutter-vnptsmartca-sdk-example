import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../data/repository/check_uid_repository.dart';
import '../../../views/controller/base_controler.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

import '../../core/models/response/check_uid_response.dart';
import '../i18n/generated_locales/l10n.dart';

enum TypeDocument {cccd, hc, mst}

class RegisterAccountController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
  final checkUidRepository = getIt<CheckUidRepository>();
  final checkUidResponse = Rx<CheckUidResponse?>(null);
  final typeDocumentSelected = Rx<TypeDocument>(TypeDocument.cccd);

  RxBool obscureTextPassword = true.obs;
  RxBool obscureTextRePassword = true.obs;

  final identifierTEC = Rx<TextEditingController>(TextEditingController());
  final passwordTEC = TextEditingController();
  final phoneTEC = TextEditingController();

  List<String> listStrTypeCard = [
    AppLocalizations.current.citizenIdentification,
    AppLocalizations.current.passport,
    AppLocalizations.current.businessRegistrationCertificate,
  ];

  TextEditingController txtTypeCardController = TextEditingController();

  onFormSubmit() {
    if (formKey.currentState!.saveAndValidate()) {
      final values = formKey.currentState!.value;
      checkUid(values["identifier"], values["phone"], typeDocumentSelected.value.name);
    }
  }

  String? validateTypeCard(String? value) {
    if (GetUtils.isBlank(value) == true) {
      return AppLocalizations.current.certificate_package_validate_input_error;
    } else if (!listStrTypeCard.contains(value)) {
      return AppLocalizations.current.pleaseSelectDataInList;
    }
    return null;
  }

  void checkUid(String identifier, String phone, String typeDocument) async {
    showLoading();
    try {
      final failureOrVerified = await checkUidRepository.checkUid(identifier, phone, typeDocument);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          checkUidResponse.value = result;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
}
