// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/buy_certificate_controller.dart';
import '../../../pages/active_account/bottom_contact.dart';
import '../../../widgets/base_screen.dart';

import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/base_text.dart';
import '../../../widgets/loading_circle_widget.dart';

class VerifyInfoScreen extends StatelessWidget {
  final dynamic data;

  VerifyInfoScreen({Key? key, required this.data}) : super(key: key);

  final controller = Get.find<BuyCertificateController>();

  @override
  Widget build(BuildContext context) {
    // controller.eKYCVerifyFinish.listen((finish) {
    //   if (finish) {
    //     Get.back();
    //   }
    // });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.verifyEkyc(data);
    });
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BaseScreen(
        hideAppBar: true,
        // title: AppLocalizations.current.verifyInformationAccount,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingCircleWidget(sizeLoading: 150),
                    SizedBox(height: 20),
                    BaseText(
                      AppLocalizations.current.beingVerified,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff08285C),
                    ),
                    SizedBox(height: 20),
                    BaseText(
                      AppLocalizations.current.systemVerifying,
                      color: Color(0xff5768A5),
                      textAlign: TextAlign.center,
                      height: 24 / 14,
                    ),
                  ],
                ),
              ),
            ),
            BottomContact(),
          ],
        ),
      ),
    );
  }
}
