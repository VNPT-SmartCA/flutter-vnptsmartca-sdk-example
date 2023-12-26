// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/models/response/transaction_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/home_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/dialog/common_dialog.dart';
import '../../../widgets/dialog/modal_bottom_sheet.dart';

import '../../../widgets/widget.dart';
import 'view_document_list.dart';

enum DocSignatureHistoryItemStatus { success, error, pending }

class DocSignatureHistoryWidget extends StatelessWidget {
  late DocSignatureHistoryItemStatus status;
  late String date;
  late TransactionModel value;
  final controller = Get.find<HomeController>();

  DocSignatureHistoryWidget({Key? key, required this.value}) {
    switch (value.tranStatus) {
      case 1:
        status = DocSignatureHistoryItemStatus.success;
        break;
      case 4000:
        if (value.tranType != 5 && value.isExpired) {
          status = DocSignatureHistoryItemStatus.error;
        } else {
          status = DocSignatureHistoryItemStatus.pending;
        }
        break;
      default:
        status = DocSignatureHistoryItemStatus.error;
    }

    date = value.reqTimeFormatted;
  }

  Widget _getStatusImage() {
    if (status == DocSignatureHistoryItemStatus.success) {
      return Assets.images.icKysoSuccess
          .image(width: 20, height: 20, fit: BoxFit.fill);
    } else if (status == DocSignatureHistoryItemStatus.error) {
      return Assets.images.icKysoError
          .image(width: 20, height: 20, fit: BoxFit.fill);
    } else {
      return Icon(Icons.hourglass_empty_rounded, size: 20, color: Colors.amber);
    }
  }

  showDocumentList() {
    CustomBottomSheetDialog.show(
        isScrollControlled: true,
        title: AppLocalizations.current.documentPreview,
        childBuilder: (context) {
          return ViewDocumentList(
            transactionModel: value,
            homeController: controller,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    bool isSuccess = status == DocSignatureHistoryItemStatus.success;
    bool isSignHash = value.isSignHash();
    return _CardWrapperWidget(
      child: InkWell(
          onTap: () {
            if (value.isExpired == false) {
              controller.transactionRequestController
                  .getDetailTrans(value.tranId);
              return;
            }
            if (!isSignHash) {
              if (value.docs.length == 1) {
                if (isSuccess) {
                  controller.transactionRequestController
                      .onViewOrShareDocument(value);
                } else {
                  showNotifyModal(AppLocalizations.current.notSupportViewFile);
                }
              } else {
                showDocumentList();
              }
            } else {
              showNotifyModal(AppLocalizations.current.viewFileHash);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _getStatusImage(),
                            SizedBox(width: 6),
                            Expanded(
                                child: BaseText(value.docs[0]["name"]?.trim(),
                                    color: Color(0xff313131),
                                    // textAlign: TextAlign.justify,
                                    // textOverflow: TextOverflow.ellipsis,
                                    // maxLines: 1,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                      visible: value.docs.length > 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: InkWell(
                            onTap: () {
                              showDocumentList();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.current.viewMore,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff0D75D6),
                                      fontSize: 11),
                                ),
                                Text(
                                  '(+${value.docs.length - 1})',
                                  style: TextStyle(
                                      height: 1,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff0D75D6),
                                      fontSize: 12),
                                ),
                                // Icon(
                                //   Icons.arrow_downward,
                                //   size: 19,
                                //   color: Color(0xff0D75D6),
                                // ),
                              ],
                            )),
                      )),
                  // isSuccess &&
                  Visibility(
                      visible:
                          isSuccess && !isSignHash && value.docs.length == 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: InkWell(
                          onTap: () {
                            controller.transactionRequestController
                                .onViewOrShareDocument(value, isShare: true);
                          },
                          child: Assets.images.icShare
                              .image(width: 23, height: 23, fit: BoxFit.fill),
                        ),
                      )),
                ],
              ),
              // SizedBox(height: 6),
              // Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 6),
              //     child: Row(children: [
              //       BaseText(
              //         AppLocalizations.current.affiliateAppName + ": ",
              //         color: Color(0xff616161),
              //       ),
              //       BaseText(
              //         value.appName,
              //         color: Color(0xff616161),
              //       ),
              //     ])),
              SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(value.textStatus,
                            style: TextStyle(
                                color: Color(0xff616161),
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1)),
                    SizedBox(width: 6),
                    BaseText(
                      date,
                      color: Color(0xff616161),
                      textAlign: TextAlign.end,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class _CardWrapperWidget extends StatelessWidget {
  final Widget child;

  const _CardWrapperWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff485EAD).withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(6, 6),
            )
          ]),
      child: child,
    );
  }
}
