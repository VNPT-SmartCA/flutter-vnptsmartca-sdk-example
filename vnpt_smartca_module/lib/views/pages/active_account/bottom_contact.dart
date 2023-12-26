// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../configs/app_config.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../utils/common.dart';
import '../../widgets/base_text.dart';

class BottomContact extends StatelessWidget {
  const BottomContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseText(
            AppLocalizations.current.contactCSKH,
            color: Color(0xff5768A5),
          ),
          SizedBox(width: 5),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: Common.callHotline,
            child: BaseText(
              AppConfig.hotline,
              color: Color(0xff5768A5),
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
