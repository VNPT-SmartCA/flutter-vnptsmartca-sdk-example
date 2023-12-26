import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/transaction_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/enums.dart';
import '../../../widgets/dialog/enter_pin_for_dialog.dart';

class PINDialogWidget extends StatelessWidget {
  final TransactionType transactionType;
  final Function(String arg) callback;
  final controller = Get.find<TransactionController>();

  PINDialogWidget(
      {super.key, required this.callback, required this.transactionType});

  @override
  Widget build(BuildContext context) {
    String description = transactionType == TransactionType.cancel
        ? AppLocalizations.current.pinDialogConfirmCancel
        : AppLocalizations.current.pinDialogConfirmSignDigitalTitle;
    String buttonText = transactionType == TransactionType.cancel
        ? AppLocalizations.current.confirmCancel
        : AppLocalizations.current.pinDialogButton;
    Color buttonColor =
        transactionType == TransactionType.cancel ? Colors.red : Colors.blue;

    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: EnterPINDialog(
        description: description,
        buttonText: buttonText,
        buttonColor: buttonColor,
        callback: callback,
      ),
    );
  }
}
