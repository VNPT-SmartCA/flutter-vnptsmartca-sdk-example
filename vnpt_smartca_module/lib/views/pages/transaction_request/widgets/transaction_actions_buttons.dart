import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/models/response/transaction_model.dart';
import '../../../controller/transaction_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../theme/styles.dart';
import '../../../utils/color.dart';
import '../../../widgets/button_general.dart';

import '../../../utils/enums.dart';

// ignore: must_be_immutable
class TransactionActionsButtons extends StatelessWidget {
  final controller = Get.find<TransactionController>();
  final TransactionModel transactionModel;
  final bool needGetDetail;

  TransactionActionsButtons(
      {Key? key, required this.transactionModel, required this.needGetDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Visibility(
              visible: transactionModel.tranType != 5,
              child: Expanded(
                flex: 1,
                child: ButtonGeneral(
                    margin: const EdgeInsets.all(0),
                    backgroundColor: Colors.white,
                    borderColor: HexColor("#0D75D6"),
                    title: AppLocalizations.current.cancel,
                    textStyle: TextStyle(
                        color: HexColor("#0D75D6"),
                        fontWeight: FontWeight.w600),
                    buttonStyle: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                    ),
                    onCallBack: () => controller.onPressCommand(
                        transactionModel, TransactionType.cancel,
                        needGetDetail: needGetDetail)),
              ),
            ),
            Visibility(
              visible: transactionModel.tranType != 5,
              child: const SizedBox(
                width: AppGap.g10,
              ),
            ),
            Expanded(
              flex: 1,
              child: ButtonGeneral(
                  margin: EdgeInsets.zero,
                  title: AppLocalizations.current.digitalSignature,
                  backgroundColor: HexColor("#0D75D6"),
                  borderColor: HexColor("#0D75D6"),
                  textStyle: TextStyle(
                      color: HexColor("#ffffff"), fontWeight: FontWeight.w600),
                  buttonStyle: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                  ),
                  onCallBack: () => controller.onPressCommand(
                      transactionModel, TransactionType.confirm,
                      needGetDetail: needGetDetail)),
            ),
          ],
        ),
      ],
    );
  }
}
