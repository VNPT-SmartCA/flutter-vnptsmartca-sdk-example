import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/app_config.dart';
import '../../controller/enter_info_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/models/response/order_cert_model.dart';

class SandboxPaymentScreen extends StatelessWidget {
  static String routeName = "/SandboxPaymentScreen";

  final OrderCertModel cardInfo;

  final controller = Get.find<EnterInfoController>();

  SandboxPaymentScreen({Key? key, required this.cardInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String url = Get.arguments != null
        ? Get.arguments['url'].toString()
        : 'https://smartca.vnpt.vn/pageNotfound';

    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // ..setBackgroundColor(const Color(0x00000000))
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
              final String vnptpayResponseCode =
              uri.queryParameters['vnptpayResponseCode'].toString();
              final String id = uri.queryParameters['data'].toString();

              final String secureCode =
              uri.queryParameters['secureCode'].toString();
              switch (vnptpayResponseCode) {
                case '00':
                controller.checkOrderPaymentResult(
                    id, vnptpayResponseCode, secureCode, cardInfo.localityCode);
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
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 20.0,
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          AppLocalizations.current.page_servive_pack_order_title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        flexibleSpace: Image(
          image: AssetImage("assets/images/account_tab_background.png", package: AppConfig.package),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
