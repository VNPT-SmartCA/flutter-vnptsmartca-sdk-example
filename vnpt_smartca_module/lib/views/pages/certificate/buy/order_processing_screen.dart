import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/buy_certificate_controller.dart';
import '../../../pages/active_account/bottom_contact.dart';
import '../../../widgets/base_screen.dart';

import '../../../widgets/base_text.dart';
import '../../../widgets/loading_circle_widget.dart';

class OrderProcessingScreen extends StatefulWidget {
  final String label;
  final String content;

  const OrderProcessingScreen({Key? key, required this.label, required this.content}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrderProcessingScreenState();
  }
}

class _OrderProcessingScreenState extends State<OrderProcessingScreen> {
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
      hideAppBar: true,
      // title: AppLocalizations.current.verifyInformationAccount,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoadingCircleWidget(sizeLoading: 150),
                  const SizedBox(height: 20),
                  BaseText(
                    widget.label,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xff08285C),
                  ),
                  const SizedBox(height: 20),
                  BaseText(
                    widget.content,
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
