// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../configs/app_config.dart';
import '../../controller/app_controller.dart';

class LanguageItem extends StatelessWidget {
  LanguageItem({Key? key}) : super(key: key);
  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          child: Obx(
            () {
              final language = controller.language.value == "en" ? "vi" : "en";
              final path = 'assets/images/${language}_language.svg';
              return SvgPicture.asset(path, height: 24, package: AppConfig.package);
            },
          ),
          onTap: () {
            controller.toggleLanguage();
          },
        ),
      ),
    );
  }
}
