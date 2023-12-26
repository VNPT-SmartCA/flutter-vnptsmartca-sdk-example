// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../pages/main/main_body.dart';
import '../../widgets/zoom_drawer.dart';
import '../../widgets/zoom_drawer_config.dart';

import '../../../gen/assets.gen.dart';
import '../../controller/home_controller.dart';
import 'main_menu.dart';

final drawerController = ZoomDrawerController();

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: ZoomDrawer(
        controller: drawerController,
        borderRadius: 24,
        showShadow: true,
        slideWidth: MediaQuery.of(context).size.width * 0.85,
        angle: 0,
        isRtl: true,
        androidCloseOnBackTap: true,
        menuScreenTapClose: true,
        mainScreenTapClose: true,
        menuBackgroundColor: Colors.transparent,
        backgroundImage: Assets.images.background.image(
          width: Get.size.width,
          height: Get.size.height,
          fit: BoxFit.fill,
        ),
        mainScreen: MainBody(),
        menuScreen: MainMenu(),
      ),
    );
  }
}
