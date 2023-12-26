// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../configs/injector/injector.dart';
import '../../../../core/models/response/profile_model.dart';
import '../../../../core/models/response/service_pack_model.dart';
import '../../../../core/services/secure_local_storage.dart';
import '../../../../core/utils/constants.dart';
import '../../../controller/service_pack_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/common.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_edit_text.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';
import '../list_package_signature/index.dart';
import 'order_confirmation_loading.dart';

class OrderConfirmationPage extends StatefulWidget {
  final ServicePackModel packageModel;

  OrderConfirmationPage({Key? key, required this.packageModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OrderConfirmationState();
}

class OrderConfirmationState extends State<OrderConfirmationPage> {
  final _secureLocalDataSource = getIt<SecureLocalStorageService>();
  ProfileModel? userProfile;

  final controller = Get.find<ServicePackController>();

  late int totalMoney;

  @override
  void initState() {
    super.initState();
    getUserInformation();
  }

  @override
  Widget build(BuildContext context) {
    totalMoney = widget.packageModel.priceType == 1
        ? widget.packageModel.price * widget.packageModel.signTurnNumber
        : widget.packageModel.price;
    return BaseScreen(
      title: AppLocalizations.current.certificate_package_page_confirm_order_title,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        color: Color(0xffF5F7FB),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CertPackageViewWidget(packageModel: widget.packageModel, showBill: true),
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            AppLocalizations.current.invoiceInformation,
                            color: Color(0xff08285C),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 15),
                          _itemInformation(AppLocalizations.current.fullName, userProfile?.fullName),
                          _itemInformation(AppLocalizations.current.phone, userProfile?.phone),
                          _itemInformation(AppLocalizations.current.email, userProfile?.email),
                          _itemInformation(AppLocalizations.current.address, userProfile?.address, marginBottom: 0),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    FormBuilder(
                      key: controller.formKey,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 12),
                        child: BaseEditText(
                          label: AppLocalizations.current.referralCode,
                          paddingHorizontal: 8,
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
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffE7F1FB),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xff0D75D6)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    AppLocalizations.current.service_pack_total_amount,
                    color: Color(0xff5768A5),
                    fontSize: 16,
                  ),
                  SizedBox(height: 10),
                  BaseText(
                    Common.formatPrice(totalMoney),
                    color: Color(0xff0D75D6),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 5),
                  BaseText(
                    AppLocalizations.current.included10VAT,
                    color: Color(0xff5768A5),
                    fontStyle: FontStyle.italic,
                  ),
                  SizedBox(height: 10),
                  AppButtonWidget(
                    label: AppLocalizations.current.btnPayment,
                    doublePadding: 15,
                    onTap: () {
                      controller.onFormSubmit(widget.packageModel);
                      Get.to(() => OrderConfirmationLoadingPage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemInformation(String title, String? content, {double marginBottom = 15}) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 110,
            child: BaseText(
              title,
              color: Color(0xff102459),
            ),
          ),
          Expanded(
            child: BaseText(
              content,
              color: Color(0xff102459),
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getUserInformation() async {
    String? strProfile = await _secureLocalDataSource.getLastData(LOCAL_USER_PROFILE);
    if (strProfile != null) {
      userProfile = ProfileModel.fromJson(json.decode(strProfile));
      setState(() {});
    }
  }
}
