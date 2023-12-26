// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/app_config.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/app_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../pages/certificate/index.dart';
import '../../pages/home/index.dart';

import 'main_page.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final controller = Get.find<AppController>();

  final selectedColor = Color(0xff0D75D6);
  final unselectedColor = Color(0xff5768A5);
  // final pageController = PageController();
  final bodyList = [HomePage(), CertificatePage()];

  _onItemTapped(int index) {
    switch (index) {
      case 2:
        drawerController.toggle!();
        break;

      default:
        controller.selectTab(index);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.refreshMainPage.listen((p0) {
      if (p0 > 0) {
        switch (controller.selectedIndex.value) {
          case 0:
            (bodyList.first as HomePage).controller.onReady();
            break;
          case 1:
            (bodyList[1] as CertificatePage).appRefreshController.refresh();
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        primary: true,
        backgroundColor: Color(0xffF5F7FB),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: bodyList, // No sliding
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedFontSize: 13,
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () => _onItemTapped(0),
                  onDoubleTap: () {
                    (bodyList.first as HomePage).controller.onReady();
                  },
                  child: (controller.selectedIndex.value == 0
                          ? Assets.images.icTabKysoFilled
                          : Assets.images.icTabKyso)
                      .image(
                          width: 24, height: 24, package: AppConfig.package)),
              label: AppLocalizations.current.digitalSignature,
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () => _onItemTapped(1),
                  onDoubleTap: () {
                    (bodyList[1] as CertificatePage)
                        .appRefreshController
                        .refresh();
                  },
                  child: (controller.selectedIndex.value == 1
                          ? Assets.images.icTabCtsFilled
                          : Assets.images.icTabCts)
                      .image(
                          width: 24, height: 24, package: AppConfig.package)),
              label: AppLocalizations.current.certificate,
            ),
            BottomNavigationBarItem(
              icon: Assets.images.icTabOther
                  .image(width: 24, height: 24, package: AppConfig.package),
              label: AppLocalizations.current.other,
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: selectedColor,
          unselectedItemColor: unselectedColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
