// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/service_packs/service_pack_order_history_srceen.dart';

import '../../widgets/app_button_widget.dart';
import '../../widgets/base_screen.dart';
import '../../widgets/base_text.dart';

class VNPTPayNotifyScreen extends StatelessWidget {
  const VNPTPayNotifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = Get.arguments != null
        ? Get.arguments["message"].toString()
        : AppLocalizations.current.notify_extend_personal_sign_success;
    return BaseScreen(
      title: AppLocalizations.current.page_servive_pack_order_title,
      onBackPress: () {
        Get.off(() => ServicePackOrderHistoryScreen());
      },
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/success.svg',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: BaseText(
                message,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 8),
              child: BaseText(
                AppLocalizations.current.page_servive_pack_order_desc,
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5, bottom: 15)),
            AppButtonWidget(
              label: AppLocalizations.current.link_view_service_pack_order_history_page,
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Get.to(() => ServicePackOrderHistoryScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
