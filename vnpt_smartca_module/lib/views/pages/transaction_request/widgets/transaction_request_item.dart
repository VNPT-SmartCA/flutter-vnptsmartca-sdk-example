// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/extensions/datetime.dart';
import '../../../../core/models/response/transaction_model.dart';
import '../../../controller/transaction_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../pages/transaction_request/widgets/transaction_actions_buttons.dart';

import '../../../utils/color.dart';

class TransactionRequestItem extends GetView<TransactionController> {
  final TransactionModel transactionModel;
  final Widget clockTimer;
  final String tranDesc;
  const TransactionRequestItem(
      {Key? key,
      required this.transactionModel,
      required this.clockTimer,
      required this.tranDesc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: HexColor("#f7f8f9")),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color(0xffeceff7), blurRadius: 20, spreadRadius: 1)
          ]),
      child: GestureDetector(
          onTap: () => controller.getDetailTrans(transactionModel.tranId),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                          transactionModel.reqTime.datetimeFormatVN(
                              value: transactionModel.reqTime),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: HexColor("#08285C")))),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 2.0),
                      decoration: transactionModel.tranType != 5
                          ? BoxDecoration(
                              color: HexColor("#FFF5EC"),
                              border: Border.all(
                                  width: 1, color: Color(0xffFF9843)),
                              borderRadius: BorderRadius.circular(16),
                            )
                          : null,
                      child: clockTimer),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      AppLocalizations.current.affiliateAppName,
                      style: TextStyle(color: HexColor("#08285C")),
                    ),
                  ),
                  // const Spacer(),
                  Expanded(
                      flex: 7,
                      child: Text(transactionModel.appName,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.end,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Color(0xff08285C),
                            fontWeight: FontWeight.w600,
                          ))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        AppLocalizations.current.transactionDesc,
                        style: TextStyle(color: HexColor("#08285C")),
                      )),
                  Expanded(
                      flex: 7,
                      child: Text(tranDesc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: Color(0xff08285C),
                            fontWeight: FontWeight.w600,
                          ))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.current.detail,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: HexColor("#1F74F4")),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 15,
                        color: HexColor("#0C5CA8"),
                      )),
                ],
              ),
              const SizedBox(height: 10),
              TransactionActionsButtons(
                transactionModel: transactionModel,
                needGetDetail: true,
              )
            ],
          )),
    );
  }
}
