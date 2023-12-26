import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/dialog/common_dialog.dart';

import '../../../../core/models/response/order_cert_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/buy_certificate_controller.dart';
import '../../../utils/datetime_format.dart';
import '../../../widgets/base_loading.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';

class OrderDetailScreen extends StatefulWidget {
  final OrderCertModel orderCertModel;
  // final bool isCompleted;

  const OrderDetailScreen({super.key, required this.orderCertModel});

  @override
  State<OrderDetailScreen> createState() {
    return _OrderDetailScreenState();
  }
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  late BuyCertificateController controller;

  _OrderDetailScreenState() {
    final isRegistered = Get.isRegistered<BuyCertificateController>();
    controller = isRegistered
        ? Get.find<BuyCertificateController>()
        : Get.put(BuyCertificateController());
  }

  _renderItemInfo(String label, String content,
      {Color? contentColor,
      FontWeight? contentFontWeight,
      bool isShowCopyButton = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label.isNotEmpty,
          child: Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              child: BaseText(
                label,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 24 / 14,
                textAlign: TextAlign.left,
                color: const Color(0xff5768A5),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            alignment:
                label.isNotEmpty ? Alignment.centerRight : Alignment.centerLeft,
            child: BaseText(
              content,
              fontWeight: contentFontWeight ?? FontWeight.w400,
              fontSize: 14,
              height: 24 / 14,
              textAlign: TextAlign.right,
              color: contentColor ?? const Color(0xff08285C),
            ),
          ),
        ),
        Visibility(
          visible: isShowCopyButton,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: InkWell(
                onTap: () {
                  FlutterClipboard.copy(content);
                },
                child: Assets.images.icCopy
                    .image(width: 20, height: 20, fit: BoxFit.contain)),
          ),
        )
      ],
    );
  }

  getStatusColor(OrderCertModel orderCertModel) {
    if (orderCertModel.status == OrderCertModel.DONE) {
      return const Color(0xff17A514);
    } else if (orderCertModel.status == OrderCertModel.CANCELED) {
      return const Color(0xffE51F1F);
    } else {
      return const Color(0xffDB7269);
    }
  }

  _replaceText(String s) {
    return s.replaceAll(":", "");
  }

  _getPackageInfoTitle() {
    if (widget.orderCertModel.getTypeEnum() == OrderType.newCert) {
      return AppLocalizations.current.orderDetailCert;
    } else if (widget.orderCertModel.getTypeEnum() == OrderType.renewCert) {
      return AppLocalizations.current.package_information;
    } else {
      return AppLocalizations.current.package_information;
    }
  }

  _getPackageInfoView(OrderCertModel value) {
    if (widget.orderCertModel.getTypeEnum() == OrderType.newCert) {
      return [
        _renderItemInfo(
          _replaceText(AppLocalizations.current.product_price),
          value.pricing?.priceStr ?? "",
        ),
        const SizedBox(
          height: 8,
        ),
        _renderItemInfo(
          _replaceText(AppLocalizations.current.product_money),
          value.pricing?.amountStr ?? "",
        ),
        const SizedBox(
          height: 8,
        ),
        _renderItemInfo(
          _replaceText(AppLocalizations.current.pay),
          value.status > 2
              ? AppLocalizations.current.paymentDone
              : AppLocalizations.current.paymentWaiting,
          contentFontWeight: FontWeight.w700,
        ),
      ];
    } else if (widget.orderCertModel.getTypeEnum() == OrderType.renewCert) {
      return [
        _renderItemInfo(_replaceText(AppLocalizations.current.product_money),
            value.pricing?.amountStr ?? "",
            contentFontWeight: FontWeight.w600,
            contentColor: const Color(0xff0D75D6)),
      ];
    } else {
      return [
        _renderItemInfo(_replaceText(AppLocalizations.current.product_money),
            value.pricing?.amountStr ?? "",
            contentFontWeight: FontWeight.w600,
            contentColor: const Color(0xff0D75D6)),
      ];
    }
  }

  @override
  void dispose() {
    // controller.currentOrderCertModel.value = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      OrderCertModel value;
      if (widget.orderCertModel.orderItemController?.currentOrderCertModel
              .value ==
          null) {
        value = widget.orderCertModel;
      } else {
        value = widget
            .orderCertModel.orderItemController!.currentOrderCertModel.value!;
      }
      return BaseScreen(
        title: AppLocalizations.current.viewOrderDetail,
        colorBg: const Color.fromRGBO(241, 244, 250, 1),
        loadingWidget: const BaseLoading<BuyCertificateController>(),
        body: Container(
          margin: const EdgeInsets.only(right: 9, left: 9, top: 16),
          decoration: const BoxDecoration(
              // color: Colors.red,
              boxShadow: [
                // BoxShadow(
                //     blurRadius: 10,
                //     spreadRadius: 0,
                //     offset: const Offset(0, 1),
                //     color: const Color(0xff1A3478).withOpacity(0.1))
              ]),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 7),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11),
                      topRight: Radius.circular(11)),
                ),
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: BaseText(
                      value.getTypeLabel(),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: const Color(0xff0D75D6),
                    )),
                    // Assets.images.icArrowRight.image(width: 16, height: 16, fit: BoxFit.cover)
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: Stack(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          color: Colors.white,
                        ),
                        Container(
                          width: 14,
                          height: 14,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(241, 244, 250, 1),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(14),
                                  bottomRight: Radius.circular(14))),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.white,
                    height: 14,
                    alignment: Alignment.center,
                    child: Assets.images.icLine.image(fit: BoxFit.fitWidth),
                  )),
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: Stack(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          color: Colors.white,
                        ),
                        Container(
                          width: 14,
                          height: 14,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(241, 244, 250, 1),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  bottomLeft: Radius.circular(14))),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 7),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(11),
                      bottomRight: Radius.circular(11)),
                ),
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    _renderItemInfo(AppLocalizations.current.orderCode,
                        value.dhsxkdCustomerInfo.maGd,
                        contentFontWeight: FontWeight.w700,
                        contentColor: const Color(0xff08285C),
                        isShowCopyButton: true),
                    const SizedBox(
                      height: 8,
                    ),
                    _renderItemInfo(AppLocalizations.current.orderDate,
                        DatetimeFormat().formatDate(value.createdDate)),
                    const SizedBox(
                      height: 8,
                    ),
                    _renderItemInfo(
                        AppLocalizations.current.status, value.getStateText(),
                        contentFontWeight: FontWeight.w600,
                        contentColor: getStatusColor(value)),
                    Visibility(
                        visible: widget.orderCertModel.getTypeEnum() ==
                                OrderType.renewCert ||
                            widget.orderCertModel.getTypeEnum() ==
                                OrderType.changeDevice,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: BaseText(
                                AppLocalizations.current.certificate_serial,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 24 / 14,
                                textAlign: TextAlign.left,
                                color: const Color(0xff5768A5),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            _renderItemInfo("", value.previousSerial ?? "",
                                contentFontWeight: FontWeight.w400,
                                contentColor: const Color(0xff08285C),
                                isShowCopyButton: true),
                          ],
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 6),
                      color: Colors.white,
                      height: 14,
                      alignment: Alignment.center,
                      child: Assets.images.icLine.image(fit: BoxFit.fitWidth),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: BaseText(
                        _getPackageInfoTitle(),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color(0xff0D75D6),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    _renderItemInfo(
                        _replaceText(AppLocalizations.current.product_name),
                        value.pricing?.pricingName ?? "",
                        contentFontWeight: FontWeight.w700,
                        contentColor: const Color(0xff08285C)),
                    const SizedBox(
                      height: 8,
                    ),
                    ..._getPackageInfoView(value),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 16),
                child: Row(
                  children: [
                    Visibility(
                        visible: value.canCancel(),
                        child: Expanded(
                            child: AppButtonWidget(
                          doublePadding: 12,
                          backgroundColor: const Color(0xffE0F0FF),
                          labelColor: const Color(0xff0D75D6),
                          label: AppLocalizations.current.cancel_order,
                          onTap: () {
                            // todo huy don hang
                            // show dialog confirm
                            showNotifyModal(
                                AppLocalizations.current.cancelOrderConfirm,
                                onlyActionCancel: false,
                                titleBtnCancel:
                                    AppLocalizations.current.cancel_order,
                                titleBtnAccept: AppLocalizations.current.close,
                                actionCancel: () {
                              controller.cancelOrder(value);
                            });
                          },
                        ))),
                    Visibility(
                        visible: value.canContinue() && value.canCancel(),
                        child: const SizedBox(
                          width: 22,
                        )),
                    Visibility(
                      visible: value.canContinue(),
                      child: Expanded(
                          child: AppButtonWidget(
                        doublePadding: 12,
                        label: AppLocalizations.current.Continue,
                        onTap: () {
                          if (value.canContinue()) {
                            controller.handleOrderModelByStatus(value);
                          }
                        },
                      )),
                    )
                  ],
                ),
              ),
              // const BottomContact(),
            ],
          ),
        ),
      );
    });
  }
}
