// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/models/app/purchase_cert_order_item_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../register_account/certificate_pack_screen.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_text.dart';

class BuyCertWidget extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 100, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Assets.images.imgRegisterAcocuntSuccess.image(
                  width: 250,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 50),
              BaseText(
                AppLocalizations.current.successfulAccountRegistration,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff08285C),
                height: 24 / 14,
              ),
              SizedBox(height: 10),
              BaseText(
                "${AppLocalizations.current.youDontHaveCert}. ${AppLocalizations.current.pleaseChooseRegisterCert}!",
                color: Color(0xff08285C),
                height: 24 / 14,
                textAlign: TextAlign.center,
              ),
              // Spacer(),
              SizedBox(height: 30),
              AppButtonWidget(
                label: AppLocalizations.current.registerCert,
                doublePadding: 15,
                onTap: () async {
                  final user = authController.currentUser.value;

                  CardInfo cardInfo = CardInfo();
                  cardInfo.IDCardInfo = ItemInfo()
                    ..FullName = user?.displayName;
                  cardInfo.Email = user?.email;
                  cardInfo.Phone = user?.phone;
                  cardInfo.Address = ItemAddress()..DiaChi;

                  Get.to(() => CertificatePackScreen(
                      cardInfo: cardInfo, listCerts: []))?.then((value) {
                    homeController.getCertificateListWaitingActive();
                  });
                },
              ),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
