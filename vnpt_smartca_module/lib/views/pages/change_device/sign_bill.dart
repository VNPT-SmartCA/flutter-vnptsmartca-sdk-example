// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/base_loading.dart';
import '../../widgets/base_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../gen/assets.gen.dart';
import '../../controller/buy_certificate_controller.dart';
import '../../controller/sign_bill_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../widgets/app_button_widget.dart';
import '../../widgets/base_text.dart';
import '../../widgets/dialog_notification.dart';
import '../../widgets/draw_signature_dialog.dart';
import '../active_account/header_step.dart';
import '../certificate/buy/order_processing_screen.dart';

class SignBillPage extends StatelessWidget {
  final String? serial;
  final String? orderId;

  SignBillPage({
    super.key,
    this.serial,
    this.orderId,
  }) {
    controller.getBill(serial);
  }

  final controller = Get.put(SignBillController());
  final controllerBuyCert = Get.put(BuyCertificateController());

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      );
    controller.contentBillSignature.listen((result) {
      if (result.isNotEmpty) {
        controller.uploadOrderContract(orderId, result);
      }
    });
    controller.resultUploadContract.listen((result) {
      if (result != null) {
        // LUONG KICH HOAT CERT
        controllerBuyCert.handleOrderModelByStatus(result,
            isFromListOrder: false);
      }
    });
    return BaseScreen(
      loadingWidget: BaseLoading<SignBillController>(),
      title: AppLocalizations.current.signChangeRequest,
      colorBg: Color(0xffFAFBFF),
      body: Column(
        children: [
          HeaderStep(
            step: 1,
            customImageStep: Assets.images.stepOneNew,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Obx(() => controller.contentBill.value.isNotEmpty
                          ? WebViewWidget(
                              controller: webViewController
                                ..loadHtmlString(controller.contentBill.value))
                          : Container()),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Obx(
                        () => InkWell(
                          onTap: () {
                            controller.checkIRead.value =
                                !controller.checkIRead.value;
                          },
                          child: (controller.checkIRead.value
                                  ? Assets.images.icCheckbox
                                  : Assets.images.icUncheck)
                              .image(
                            width: 25,
                            height: 25,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: BaseText(
                          AppLocalizations.current.desCheckboxRequestBill,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  AppButtonWidget(
                    label: AppLocalizations.current.electronicSignature,
                    onTap: () {
                      if (controller.checkIRead.value) {
                        showSignaturePopUP(context);
                      } else {
                        Get.dialog(DialogNotification(
                          content: AppLocalizations.current.requestAgreeBill,
                          onlyActionAccept: true,
                          titleBtnAccept: AppLocalizations.current.close,
                        ));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSignaturePopUP(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: DrawSignatureWidget(
            callBack: (data) {
              String base64Image = base64Encode(data);
              Get.to(() => OrderProcessingScreen(
                    label: AppLocalizations.current.creatingRequest,
                    content:
                        AppLocalizations.current.processingRequestChangeDevice,
                  ));
              controller.saveSignatureImage(serial, base64Image);
            },
          ),
        );
      },
    );
  }
}
