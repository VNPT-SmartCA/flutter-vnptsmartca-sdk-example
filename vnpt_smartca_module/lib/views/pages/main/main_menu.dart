// ignore_for_file: prefer_const_constructors, prefer_function_declarations_over_variables, sort_child_properties_last, deprecated_member_use

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/home_controller.dart';
import '../../pages/account_information/index.dart';
import '../../pages/certificate/select_cert_screen.dart';
import '../../utils/common.dart';
import '../../widgets/dialog/common_dialog.dart';

import '../../../configs/app_config.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/app_controller.dart';
import '../../controller/auth_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../certificate/buy/order_list_screen.dart';
import '../system_link/list/index.dart';

class MainMenu extends StatelessWidget {
  MainMenu({super.key});

  final authController = Get.find<AuthController>();
  final appController = Get.find<AppController>();

  final menuItem = (String title,
          {Function()? onTap, Widget? icon, Widget? trailing}) =>
      ListTile(
        contentPadding: EdgeInsets.only(bottom: 6),
        trailing: trailing ?? Icon(Icons.navigate_next),
        title: Row(children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: icon,
          ),
          Text(title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
        ]),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: SafeArea(
            child: Center(
              child: ListView(
                primary: true,
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16),
                children: [
                  Row(children: [
                    //NOTE: ----- Ngôn ngữ -----
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Icon(Icons.language, color: Color(0xff0D75D6)),
                    ),
                    Text(AppLocalizations.current.language,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    Spacer(),
                    Obx(() => Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: appController.language.value == "vi"
                                  ? Border.all(width: 2.5, color: Colors.white)
                                  : null),
                          child: InkWell(
                            child: Assets.images.vi.image(height: 24),
                            onTap: () {
                              if (appController.language.value == "vi") return;
                              appController.toggleLanguage();
                            },
                          ),
                        )),
                    SizedBox(width: 16),
                    Obx(() => Container(
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: appController.language.value == "en"
                                ? Border.all(width: 2, color: Colors.white)
                                : null),
                        child: InkWell(
                          child: Assets.images.en.image(height: 24),
                          onTap: () {
                            if (appController.language.value == "en") return;
                            appController.toggleLanguage();
                          },
                        )))
                  ]),
                  //NOTE: ----- Sinh trắc học -----
                  SizedBox(height: 16),
                  if (authController.canCheckBiometrics.value)
                    menuItem(AppLocalizations.current.biometrics,
                        onTap: authController.toggleAuthBiometrics,
                        trailing: Obx(() => Transform.scale(
                            scale: 0.85,
                            child: Container(
                                padding: EdgeInsets.all(0),
                                margin: EdgeInsets.only(right: 0),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(50),
                                    border: authController.currentUser.value
                                                ?.useBiometric !=
                                            true
                                        ? Border.all(
                                            width: 0.2, color: Colors.white)
                                        : null),
                                child: CupertinoSwitch(
                                  value: authController
                                          .currentUser.value?.useBiometric ??
                                      false,
                                  onChanged: (value) =>
                                      authController.toggleAuthBiometrics(),
                                )))),
                        icon: Assets.images.faceId
                            .svg(color: Color(0xff0D75D6), height: 24)),
                  // NOTE: ----- Thông tin tài khoản -----
                  menuItem(
                    AppLocalizations.current.accountInformation,
                    icon:
                        Icon(Icons.person_2_outlined, color: Color(0xff0D75D6)),
                    onTap: () {
                      Get.to(AccountInformationPage());
                    },
                  ),
                  // NOTE: ---- Hệ thống liên kết -----
                  menuItem(
                    AppLocalizations.current.linkSystem,
                    icon: Assets.images.icLinkSystem.image(height: 24),
                    onTap: () {
                      final homeController = Get.find<HomeController>();
                      final listCert =
                          homeController.listCertificate.value ?? [];
                      List<CertificateModel> listCertOK = listCert
                          .where((i) =>
                              i.status == 0 && i.certProfile?.isEseal() == true)
                          .toList();

                      if (listCertOK.length == 0) {
                        showNotifyModal(AppLocalizations.current.notUseeSeal);
                        return;
                      } else if (listCertOK.length == 1) {
                        Get.to(ListSystemLinkPage(idCert: listCertOK.first.id));
                      } else {
                        Get.to(SelectCertScreen(isSystemLink: true));
                      }
                    },
                  ),
                  //NOTE: ----- Danh sách đơn hàng -----
                  menuItem(AppLocalizations.current.orderList,
                      icon: Icon(Icons.shopping_cart_outlined,
                          color: Color(0xff0D75D6)), onTap: () {
                    Get.to(() => OrderListScreen());
                  }),
                  //NOTE: ----- Đổi mật khẩu -----
                  // menuItem(AppLocalizations.current.changePassword,
                  //     icon: Icon(Icons.password, color: Color(0xff0D75D6))),
                  // //NOTE: ----- Đổi PIN -----
                  // menuItem(AppLocalizations.current.changePIN,
                  //     icon: Icon(Icons.pin_outlined, color: Color(0xff0D75D6))),
                  //NOTE: ----- Đổi thiết bị -----
                  menuItem(AppLocalizations.current.changeDevice,
                      icon: Icon(Icons.phone_iphone_outlined,
                          color: Color(0xff0D75D6)), onTap: () {
                    Get.to(() => SelectCertScreen());
                  }),
                  //NOTE: ----- FAQ -----
                  menuItem(
                    AppLocalizations.current.faq,
                    icon: Icon(Icons.live_help_outlined,
                        color: Color(0xff0D75D6)),
                    onTap: () async => await launchUrl(
                        mode: LaunchMode.externalApplication,
                        Uri.parse(AppConfig.faqLink)),
                  ),
                  //NOTE: ----- Lịch sử app -----
                  // menuItem(
                  //   AppLocalizations.current.updateHistory,
                  //   icon: Icon(Icons.history, color: Color(0xff0D75D6)),
                  //   onTap: () async => await launchUrl(
                  //       mode: LaunchMode.externalApplication,
                  //       Uri.parse(AppConfig.updateHistoryLink +
                  //           (Platform.isAndroid ? "android" : "ios"))),
                  // ),
                  //NOTE: ----- Logout -----
                  SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(140, 42),
                      visualDensity: VisualDensity.comfortable,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(6), // <-- Radius
                      ),
                    ),
                    child: Text(AppLocalizations.current.signOut),
                    onPressed: authController.signOut,
                  ),
                  //NOTE: ----- Hotline -----
                  SizedBox(height: 40),
                  InkWell(
                    onTap: Common.callHotline,
                    child: Text(
                        "${AppLocalizations.current.hotline}: ${AppConfig.hotline}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  //NOTE: ----- Version -----
                  SizedBox(height: 20),
                  Obx(() => Text(
                      "${AppLocalizations.current.version} SDK ${appController.appVersion.value}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
