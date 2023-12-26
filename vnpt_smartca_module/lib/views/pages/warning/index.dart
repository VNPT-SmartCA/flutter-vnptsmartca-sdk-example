// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../configs/app_config.dart';
import '../../../gen/assets.gen.dart';

import '../../i18n/generated_locales/l10n.dart';
import '../active_account/bottom_contact.dart';

class WarningScreen extends StatelessWidget {
  const WarningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.notsecuredevice.svg(width: 16 * 12),
              SizedBox(height: 30),
              Text(
                AppLocalizations.current.warning,
                style: Get.textTheme.titleLarge?.copyWith(
                    fontFamily: AppConfig.fontFamily,
                    fontSize: 24,
                    color: Color(0xffE51F1F)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                AppLocalizations.current.notSecureDevice,
                style: Get.textTheme.titleLarge?.copyWith(
                    fontFamily: AppConfig.fontFamily, color: Color(0xffE51F1F)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // <-- Radius
                    ),
                    minimumSize: const Size.fromHeight(48),
                    backgroundColor: Color(0xff0D75D6)),
                child: Text(
                  AppLocalizations.current.handlingInstructions,
                  style:
                      TextStyle(fontSize: 16, fontFamily: AppConfig.fontFamily),
                ),
                onPressed: () async {
                  await launchUrl(
                      mode: LaunchMode.externalApplication,
                      Uri.parse(AppConfig.notSecureDeviceLink));
                },
              ),
            ],
          )),
      bottomSheet: BottomContact(),
    );
  }
}
