
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnpt_smartca_module/views/controller/buy_certificate_controller.dart';
import 'package:vnpt_smartca_module/views/controller/otp_verify_controller.dart';
import 'package:vnpt_smartca_module/views/i18n/generated_locales/l10n.dart';
import 'package:vnpt_smartca_module/views/pages/active_account/bottom_contact.dart';
import 'package:vnpt_smartca_module/views/pages/active_account/setup_pin_code/widget/create_pin_code_widget.dart';
import 'package:vnpt_smartca_module/views/widgets/dialog_notification.dart';
import 'package:vnpt_smartca_module/views/widgets/widget.dart';

import '../../../../gen/assets.gen.dart';
import '../../controller/auth_controller.dart';

class VerifyOTPUpdateScreen extends StatefulWidget {
  final Map<String, dynamic>? map;

  const VerifyOTPUpdateScreen(
      {Key? key,this.map})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTPVerifyUpdateState();
}

class _OTPVerifyUpdateState extends State<VerifyOTPUpdateScreen> {
  late FocusNode _focusNode;

  bool hasError = false;
  String errorMsg = '';
  String otp = '';

  final controller = Get.put(OTPVerifyController());
  final authController = Get.find<AuthController>();

  final controllerEkyc = Get.put(BuyCertificateController());

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    controllerEkyc.ekycErrorCount = 0;
  }

  // ignore: avoid-unused-parameters
  void verifyOTP(String otp) {
    _focusNode.unfocus();

    ///Todo
    Map<String, dynamic> data = {};
    data.addAll(widget.map ?? {});
    data['OTP'] = otp;

    controllerEkyc.updateInfoEmailAndPhone(data);
  }

  @override
  Widget build(BuildContext context) {
    // controllerEkyc.checkSuccessUpdate.listen((p0) {
    //   if(p0?.code == 0) {
    //     Get.dialog(DialogNotification(
    //       content: AppLocalizations.current.update_info_success,
    //       titleBtnAccept: AppLocalizations.current.goHome,
    //       onlyActionAccept: true,
    //       actionAccept: () {
    //         final appController = Get.find<AppController>();
    //         appController.backToMainPage();
    //       },
    //     ));
    //   }
    // });
    return BaseScreen(
      loadingWidget: BaseLoading<BuyCertificateController>(),
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

                    BaseText(
                      "${AppLocalizations.current.otpSendToPhone} "
                          "${authController.currentUser.value!.phone!}",
                      textOverflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      height: 24 / 14,
                      color: Color(0xff5768A5),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: CreatePinCodeTextField(
                        // ignore: prefer-extracting-callbacks
                        // shape: PinCodeFieldShape.box,
                        title: "",
                        callback: (value) {
                          setState(() {
                            otp = value;
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
                            // controller.resendOTP(widget.ekycResponseModel);
                            _focusNode = FocusNode();
                            controllerEkyc.sendOTPUpdateInfo(
                              sendAgain: true,
                              phone: widget.map?['Phone'],
                              email: widget.map?['Email'],
                            );
                          },
                          child: BaseText(
                            AppLocalizations.current.resendOTP,
                            color: Color(0xff0D75D6),
                          ),
                        ),
                      ],
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
          ),
          AppButtonWidget(
            label: AppLocalizations.current.confirm,
            doublePadding: 15,
            onTap: () {
              verifyOTP(otp);
            },
          ),
          SizedBox(height: 10),
          BottomContact(),
        ]),
      ),
    );
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
