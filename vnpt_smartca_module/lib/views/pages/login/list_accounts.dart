// ignore_for_file: must_be_immutable, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../widgets/dialog/common_dialog.dart';

class ListAccounts extends GetView<LoginController> {
  ListAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accounts = controller.userInfoList.value;
    final itemBuilder = accounts.map<PopupMenuEntry<String>>((value) {
      return PopupMenuItem(
        value: value.uid,
        child: Row(children: [
          Icon(Icons.account_circle),
          SizedBox(width: 14),
          Expanded(child: Text(value.uid)),
          InkWell(
            child: Icon(Icons.close),
            onTap: () {
              showNotifyModal(
                AppLocalizations.current.deleteAccount,
                onlyActionCancel: false,
                actionAccept: () => controller.removeAccount(value.uid),
              );
            },
          ),
        ]),
      );
    }).toList()
      ..add(PopupMenuItem(
        value: AppLocalizations.of(context).addAccount,
        child: Row(children: [
          Icon(Icons.add_circle_outline),
          SizedBox(width: 14),
          Text(AppLocalizations.of(context).addAccount)
        ]),
      ));

    return Container(
      alignment: Alignment.center,
      child: Obx(() => PopupMenuButton<String>(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.authController.currentUser.value?.uid ?? "",
                    style: TextStyle(
                        color: Color(0xff5768A5),
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 8),
                Icon(Icons.expand_more, color: Color(0xff5768A5))
              ],
            ),
            initialValue: controller.authController.currentUser.value?.uid,
            onSelected: controller.onSelectedAccount,
            splashRadius: 8,
            padding: EdgeInsets.all(20),
            shadowColor: Color(0xff1a34781a),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xffF3F3F3)),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            itemBuilder: (context) => itemBuilder,
          )),
    );
  }
}
