import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/models/app/purchase_certificate_model.dart';
import '../../../../core/models/response/order_cert_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/buy_certificate_controller.dart';
import '../../../controller/extend_certificate_controller.dart';
import '../../../pages/certificate/buy/order_detail_screen.dart';
import '../../../pages/certificate/buy/waiting_for_accept_cert_screen.dart';
import '../../../widgets/app_refresh.dart';
import '../../../widgets/base_loading.dart';
import '../../../widgets/base_text.dart';
import '../../../widgets/dialog_notification.dart';

import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/base_screen.dart';

class SelectCertPackScreen extends StatelessWidget {
  final String certSerial;

  final ExtendCertificateController extendCertificateController = Get.find<ExtendCertificateController>();
  final BuyCertificateController buyCertificateController = Get.put(BuyCertificateController());

  SelectCertPackScreen({super.key, required this.certSerial});

  _gotoDetailOrder(OrderCertModel value) {
    Get.to(() => OrderDetailScreen(
          orderCertModel: value,
          // isCompleted: value.statusIsDone,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.select_time_to_extend,
      colorBg: const Color.fromRGBO(241, 244, 250, 1),
      loadingWidget: const BaseLoading<ExtendCertificateController>(),
      body: Column(
        children: [
          // Container(
          //   padding: const EdgeInsets.all(16),
          //   alignment: Alignment.centerLeft,
          //   child: BaseText(
          //     AppLocalizations.current.select_cert_to_extend,
          //     height: 24 / 14,
          //     color: const Color(0xff08285C),
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          Expanded(
            child: AppRefresh<PurchaseCertificateModel>(
              path: "/order/certorder/list_cert_pricing",
              keyController: "/order/certorder/list_cert_pricing_select_to_extend",
              fromMap: PurchaseCertificateModel.fromJson,
              itemWidgetBuilder: (value, index) {
                return InkWell(
                    onTap: () {
                      // create order
                      extendCertificateController.createOrder(certSerial, value.pricingCode!.toString()).then((value) {
                        if (value != null) {
                          // Get.to(() =>
                          //     WaitingForAcceptCertScreen(
                          //       orderCertModel: value,
                          //       // isCompleted: value.statusIsDone,
                          //     ));
                          // return;

                          // ton tai yeu cau
                          if (value.code == 60014) {
                            Get.dialog(
                              DialogNotification(
                                // title: AppLocalizations.current.you_need_know,
                                content: AppLocalizations.current.exist_order,
                                // image: image,
                                // onlyActionCancel: true,
                                titleBtnAccept: AppLocalizations.current.view_detail,
                                titleBtnCancel: AppLocalizations.current.close,
                                actionCancel: () {
                                  // Get.back();
                                },
                                actionAccept: () {
                                  _gotoDetailOrder(value);
                                },
                              ),
                            );
                          } else if (value.getTypeEnum() == OrderType.renewCert) {
                            if (value.canContinue()) {
                              // thuc hien buoc gia han tiep theo
                              buyCertificateController.handleOrderModelByStatus(value);
                            } else if (value.showWaitingApproveScreen()) {
                              // hien thi man hinh cho duyet
                              Get.to(() => WaitingForAcceptCertScreen(
                                    orderCertModel: value,
                                    // isCompleted: value.statusIsDone,
                                  ));
                            } else {
                              // di chuyen sang man chi tiet don hang
                              _gotoDetailOrder(value);
                            }
                          } else {
                            // neu khong phai don hang gia han thi di chuyen sang man chi tiet don hang
                            _gotoDetailOrder(value);
                          }
                        } else {
                          // nothing todo
                        }
                      });
                    },
                    child: _CertPackageViewWidget(purchaseCertificateModel: value));
              },
              params: {"serial": certSerial},
              headerBuilder: (int? value) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      BaseText(
                        AppLocalizations.current.suggested_extension,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color(0xff08285C),
                      ),
                      BaseText(
                        " (${value == null ? 0 : ((value > 1 && value < 10) ? "0$value" : value)})",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color(0xff44507B),
                      )
                    ],
                  ),
                );
              },
              // filter: (value) {
              //   return value.signType == certPackType;
              // },
              // params: const {"FieldName": "createdDate", "IsDesc": true},
              // appRefreshController: appRefreshController,
              // isShowViewMore: true,
              isLoadMore: false,
              itemSpace: 0,
              listPadding: const EdgeInsets.only(bottom: 16),
              wrapMargin: const EdgeInsets.only(top: 16),
            ),
          )
        ],
      ),
    );
  }
}

class _CertPackageViewWidget extends StatelessWidget {
  final PurchaseCertificateModel purchaseCertificateModel;

  const _CertPackageViewWidget({required this.purchaseCertificateModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
        right: 9,
        left: 9,
      ),
      decoration: const BoxDecoration(
          // color: Colors.white,
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
              borderRadius: BorderRadius.only(topLeft: Radius.circular(11), topRight: Radius.circular(11)),
            ),
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: BaseText(
              purchaseCertificateModel.pricingName,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: const Color(0xff0D75D6),
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
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(14), bottomRight: Radius.circular(14))),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
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
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(14), bottomLeft: Radius.circular(14))),
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
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(11), bottomRight: Radius.circular(11)),
            ),
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      AppLocalizations.current.usedTime,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      // height: 24 / 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff5768A5),
                    ),
                    BaseText(
                      purchaseCertificateModel.timeValidityStr,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      // height: 24 / 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff08285C),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      AppLocalizations.current.serviceCharge,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      // height: 24 / 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff5768A5),
                    ),
                    BaseText(
                      purchaseCertificateModel.priceStr,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      // height: 24 / 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff0D75D6),
                    )
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
