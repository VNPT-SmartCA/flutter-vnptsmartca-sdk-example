// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/models/response/certificate_model.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/buy_certificate_controller.dart';
import '../../../pages/active_account/header_step.dart';
import '../../../pages/active_account/setup_pin_code/widget/create_pin_code_widget.dart';
import '../../../pages/active_account/setup_pin_code/widget/re_pin_code_widget.dart';
import '../../../widgets/widget.dart';

import '../../../../configs/injector/injector.dart';
import '../../../../core/services/biometrics.dart';
import '../../../../gen/assets.gen.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/dialog_notification.dart';
import '../bottom_contact.dart';

class SetupPinCodePage extends StatefulWidget {
  final CertificateModel? certificateModel;

  const SetupPinCodePage({Key? key, this.certificateModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SetupPinCodeState();
}

class _SetupPinCodeState extends State<SetupPinCodePage> {

  final controller = Get.put(BuyCertificateController());
  final biometricService = getIt<BiometricsService>();

  late FocusNode _focusNode;
  late FocusNode _focusNode1;

  bool hasError = false;
  String errorMsg = '';

  bool hasError1 = false;
  String errorMsg1 = '';

  String pin = '';
  String rePin = '';
  bool isSwitched = true;
  bool isDeviceSupported = false;
  @override
  initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode1 = FocusNode();
    checkSupportBiometric();
  }

  checkSupportBiometric() async {
    final _isDeviceSupported = await biometricService.isDeviceSupported();
    setState(() {
      isDeviceSupported = _isDeviceSupported;
    });
  }

  // ignore: avoid-unused-parameters
  void switchFocusMode(String pin) {
    _focusNode.unfocus();
    FocusScope.of(context).requestFocus(_focusNode1);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      loadingWidget: BaseLoading<BuyCertificateController>(),
      title: AppLocalizations.current.setupPinCode,
      body: Column(
        children: [
          HeaderStep(
            step: 1,
            customImageStep: Assets.images.stepOneNew,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      AppLocalizations.current.introPinCode,
                      textAlign: TextAlign.justify,
                      color: Color(0xff5768A5),
                    ),
                    SizedBox(height: 20),
                    CreatePinCodeTextField(
                      // ignore: prefer-extracting-callbacks
                      callback: (value) {
                        setState(() {
                          pin = value;
                        });
                      },
                      focusNode: _focusNode,
                      onCompleteCallback: switchFocusMode,
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
                    SizedBox(height: 10),
                    ConfirmPinCodeTextField(
                      callback: (value) {
                        setState(() {
                          rePin = value;
                        });
                      },
                      pin: pin,
                      focusNode: _focusNode1,
                    ),
                    hasError1
                        ? Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: BaseText(
                              errorMsg1,
                              fontSize: 12,
                              color: Color(0xffE51F1F),
                            ),
                          )
                        : Container(),
                    if (isDeviceSupported)
                      BaseText(
                        AppLocalizations.current.bio_protect_pin,
                        textAlign: TextAlign.justify,
                        color: Color(0xff5768A5),
                      ),
                    SizedBox(height: 10),
                    if (isDeviceSupported)
                      Row(
                        children: [
                          switchBiometric(),
                          SizedBox(width: 5),
                          BaseText(
                            AppLocalizations.current.active_bio,
                            color: Color(0xff0D75D6),
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    SizedBox(height: 20),
                    AppButtonWidget(
                      label: AppLocalizations.current.next,
                      onTap: () {
                        onSubmit();
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 7, left: 10, right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff5768A5)),
                          width: 5,
                          height: 5,
                        ),
                        Expanded(
                          child: BaseText(
                            AppLocalizations.current.pinCodeJustInclude,
                            textAlign: TextAlign.justify,
                            color: Color(0xff5768A5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 7, left: 10, right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff5768A5)),
                          width: 5,
                          height: 5,
                        ),
                        Expanded(
                          child: BaseText(
                            AppLocalizations.current.pinCodeNotInclude,
                            textAlign: TextAlign.justify,
                            color: Color(0xff5768A5),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomContact(),
        ],
      ),
    );
  }

  Widget switchBiometric() {
    return Platform.isAndroid
        ? Switch(
            value: isSwitched,
            onChanged: onActiveBiometric,
            activeColor: Color(0xff0D75D6),
          )
        : CupertinoSwitch(
            value: isSwitched,
            onChanged: onActiveBiometric,
            activeColor: Color(0xff0D75D6),
          );
  }

  Future<void> onActiveBiometric(value) async {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  bool checkValidPin(String pin, String rePin) {
    bool temp = false;
    try {
      var reg = "012345678901234567890";
      var req1 = "987654321098765432109";
      hasError = false;
      hasError1 = false;
      errorMsg = "";
      errorMsg1 = "";
      if (pin.length != 6) {
        setState(() {
          hasError = true;
          errorMsg = AppLocalizations.current.pinValidateSixDigit;
        });
        temp = false;
      } else if (rePin.length != 6) {
        setState(() {
          hasError1 = true;
          errorMsg1 = '';
          errorMsg1 = AppLocalizations.current.rePinValidateSixDigit;
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
      } else if (rePin != pin) {
        setState(() {
          hasError1 = true;
          errorMsg1 = AppLocalizations.current.pinValidateNotMatch;
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

  Future<void> onSubmit() async {
    bool isTrue = checkValidPin(pin, rePin);
    final authController = Get.find<AuthController>();

    if (isTrue) {
      //set PIN on ActiveController
      // controller.pin = pin;
      // controller.genKey();
      // Get.to(() => VerifyOTPScreen());
      if (isSwitched) {
        bool isBioShow = await authController.toggleAuthBiometrics(
            value: false, authRequired: true);
        if (!isBioShow) {
          setState(() {
            isSwitched = false;
          });
        }
      } else {
        authController.toggleAuthBiometrics(value: false, authRequired: false);
      }

      controller.genKey(pin, isSwitched, widget.certificateModel as dynamic);
    }
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
