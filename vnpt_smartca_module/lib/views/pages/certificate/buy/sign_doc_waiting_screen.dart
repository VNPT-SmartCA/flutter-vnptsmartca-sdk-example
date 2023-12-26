import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../register_account/payment_screen.dart';

import '../../../controller/buy_certificate_controller.dart';
import '../../../widgets/widget.dart';
import '../../active_account/bottom_contact.dart';

class SignDocWaitingScreen extends StatefulWidget {
  const SignDocWaitingScreen({super.key});


  @override
  State<StatefulWidget> createState() {
    return _SignDocWaitingState();
  }

}

class _SignDocWaitingState extends State<SignDocWaitingScreen> {

  final controller = Get.find<BuyCertificateController>();

  @override
  void dispose() {
    controller.cancelLoop = true;
    super.dispose();
  }

  @override
  void initState() {
    controller.cancelLoop = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.signTheProposalForm,
      hiddenIconBack: true,
      body: Column(
        children: [
          const SizedBox(height: 16,),
          const ImageSliderWidget(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoadingCircleWidget(sizeLoading: 150),
                  const SizedBox(height: 20),
                  BaseText(
                    AppLocalizations.current.creatingContract,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xff08285C),
                  ),
                  const SizedBox(height: 20),
                  BaseText(
                    AppLocalizations.current.theSystemIsInitializingTheContract,
                    color: const Color(0xff5768A5),
                    textAlign: TextAlign.center,
                    height: 24 / 14,
                  ),
                ],
              ),
            ),
          ),
          const BottomContact(),
        ],
      ),
    );
  }

}