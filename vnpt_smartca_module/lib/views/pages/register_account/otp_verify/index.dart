// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/otp_verify_controller.dart';
import '../../../widgets/base_screen.dart';

import '../../../../core/models/request/ekyc_result_model.dart';
import '../../../../core/utils/enums.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/buy_certificate_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_loading.dart';
import '../../../widgets/base_text.dart';
import '../../../widgets/dialog_notification.dart';
import '../../active_account/bottom_contact.dart';
import '../../active_account/setup_pin_code/widget/create_pin_code_widget.dart';
import '../confirm_information/index.dart';

class OTPVerifyPage extends StatefulWidget {
  final bool requiredEKYC;
  final EkycResponseModel ekycResponseModel;

  const OTPVerifyPage(
      {Key? key, required this.ekycResponseModel, required this.requiredEKYC})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => OTPVerifyState();
}

class OTPVerifyState extends State<OTPVerifyPage> {
  late FocusNode _focusNode;

  bool hasError = false;
  String errorMsg = '';
  String pin = '';

  final controller = Get.put(OTPVerifyController());
  final controllerEkyc = Get.put(BuyCertificateController());

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    controllerEkyc.ekycErrorCount = 0;
    controller.successVerifyOTP.listen((success) async {
      if (success) {
        // VERIFY OTP SUCCESS
        controller.successVerifyOTP.value = false;
        if (widget.requiredEKYC) {
          controllerEkyc.isFlowRegister = true;
          controllerEkyc.uid = widget.ekycResponseModel.ocrResult.id;
          controllerEkyc.eKycUserEnroll().then((value) {
            debugPrint("result ekyc >>>>: $value");

            if (value == VerifyInfoType.error3times) {
              // back to login
              Navigator.popUntil(context, (route) => route.isFirst);
            } else if (value is EkycResponseModel) {
              // ekyc success
              value.password = widget.ekycResponseModel.password;
              value.loaiGiayTo = widget.ekycResponseModel.loaiGiayTo;
              value.phone = widget.ekycResponseModel.phone;
              value.deviceId = widget.ekycResponseModel.deviceId;
              value.otp = pin;
              Get.to(() => ConfirmInformationPage(
                    ekycResponseModel: value,
                    fromEKYC: true,
                  ));
            } else if (value == null) {
              Get.back();
            }
          });
        } else {
          Get.to(() => ConfirmInformationPage(
              ekycResponseModel: widget.ekycResponseModel));
        }
      }
    });
    controller.successResendOTP.listen((success) async {
      if (success) {
        // RESEND OTP SUCCESS
        controller.successResendOTP.value = false;
      }
    });
  }

  // ignore: avoid-unused-parameters
  void verifyOTP(String pin) {
    _focusNode.unfocus();
    if (checkValidPin()) {
      // API OTP
      widget.ekycResponseModel.otp = pin;
      controller.verifyOTP(widget.ekycResponseModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      loadingWidget: BaseLoading<OTPVerifyController>(),
      title: AppLocalizations.current.inputOTP,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Assets.images.icDialogLock.image(
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(
                          AppLocalizations.current.otpSendToPhone,
                          textOverflow: TextOverflow.visible,
                          height: 24 / 14,
                          color: Color(0xff5768A5),
                        ),
                        SizedBox(width: 2),
                        BaseText(
                          widget.ekycResponseModel.phone,
                          color: Color(0xff5768A5),
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: CreatePinCodeTextField(
                        // ignore: prefer-extracting-callbacks
                        // shape: PinCodeFieldShape.box,
                        showTitle: false,
                        callback: (value) {
                          setState(() {
                            pin = value;
                          });
                        },
                        focusNode: _focusNode,
                        onCompleteCallback: verifyOTP,
                      ),
                    ),
                    hasError
                        ? Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: BaseText(
                              errorMsg,
                              fontSize: 12,
                              color: Color(0xffE51F1F),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(
                          AppLocalizations.current.reciveOTP,
                          color: Color(0xff5768A5),
                        ),
                        SizedBox(width: 2),
                        InkWell(
                          onTap: () {
                            controller.resendOTP(widget.ekycResponseModel);
                          },
                          child: BaseText(
                            AppLocalizations.current.resendOTP,
                            color: Color(0xff0D75D6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          AppButtonWidget(
            label: AppLocalizations.current.confirm,
            doublePadding: 15,
            onTap: () {
              verifyOTP(pin);
            },
          ),
          SizedBox(height: 10),
          BottomContact(),
        ]),
      ),
    );
  }

  bool checkValidPin() {
    bool temp = false;
    try {
      var reg = "012345678901234567890";
      var req1 = "987654321098765432109";
      hasError = false;
      errorMsg = "";
      if (pin.length != 6) {
        setState(() {
          hasError = true;
          errorMsg = AppLocalizations.current.pinValidateSixDigit;
        });
        temp = false;
      } else if (reg.contains(pin) || req1.contains(pin)) {
        setState(() {
          hasError = true;
          errorMsg = AppLocalizations.current.pinValidateSequence;
        });
        temp = false;
      } else if (int.parse(pin) % 111111 == 0) {
        setState(() {
          hasError = true;
          errorMsg = AppLocalizations.current.pinValidateTheSame;
        });
        temp = false;
      } else {
        temp = true;
      }
    } catch (e) {
      onShowError(e.toString());
      temp = false;
    }
    return temp;
  }

  void onShowError(String content) {
    Get.dialog(
      DialogNotification(
        content: content,
        onlyActionCancel: true,
      ),
    );
  }
}
