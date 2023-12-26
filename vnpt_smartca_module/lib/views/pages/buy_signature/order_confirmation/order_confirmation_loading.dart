// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';
import '../../../widgets/loading_circle_widget.dart';
import '../../active_account/bottom_contact.dart';

class OrderConfirmationLoadingPage extends StatelessWidget {
  OrderConfirmationLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.infoBuySignature,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingCircleWidget(sizeLoading: 150),
                  SizedBox(height: 20),
                  BaseText(
                    AppLocalizations.current.processingPackageSignature,
                    color: Color(0xff5768A5),
                    textAlign: TextAlign.center,
                    height: 24 / 14,
                  ),
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
