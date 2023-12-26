// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/base_screen.dart';

import '../../../../core/models/request/ekyc_result_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/buy_certificate_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_loading.dart';
import '../../../widgets/base_text.dart';
import '../../active_account/bottom_contact.dart';

class RegisterAccountSuccessPage extends StatelessWidget {
  final EkycResponseModel ekycResponseModel;

  RegisterAccountSuccessPage({super.key, required this.ekycResponseModel});

  final buyCertificateController = Get.put(BuyCertificateController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      loadingWidget: BaseLoading<BuyCertificateController>(),
      hideAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: Container(
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
                    AppLocalizations.current.desSuccessfulAccountRegistration,
                    color: Color(0xff08285C),
                    height: 24 / 14,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  AppButtonWidget(
                    label: AppLocalizations.current.registerCert,
                    doublePadding: 15,
                    onTap: () {
                      authController.onLogin(ekycResponseModel.ocrResult.id, ekycResponseModel.password ?? "");
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          BottomContact(),
        ],
      ),
    );
  }
}
