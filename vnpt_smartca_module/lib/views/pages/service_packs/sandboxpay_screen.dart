import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/service_pack_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/base_screen.dart';

// ignore: must_be_immutable
class SandboxPayScreen extends StatelessWidget {
  final String urlWebview;

  SandboxPayScreen({Key? key, required this.urlWebview}) : super(key: key);

  final controller = Get.find<ServicePackController>();
  late final WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    _webViewController = WebViewController()
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
          onNavigationRequest: (NavigationRequest action) {
            if (action.url.toLowerCase().contains("https://demorms.vnptit.vn") ||
                action.url.toLowerCase().contains("https://smartca.vnpt.vn")) {
              Uri uri = Uri.dataFromString(action.url);
              final String vnptpayResponseCode = uri.queryParameters['vnptpayResponseCode'].toString();
              final String id = uri.queryParameters['data'].toString();

              final String secureCode = uri.queryParameters['secureCode'].toString();
              switch (vnptpayResponseCode) {
                case '00':
                  controller.checkOrderPaymentResult(id, vnptpayResponseCode, secureCode);
                  break;
                default:
                  Get.back();
                  break;
              }
              return NavigationDecision.prevent;
            } else {
              return NavigationDecision.navigate;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(urlWebview));
    return BaseScreen(
      title: AppLocalizations.current.page_servive_pack_order_title,
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
