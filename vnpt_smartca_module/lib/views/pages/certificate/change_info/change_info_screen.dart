import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../../core/models/response/certificate_model.dart';
import '../../../../core/models/response/profile_model.dart';
import '../../../controller/change_info_certiificate_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/config_input_decoration.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';

class ChangeInfoScreen extends StatelessWidget {
  final ProfileModel profileModel;
  final CertificateModel certificateModel;

  final ChangeInfoCertificateController changeInfoCertificateController = Get.find<ChangeInfoCertificateController>();

  ChangeInfoScreen({super.key, required this.profileModel, required this.certificateModel});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.changeInfoCTS,
      body: FormBuilder(
        key: changeInfoCertificateController.formKey,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      AppLocalizations.current.subscriber_information,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff0D75D6),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BaseText(
                      AppLocalizations.current.citizenIdFullLabel,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff08285C),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FormBuilderTextField(
                      name: 'citizenId',
                      initialValue: profileModel.uid,
                      // controller: controller.nameTEC,
                      readOnly: true,
                      decoration: ConfigInputDecoration().config(""),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        BaseText(
                          AppLocalizations.current.nameBusinessPersonal,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff08285C),
                        ),
                        const BaseText(
                          " *",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffE51F1F),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FormBuilderTextField(
                      name: 'name',
                      initialValue: profileModel.fullName,
                      readOnly: false,
                      // maxLength: 32,
                      // controller: changeInfoCertificateController.fullNameTEC,
                      decoration: ConfigInputDecoration()
                          .config("", borderColor: const Color(0xffA5B0C2), fillColor: Colors.white),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: AppLocalizations.current
                                .inputRequired(AppLocalizations.current.please_input_full_name)),
                        // FormBuilderValidators.maxLength(32, errorText: AppLocalizations.current.maxLength(32)),
                        FormBuilderValidators.notEqual(profileModel.fullName as Object,
                            errorText: AppLocalizations.current.please_input_different_name),
                        (val) {
                          return val?.toLowerCase().trim() == profileModel.fullName?.toLowerCase().trim()
                              ? AppLocalizations.current.please_input_different_name
                              : null;
                        },
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 25),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppButtonWidget(
                        label: AppLocalizations.current.back,
                        labelColor: const Color(0xff0D75D6),
                        backgroundColor: const Color(0xffE0F0FF),
                        doublePadding: 15,
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: AppButtonWidget(
                        label: AppLocalizations.current.Continue,
                        doublePadding: 15,
                        onTap: () {
                          // WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                          if (changeInfoCertificateController.formKey.currentState!.saveAndValidate()) {
                            debugPrint(true.toString());
                          } else {
                            debugPrint(false.toString());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
