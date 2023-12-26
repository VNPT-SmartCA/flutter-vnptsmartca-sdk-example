// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnpt_smartca_module/views/widgets/base_screen.dart';
import '../../../views/controller/transaction_controller.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/transaction_request/widgets/preview_item_tran_body.dart';
import '../../../views/pages/transaction_request/widgets/transaction_actions_buttons.dart';
import '../../../views/utils/color.dart';
import '../../../views/widgets/empty_data.dart';

class TransactionDetail extends StatelessWidget {
  static String routeName = "/TransactionDetail";
  final controller = Get.find<TransactionController>();
  TransactionDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return controller.handleBack();
      },
      child: BaseScreen(
        // backgroundColor: Colors.white,
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     AppLocalizations.current.transactionDetail,
        //     style: TextStyle(
        //         color: Color(0xff08285C),
        //         fontSize: 16,
        //         fontWeight: FontWeight.w700),
        //   ),
        //   // elevation: 0.0,
        //   shadowColor: HexColor("#f5f6f9").withOpacity(0.3),
        // ),
        title: AppLocalizations.current.transactionDetail,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                child: SingleChildScrollView(
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: Obx(
                          () => controller.transactionInfo.value == null
                              ? const EmptyData()
                              : PreviewItemTransactionBody(
                                  model: controller.transactionInfo.value!),
                        ))),
              ),
            ),
            Container(
              height: Get.height * 0.12,
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TransactionActionsButtons(
                    transactionModel: controller.transactionInfo.value!,
                    needGetDetail: false),
              ),
            )
          ],
        ),
        // bottomSheet: Container(
        //   height: Get.height * 0.12,
        //   padding: const EdgeInsets.only(
        //       left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 16.0),
        //     child: TransactionActionsButtons(
        //         transactionModel: controller.transactionInfo.value!,
        //         needGetDetail: false),
        //   ),
        // ),
      ),
    );
  }
}
