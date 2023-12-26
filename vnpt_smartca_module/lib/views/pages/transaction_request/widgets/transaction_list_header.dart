// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/transaction_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../pages/transaction_request/widgets/header_button_small.dart';
import '../../../theme/theme.dart';
import '../../../utils/color.dart';
import '../../../widgets/dialog/enter_pin_for_dialog.dart';

import '../../../utils/enums.dart';

// ignore: must_be_immutable
class TransactionListHeader extends StatelessWidget {
  final controller = Get.find<TransactionController>();
  final authController = Get.find<AuthController>();
  late int transactionCount;
  late String credentialId;
  TransactionListHeader(
      {Key? key, required this.transactionCount, required this.credentialId})
      : super(key: key);

  // Tùy chọn TransactionType để hiển thị loại Dialog nhập PIN.
  void showActionWithPINDialog(TransactionType transactionType) {
    String description = transactionType == TransactionType.cancel
        ? AppLocalizations.current.pinDialogConfirmCancel
        : AppLocalizations.current.pinDialogConfirmSignDigitalTitle;
    String buttonText = transactionType == TransactionType.cancel
        ? AppLocalizations.current.confirmCancel
        : AppLocalizations.current.pinDialogButton;
    Color buttonColor =
        transactionType == TransactionType.cancel ? Colors.red : Colors.blue;

    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: EnterPINDialog(
          description: description,
          buttonText: buttonText,
          buttonColor: buttonColor,
          callback: (pin) {
            if (transactionType == TransactionType.confirm) {
              controller.confirmAllWaitingTransaction(pin, credentialId);
            } else {
              controller.rejectAllWaitingTransaction(pin, credentialId);
            }
          },
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 4.0, bottom: 6.0, right: .0, left: .0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                // ignore: unnecessary_brace_in_string_interps
                '${transactionCount > 0 ? transactionCount.toString().padLeft(2, "0") : 0} ${AppLocalizations.of(context).giao_dich}',
                style: const TextStyle(
                    color: Color(0xff5768A5), fontWeight: FontWeight.w500),
              )),
          transactionCount > 1
              ? HeaderButtonSmall(
                  margin: const EdgeInsets.all(0),
                  backgroundColor: HexColor("#f4e4e7"),
                  borderColor: HexColor("#f4e4e7"),
                  title: AppLocalizations.of(context).huy_tat_ca,
                  textStyle: mainTheme.textTheme.labelSmall!
                      .copyWith(color: HexColor("#E51F1F")),
                  icon: Assets.images.icCancel.svg(),
                  buttonStyle: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                  ),
                  onCallBack: () => {
                        if (authController.currentUser.value?.useBiometric ==
                            true)
                          {
                            controller.useBiometricWithAllTransaction(
                                TransactionType.cancel, credentialId),
                          }
                        else
                          {showActionWithPINDialog(TransactionType.cancel)}
                      })
              : SizedBox.shrink(),
          const SizedBox(width: 8.0),
          transactionCount > 1
              ? HeaderButtonSmall(
                  margin: const EdgeInsets.all(0),
                  backgroundColor: Color.fromRGBO(225, 235, 250, 1),
                  borderColor: Color.fromRGBO(225, 235, 250, 1),
                  title: AppLocalizations.of(context).ky_tat_ca,
                  textStyle: mainTheme.textTheme.labelSmall!
                      .copyWith(color: HexColor("#1F74F4")),
                  icon: Assets.images.icPen.svg(),
                  buttonStyle: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                  ),
                  onCallBack: () => {
                        if (authController.currentUser.value?.useBiometric ==
                            true)
                          {
                            controller.useBiometricWithAllTransaction(
                                TransactionType.confirm, credentialId),
                          }
                        else
                          {showActionWithPINDialog(TransactionType.confirm)}
                      })
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
