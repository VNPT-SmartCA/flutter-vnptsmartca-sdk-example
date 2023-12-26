// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../widgets/base_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../i18n/generated_locales/l10n.dart';
import '../../active_account/bottom_contact.dart';

class TutorialRegisterAccountPage extends StatelessWidget {
  TutorialRegisterAccountPage({Key? key}) : super(key: key);

  late final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://smartca.vnpt.vn/km'));
    return BaseScreen(
      title: AppLocalizations.current.tutorialRegisterAccount,
      body: Column(
        children: [
          Expanded(child: WebViewWidget(controller: controller)),
          BottomContact(),
        ],
      ),
    );
  }
}
