import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../../core/models/response/profile_model.dart';
import '../../../controller/extend_certificate_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../register_account/payment_screen.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_edit_text.dart';

import '../../../../../core/models/response/order_cert_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/buy_certificate_controller.dart';
import '../../../utils/datetime_format.dart';
import '../../../widgets/base_loading.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';

class ConfirmCertPackExtendScreen extends StatelessWidget {
  final OrderCertModel orderCertModel;
  final ProfileModel profileModel;
  // final bool isCompleted;

  // final controller = Get.find<BuyCertificateController>();
  final controllerExtend = Get.find<ExtendCertificateController>();

  ConfirmCertPackExtendScreen({super.key, required this.orderCertModel, required this.profileModel});

  _renderItemInfo(String label, String content,
      {Color? contentColor, FontWeight? contentFontWeight, bool isShowCopyButton = false}) {
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
            alignment: label.isNotEmpty ? Alignment.centerRight : Alignment.centerLeft,
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
                child: Assets.images.icCopy.image(width: 20, height: 20, fit: BoxFit.contain)),
          ),
        )
      ],
    );
  }

  _replaceText(String s) {
    return s.replaceAll(":", "");
  }

  @override
  Widget build(BuildContext context) {
    OrderCertModel value = orderCertModel;
    return BaseScreen(
      title: AppLocalizations.current.certificate_package_page_confirm_order_title,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 7),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(11), topRight: Radius.circular(11)),
                ),
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
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
                              borderRadius:
                                  BorderRadius.only(topRight: Radius.circular(14), bottomRight: Radius.circular(14))),
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
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    _renderItemInfo(AppLocalizations.current.orderCode, value.dhsxkdCustomerInfo.maGd,
                        contentFontWeight: FontWeight.w700,
                        contentColor: const Color(0xff08285C),
                        isShowCopyButton: true),
                    const SizedBox(
                      height: 8,
                    ),
                    _renderItemInfo(AppLocalizations.current.orderDate, DatetimeFormat().formatDate(value.createdDate)),
                    const SizedBox(
                      height: 8,
                    ),
                    _renderItemInfo(AppLocalizations.current.status, value.getStateText(),
                        contentFontWeight: FontWeight.w600,
                        contentColor: const Color(0xffDB7269)),
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
                        AppLocalizations.current.subscriber_information,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color(0xff0D75D6),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    _renderItemInfo(_replaceText(AppLocalizations.current.subscriber_name),
                        controllerExtend.profileModel?.fullName ?? "",
                        contentFontWeight: FontWeight.w400, contentColor: const Color(0xff08285C)),
                    const SizedBox(
                      height: 8,
                    ),
                    _renderItemInfo(
                        _replaceText(AppLocalizations.current.idNumber), controllerExtend.profileModel?.uid ?? "",
                        contentFontWeight: FontWeight.w400, contentColor: const Color(0xff08285C)),
                    const SizedBox(
                      height: 8,
                    ),
                    _renderItemInfo(
                        _replaceText(AppLocalizations.current.address), controllerExtend.profileModel?.address ?? "",
                        contentFontWeight: FontWeight.w400, contentColor: const Color(0xff08285C)),
                    const SizedBox(
                      height: 8,
                    ),
                    _renderItemInfo(
                        _replaceText(AppLocalizations.current.phone), controllerExtend.profileModel?.phone ?? "",
                        contentFontWeight: FontWeight.w700, contentColor: const Color(0xff08285C)),
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
                    _renderItemInfo(
                        "", orderCertModel.previousSerial ?? "",
                        contentFontWeight: FontWeight.w400, contentColor: const Color(0xff08285C), isShowCopyButton: true),
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
                        AppLocalizations.current.package_information,
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
                        contentFontWeight: FontWeight.w700, contentColor: const Color(0xff08285C)
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    _renderItemInfo(
                      _replaceText(AppLocalizations.current.certificate_package_item_price_title),
                      value.pricing?.priceStr ?? "",
                       contentFontWeight: FontWeight.w400, contentColor: const Color(0xff069802)
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // _renderItemInfo(
                    //   _replaceText(AppLocalizations.current.product_money),
                    //   value.pricing?.amountStr ?? "",
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // _renderItemInfo(
                    //   _replaceText(AppLocalizations.current.pay),
                    //   value.status > 2 ? AppLocalizations.current.paymentDone : AppLocalizations.current.paymentWaiting,
                    //   contentFontWeight: FontWeight.w700,
                    // ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
              FormBuilder(
                key: controllerExtend.formKey4,
                child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 12),
                  child: BaseEditText(
                    label: AppLocalizations.current.referralCode,
                    isRequired: false,
                    backgroundColor: Colors.white,
                    formName: 'referralCode',
                    readOnly: false,
                    maxLength: 250,
                    paddingHorizontal: 9,
                    placeHolder: AppLocalizations.current.inputReferralCode,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffE7F1FB),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xff0D75D6))),
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      AppLocalizations.current.service_pack_total_amount,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xff5768A5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BaseText(
                      orderCertModel.pricing.amountStrVND,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: const Color(0xff0D75D6),
                    ),
                    Visibility(
                        visible: true,
                        child: BaseText(
                          (orderCertModel.pricing.price > 0)
                              ? AppLocalizations.current.service_pack_vat_included
                              : "",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xff5768A5),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    AppButtonWidget(
                      label: AppLocalizations.current.pay,
                      onTap: () {
                        String? referrerCode = controllerExtend.formKey4.currentState?.fields["referralCode"]?.value.toString().trim();
                        Get.to(() => PaymentScreen(orderCertModel: orderCertModel, profileModel: controllerExtend.profileModel!, raCode: referrerCode,))?.then((value) {
                          // widget.cardInfo.ReferrerCode = null;
                          if (value != null) {
                            // thanh toan thanh cong
                            // if (value == true) {
                              // todo
                              Get.back(result: value);
                            // }
                          }
                        });
                        // controller.paymentOrder(widget.cardInfo, widget.purchaseCertificateModel.signType == 1);
                      },
                    ),
                  ],
                ),
              )
              // const BottomContact(),
            ],
          ),
        ),
      ),
    );
  }
}
