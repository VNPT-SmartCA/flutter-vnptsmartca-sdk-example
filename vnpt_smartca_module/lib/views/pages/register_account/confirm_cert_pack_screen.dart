import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/enter_info_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import 'payment_screen.dart';
import '../../widgets/base_edit_text.dart';
import '../../widgets/widget.dart';

import '../../../core/models/response/order_cert_model.dart';
import '../../../core/models/response/profile_model.dart';

class ConfirmCertPackScreen extends StatefulWidget {
  final OrderCertModel orderCertModel;
  final ProfileModel profileModel;

  const ConfirmCertPackScreen({super.key, required this.orderCertModel, required this.profileModel});

  @override
  State<StatefulWidget> createState() {
    return _ConfirmCertPackState();
  }
}

class _ConfirmCertPackState extends State<ConfirmCertPackScreen> {
  final controller = Get.put(EnterInfoController());

  _renderNote() {
    bool canShow = widget.orderCertModel.pricing.signType == 1;
    return canShow
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Assets.images.icCertInfo.image(width: 20, height: 20, fit: BoxFit.fill),
                    const SizedBox(width: 6),
                    BaseText(
                      AppLocalizations.current.certPackNoteLabel,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff5768A5),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.circle,
                        size: 7,
                        color: Color(0xff5768A5),
                      ),
                    ),
                    Expanded(
                      child: BaseText(
                        AppLocalizations.current.certPackNoteContent,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 20 / 14,
                        color: const Color(0xff5768A5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.certificate_package_page_confirm_order_title,
      loadingWidget: const BaseLoading<EnterInfoController>(),
      colorBg: const Color.fromRGBO(241, 244, 250, 1),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _CertPackageViewWidget(purchaseCertificateModel: widget.orderCertModel.pricing),
                  _ItemInfo(
                    orderCertModel: widget.orderCertModel,
                    profileModel: widget.profileModel,
                    isTypeTurn: widget.orderCertModel.pricing.signType == 1,
                  ),
                  const SizedBox(height: 10),
                  _renderNote(),
                  FormBuilder(
                    key: controller.formKey4,
                    child: Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 12),
                      child: BaseEditText(
                        label: AppLocalizations.current.referralCode,
                        isRequired: false,
                        backgroundColor: Colors.white,
                        formName: 'referralCode',
                        readOnly: false,
                        maxLength: 250,
                        placeHolder: AppLocalizations.current.inputReferralCode,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffE7F1FB),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xff0D75D6))),
            margin: const EdgeInsets.all(16),
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
                const SizedBox(height: 10),
                BaseText(
                  widget.orderCertModel.pricing.amountStrVND,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: const Color(0xff0D75D6),
                ),
                Visibility(
                    visible: true,
                    child: BaseText(
                      (widget.orderCertModel.pricing.price > 0)
                          ? AppLocalizations.current.service_pack_vat_included
                          : "",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: const Color(0xff5768A5),
                    )),
                const SizedBox(height: 10),
                AppButtonWidget(
                  label: AppLocalizations.current.pay,
                  onTap: () {
                    String? referrerCode =
                        controller.formKey4.currentState?.fields["referralCode"]?.value.toString().trim();
                    Get.to(() => PaymentScreen(
                          orderCertModel: widget.orderCertModel,
                          profileModel: widget.profileModel,
                          raCode: referrerCode,
                        ))?.then((value) {
                      if (value != null) {
                        Get.back(result: value);
                      }
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CertPackageViewWidget extends StatelessWidget {
  final Pricing purchaseCertificateModel;

  const _CertPackageViewWidget({super.key, required this.purchaseCertificateModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 9, left: 9),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 7),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(11), topRight: Radius.circular(11)),
            ),
            padding: EdgeInsets.only(left: 16, right: 16, top: 8),
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
                ),
              ),
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
                      textAlign: TextAlign.center,
                      color: const Color(0xff5768A5),
                    ),
                    BaseText(
                      purchaseCertificateModel.timeValidityStr,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff08285C),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      AppLocalizations.current.serviceCharge,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff5768A5),
                    ),
                    BaseText(
                      purchaseCertificateModel.priceStr,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff08285C),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      AppLocalizations.current.product_money,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff5768A5),
                    ),
                    BaseText(
                      purchaseCertificateModel.amountStr,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: const Color(0xff0D75D6),
                    )
                  ],
                ),
                const SizedBox(height: 13),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ItemInfo extends StatelessWidget {
  final OrderCertModel orderCertModel;
  final ProfileModel profileModel;
  final bool isTypeTurn;

  const _ItemInfo({required this.orderCertModel, required this.profileModel, required this.isTypeTurn});

  _renderInfo(String label, String content, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.centerLeft,
            child: BaseText(
              label,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              textAlign: TextAlign.left,
              color: const Color(0xff5768A5),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            alignment: Alignment.centerRight,
            child: BaseText(
              content,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              textAlign: TextAlign.right,
              color: color,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 9, left: 9),
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
              isTypeTurn ? AppLocalizations.current.signingInformation : AppLocalizations.current.noticeOfInvoice,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: const Color(0xff08285C),
            ),
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
                _renderInfo(
                    isTypeTurn ? AppLocalizations.current.numberOfSignatures : AppLocalizations.current.fullName,
                    isTypeTurn ? AppLocalizations.current.turn(0) : profileModel.fullName ?? "",
                    isTypeTurn ? const Color(0xff0D75D6) : const Color(0xff08285C)),
                Visibility(
                    visible: isTypeTurn == false,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        _renderInfo(AppLocalizations.current.phone, profileModel.phone ?? "", const Color(0xff08285C)),
                        const SizedBox(height: 8),
                        _renderInfo(
                            AppLocalizations.current.emailOnly, profileModel.email ?? "", const Color(0xff08285C)),
                        const SizedBox(height: 8),
                        _renderInfo(AppLocalizations.current.address, profileModel.userAddress?.diaChi ?? "",
                            const Color(0xff08285C))
                      ],
                    )),
                const SizedBox(height: 13),
              ],
            ),
          )
        ],
      ),
    );
  }
}
