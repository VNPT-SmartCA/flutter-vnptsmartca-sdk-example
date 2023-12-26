// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/enums.dart';
import '../../../pages/active_account/bottom_contact.dart';
import '../../../widgets/base_screen.dart';

import '../../../../gen/assets.gen.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/common.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_text.dart';

class VerifyInfoErrorScreen extends StatelessWidget {
  final VerifyInfoType type;
  final String errorText;

  const VerifyInfoErrorScreen({Key? key, required this.type, required this.errorText}) : super(key: key);

  // final controller = Get.find<ActiveController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return type == VerifyInfoType.error3times ? false : true;
      },
      child: BaseScreen(
        title: AppLocalizations.current.verifyInfo,
        hiddenIconBack: true,
        body: Column(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Assets.images.verifyErrorLogo.image(
                      width: 250,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 20),
                  BaseText(
                    AppLocalizations.current.verifyInfoError,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff08285C),
                    fontSize: 16,
                    height: 24 / 16,
                  ),
                  SizedBox(height: 20),
                  type == VerifyInfoType.error3times
                      ? Column(
                          children: [
                            _BulletText(AppLocalizations.current.verifyInfoErrorDescription),
                            _BulletText(AppLocalizations.current.verifyInfoErrorCauseLabel),
                            _BulletText(
                              errorText,
                              // AppLocalizations.current.verifyInfoErrorCauseContent,
                              bulletVisible: false,
                              contentBold: true,
                            ),
                            _BulletText(AppLocalizations.current.verifyInfoErrorSolution),
                          ],
                        )
                      : Column(
                          children: [
                            _BulletText(AppLocalizations.current.verifyInfoErrorCauseLabel),
                            _BulletText(
                              // AppLocalizations.current.verifyInfoErrorCauseContent2,
                              errorText,
                              bulletVisible: false,
                              contentBold: true,
                            ),
                            _BulletText(AppLocalizations.current.verifyInfoErrorCauseGuide),
                            _BulletText(AppLocalizations.current.verifyInfoErrorSolution2),
                          ],
                        ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: AppButtonWidget(
                          label: AppLocalizations.current.support,
                          backgroundColor: Color(0xffE0F0FF),
                          labelColor: Color(0xff0D75D6),
                          onTap: Common.callHotline,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: type == VerifyInfoType.error
                              ? AppButtonWidget(
                                  label: AppLocalizations.current.retry,
                                  onTap: () {
                                    Get.back(result: true);
                                    // controller.eKYCStart.value = true;
                                  },
                                )
                              : AppButtonWidget(
                                  label: AppLocalizations.current.iUnderstand,
                                  onTap: () {
                                    Get.back();
                                    // controller.eKYCErrorCount.value = 0;
                                    // Get.offAll(() => LoginPage());
                                    // Get.to(() => CertificatePackScreen(cardInfo: CardInfo(),));
                                  },
                                )),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          BottomContact(),
        ]),
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String content;
  final bool bulletVisible;
  final bool contentBold;

  const _BulletText(this.content, {this.bulletVisible = true, this.contentBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          AppLocalizations.current.bulletDot,
          fontWeight: FontWeight.w700,
          color: bulletVisible ? Color(0xff08285C) : Colors.transparent,
          fontSize: 14,
          height: 24 / 14,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: BaseText(
            content,
            fontWeight: contentBold ? FontWeight.w700 : FontWeight.w400,
            color: Color(0xff08285C),
            fontSize: 14,
            height: 24 / 14,
          ),
        )
      ],
    );
  }
}
