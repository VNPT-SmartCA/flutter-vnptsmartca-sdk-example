// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/extensions/datetime.dart';
import '../../../../core/models/app/file_model.dart';
import '../../../../core/models/response/transaction_model.dart';
import '../../../controller/transaction_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../pages/transaction_request/widgets/document_item_preview.dart';
import '../../../theme/theme.dart';
import '../../../utils/color.dart';
import '../../../widgets/dialog/common_dialog.dart';

class PreviewItemTransactionBody extends GetView<TransactionController> {
  final TransactionModel model;

  const PreviewItemTransactionBody({Key? key, required this.model})
      : super(key: key);

  Widget buildItemRow(String label, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
      child: buildContainer(label, text),
    );
  }

  Widget buildContainer(String title, dynamic value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(title,
                style: mainTheme.textTheme.bodyMedium!
                    .copyWith(color: HexColor("#6079A0")),
                maxLines: 2),
          ),
          Expanded(
            child: Text(
              value ?? '-',
              textAlign: TextAlign.end,
              overflow: TextOverflow.visible,
              style: mainTheme.textTheme.bodyLarge!.copyWith(
                  color: HexColor("#08285C"), fontWeight: FontWeight.w500),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 6),
        Padding(
            padding:
                const EdgeInsets.only(left: 5.0, bottom: 10, top: 5, right: 5),
            child: Row(children: [
              Expanded(
                  child: Text(AppLocalizations.current.remainTimeToSign,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: HexColor("#6079A0")),
                      textAlign: TextAlign.left)),
              Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 2.0),
                  decoration: model.tranType != 5
                      ? BoxDecoration(
                          color: HexColor("#FFF5EC"),
                          border:
                              Border.all(width: 1, color: Color(0xffFF9843)),
                          borderRadius: BorderRadius.circular(16),
                        )
                      : null,
                  child: controller.buildCountdown(model)),
            ])),
        const Divider(height: 0),
        buildItemRow(AppLocalizations.current.requestTime,
            model.reqTime.datetimeFormatVN(value: model.reqTime)),
        const Divider(height: 0),
        buildItemRow(AppLocalizations.current.affiliateAppName, model.appName),
        const Divider(height: 0),
        buildItemRow(AppLocalizations.current.transactionDesc, model.tranDesc),
        const Divider(height: 0),
        buildItemRow(AppLocalizations.current.transactionType,
            model.tranTypeDescription),
        const Divider(height: 0),
        Container(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: HexColor("#5768A5"),
                    ),
                    children: [
                      TextSpan(
                          text: AppLocalizations
                              .current.listOfDocumentToBeSigned),
                      TextSpan(
                          text:
                              ' (${controller.listFile.value.length.toString()})',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            )),
        const Divider(height: 0),
        DocumentItemPreview(
            listFile: controller.listFile.value,
            tran: model,
            onCallback: (FileModel file) {
              bool isSignHash = model.isSignHash();
              if (isSignHash) {
                showNotifyModal(AppLocalizations.current.viewFileHash);
                return;
              }
              controller.onPreviewDocument(file);
            }),
      ],
    );
  }
}
