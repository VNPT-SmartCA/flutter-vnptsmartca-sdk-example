import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/response/user_status_model.dart';
import '../../../data/repository/verify_identifier_repository.dart';
import '../../../views/controller/base_controler.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

class EnterIdentifierController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
  final verifyIdentifierRepository = getIt<VerifyIdentifierRepository>();

  RxString identifier = "".obs;
  final userStatusModel = Rx<UserStatusModel?>(null);

  onFormSubmit() {
    if (formKey.currentState!.saveAndValidate()) {
      final values = formKey.currentState!.value;
      identifier.value = values["identifier"];
      verifyIdentifier(values["identifier"]);
    }
  }

  void verifyIdentifier(String identifier) async {
    showLoading();
    try {
      final failureOrVerified = await verifyIdentifierRepository.checkUserStatus(identifier);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          userStatusModel.value = result;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
}
