// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../../configs/app_config.dart';
import '../../../../core/extensions/string.dart';
import '../../../pages/register_account/otp_verify/index.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';

import '../../../../configs/injector/injector.dart';
import '../../../../../core/models/request/ekyc_result_model.dart';
import '../../../../../core/services/device_info.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/register_account_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/common.dart';
import '../../../utils/config_input_decoration.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_loading.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/dialog_notification.dart';
import '../../active_account/bottom_contact.dart';
import '../scan_qrcode/index.dart';
import '../tutorial_register_account/index.dart';

class RegisterAccountPage extends StatelessWidget {
  final controller = Get.put(RegisterAccountController());

  final _deviceInfoService = getIt<DeviceInfoService>();
  final passwordMaxLength = 250;
  final maxLength12 = 12;
  final maxLength10 = 10;
  final maxLength8 = 8;
  int maxLengthIdentifier = 12;
  int minLengthIdentifier = 12;
  int indexDropDownSelected = 0;

  @override
  Widget build(BuildContext context) {
    controller.txtTypeCardController.text =
        AppLocalizations.current.citizenIdentification;
    controller.checkUidResponse.listen((model) async {
      if (model != null) {
        if (model.code == 60000) {
          // TAI KHOAN DA TON TAI
          Get.dialog(DialogNotification(
            content: AppLocalizations.current.accountRegisteredSuccessfully,
            titleBtnAccept: AppLocalizations.current.signIn,
            actionAccept: () {
              Get.back();
            },
          ));
        } else {
          var deviceInfo = await _deviceInfoService.getDeviceInfo();
          var checkUidModel = model.content;
          OcrResult ocrResult = OcrResult(
            id: checkUidModel?.uid ?? controller.identifierTEC.value.text,
            name: checkUidModel?.fullName ?? "",
            originLocation: "",
            recentlyLocation: checkUidModel?.address?.streetName ?? "",
            issuePlace: checkUidModel?.noiCap ?? "",
            issueDate: checkUidModel?.ngayCap ?? "",
            gender: "",
            validDate: "",
            city: checkUidModel?.provinceName ?? "",
            district: checkUidModel?.districtName ?? "",
            ward: checkUidModel?.wardName ?? "",
            street: checkUidModel?.address?.streetName ?? "",
            cardType: "",
            cityId: checkUidModel?.address?.provinceId ?? "",
            districtId: checkUidModel?.address?.districtId ?? "",
            wardId: checkUidModel?.address?.wardId ?? "",
          );
          EkycResponseModel ekycResponseModel = EkycResponseModel(
            ekycCode: checkUidModel?.ekycCode ?? "",
            ekycExpiredTime: "",
            ocrResult: ocrResult,
            loaiGiayTo: controller.txtTypeCardController.text ==
                    AppLocalizations.current.businessRegistrationCertificate
                ? "mst"
                : (controller.txtTypeCardController.text ==
                        AppLocalizations.current.passport
                    ? "hc"
                    : "cccd"),
            password: controller.passwordTEC.text,
            phone: controller.phoneTEC.text,
            deviceId: deviceInfo.deviceId,
            email: checkUidModel?.email,
          );
          if (model.code == 0) {
            // TAI KHOAN MOI
            if (controller.txtTypeCardController.text !=
                AppLocalizations.current.citizenIdentification) {
              // SHOW POPUP HOTLINE
              Get.dialog(DialogNotification(
                image: Assets.images.icDialogFail,
                content: AppLocalizations.current
                    .registerAccountContactHotline(AppConfig.hotline),
                titleBtnAccept: AppLocalizations.current.support,
                actionAccept: () {
                  Common.callHotline;
                },
              ));
            } else {
              // => VERIFY OTP
              Get.to(
                () => OTPVerifyPage(
                  ekycResponseModel: ekycResponseModel,
                  requiredEKYC: model.content?.requiredEkyc ?? true,
                ),
              );
            }
          } else {
            if (model.code == 60013) {
              // ERROR EKYC
              Get.dialog(DialogNotification(
                image: Assets.images.icDialogFail,
                content: AppLocalizations.current
                    .ekycErrorContactHotline(AppConfig.hotline),
                titleBtnAccept: AppLocalizations.current.support,
                actionAccept: () {
                  Common.callHotline;
                },
              ));
            } else if (model.code == 60001) {
              // ERROR PHONE NUMBER NOT MATCH
              Get.dialog(DialogNotification(
                image: Assets.images.icDialogFail,
                title: AppLocalizations.current.phoneNumberIncorrect,
                content: AppLocalizations.current.enterPhoneNumberForRegister,
                titleBtnAccept: AppLocalizations.current.support,
                actionAccept: () {
                  Common.callHotline;
                },
              ));
            } else if (model.code == 60002 || model.code == 60003) {
              ekycResponseModel.registered3rd = true;
              Get.to(
                () => OTPVerifyPage(
                  ekycResponseModel: ekycResponseModel,
                  requiredEKYC: model.content?.requiredEkyc ?? true,
                ),
              );
            }
          }
        }
      }
    });
    return BaseScreen(
      loadingWidget: BaseLoading<RegisterAccountController>(),
      title: AppLocalizations.current.certificate_package_register_account,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormBuilder(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            AppLocalizations.current.registrationCardType,
                            isRequired: true,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff08285C),
                          ),
                          SizedBox(height: 10),
                          CustomDropDown(
                            selectedIndex: indexDropDownSelected,
                            didSelected: (index) async {
                              if (index != indexDropDownSelected) {
                                indexDropDownSelected = index;
                                maxLengthIdentifier = indexDropDownSelected == 0
                                    ? 12
                                    : (indexDropDownSelected == 1 ? 8 : 13);
                                minLengthIdentifier = indexDropDownSelected == 0
                                    ? 12
                                    : (indexDropDownSelected == 1 ? 8 : 10);
                                controller.typeDocumentSelected.value =
                                    indexDropDownSelected == 0
                                        ? TypeDocument.cccd
                                        : (indexDropDownSelected == 1
                                            ? TypeDocument.hc
                                            : TypeDocument.mst);
                                await Future.delayed(
                                    const Duration(milliseconds: 200));
                                controller.formKey.currentState!
                                    .saveAndValidate();
                              }
                            },
                            listValues: controller.listStrTypeCard,
                          ),
                          SizedBox(height: 20),
                          BaseText(
                            AppLocalizations.current.idNumber,
                            isRequired: true,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff08285C),
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () => FormBuilderTextField(
                              name: 'identifier',
                              controller: controller.identifierTEC.value,
                              maxLength: maxLengthIdentifier,
                              keyboardType: [
                                TypeDocument.mst,
                                TypeDocument.cccd
                              ].contains(controller.typeDocumentSelected.value)
                                  ? TextInputType.number
                                  : TextInputType.text,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(
                                    indexDropDownSelected == 1
                                        ? '[a-zA-Z0-9]'
                                        : '[0-9]'))
                              ],
                              decoration: ConfigInputDecoration().config(
                                AppLocalizations.current.usernamePlacehoder,
                                // suffixIcon: indexDropDownSelected != 0
                                //     ? null
                                //     : IconButton(
                                //         onPressed: () {
                                //           Get.to(() => ScanQRCodeScreen())
                                //               ?.then((value) {
                                //             if (value is String &&
                                //                 value.isNotEmpty) {
                                //               controller.identifierTEC.value
                                //                   .text = value;
                                //             }
                                //           });
                                //         },
                                //         icon: Assets.images.icScanQr.image(
                                //             width: 24,
                                //             height: 24,
                                //             fit: BoxFit.fill),
                                //         color: Color(0xff0D75D6),
                                //       ),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: AppLocalizations.current
                                        .inputRequired(AppLocalizations
                                            .current.usernamePlacehoder)),
                                FormBuilderValidators.minLength(
                                    minLengthIdentifier,
                                    errorText: AppLocalizations.current
                                        .enoughLength(AppLocalizations
                                            .current.validate10or13)),
                                FormBuilderValidators.maxLength(
                                    maxLengthIdentifier,
                                    errorText: AppLocalizations.current
                                        .enoughLength(AppLocalizations
                                            .current.validate10or13)),
                                (value) {
                                  if (maxLengthIdentifier == 8 &&
                                      !value!.isValidPassport) {
                                    return AppLocalizations
                                        .current.validate_passport_error;
                                  } else if (maxLengthIdentifier == 13 &&
                                      value?.length != 10 &&
                                      value?.length != 13) {
                                    return AppLocalizations.current
                                        .enoughLength(AppLocalizations
                                            .current.validate10or13);
                                  }
                                },
                              ]),
                            ),
                          ),
                          SizedBox(height: 10),
                          BaseText(
                            AppLocalizations.current.noteIdentifier,
                            color: Color(0xff5768A5),
                          ),
                          SizedBox(height: 20),
                          BaseText(
                            AppLocalizations.current.phone,
                            isRequired: true,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff08285C),
                          ),
                          SizedBox(height: 10),
                          FormBuilderTextField(
                            name: 'phone',
                            textInputAction: TextInputAction.done,
                            onSubmitted: (value) => controller.onFormSubmit(),
                            controller: controller.phoneTEC,
                            maxLength: maxLength10,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            decoration: ConfigInputDecoration().config(
                                AppLocalizations.current
                                    .certificate_packageuser_form_contact_certificate_info_item_phone_hint_text),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: AppLocalizations.current
                                      .inputRequired(
                                          AppLocalizations.current.phone)),
                              FormBuilderValidators.maxLength(maxLength12,
                                  errorText: AppLocalizations.current
                                      .maxLength(maxLength12)),
                              (value) {
                                if (!value!.isValidPhone) {
                                  return AppLocalizations.current
                                      .certificate_package_validate_phone_error;
                                }
                              },
                            ]),
                            onChanged: (text) {
                              if (text == " ") {
                                return;
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          BaseText(
                            AppLocalizations.current.notePhoneNumber,
                            color: Color(0xff5768A5),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        Get.to(TutorialRegisterAccountPage());
                      },
                      child: Row(
                        children: [
                          Assets.images.messageQuestion.image(
                            width: 20,
                            height: 20,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(width: 5),
                          BaseText(
                            AppLocalizations.current.tutorialRegisterAccount,
                            color: Color(0xff0D75D6),
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: AppButtonWidget(
              label: AppLocalizations.current.next,
              doublePadding: 15,
              onTap: () {
                controller.onFormSubmit();
              },
            ),
          ),
          SizedBox(height: 10),
          BottomContact(),
        ],
      ),
    );
  }
}

class TypeCardModel {
  int id;
  String name;

  TypeCardModel(this.id, this.name);
}
