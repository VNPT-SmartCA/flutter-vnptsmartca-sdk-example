import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../pages/main/main_page.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => Container(),
    ),
    GetPage(
      name: AppRoutes.MAIN,
      page: () => MainPage(),
    ),
  ];
}
