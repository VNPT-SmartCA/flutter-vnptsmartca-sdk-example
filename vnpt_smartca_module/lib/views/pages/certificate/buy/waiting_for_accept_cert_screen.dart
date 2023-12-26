// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/base_screen.dart';

import '../../../../core/models/response/order_cert_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/app_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_text.dart';
import '../../active_account/bottom_contact.dart';

class WaitingForAcceptCertScreen extends StatelessWidget {
  // final EkycResponseModel ekycResponseModel;

  final OrderCertModel orderCertModel;

  const WaitingForAcceptCertScreen({super.key, required this.orderCertModel});

  // final buyCertificateController = Get.put(BuyCertificateController());
  // final authController = Get.find<AuthController>();

  _backToHome(BuildContext context) {
    final appController = Get.find<AppController>();
    appController.backToMainPage();

    // Navigator.popUntil(context, (route) => route.isFirst);
  }

  _getTitle() {
    if (orderCertModel.getTypeEnum() == OrderType.newCert) {
      return AppLocalizations.current.waitingForAcceptCertTitle;
    } else if (orderCertModel.getTypeEnum() == OrderType.changeDevice) {
      return AppLocalizations.current.waitingForAcceptChangeDeviceTitle;
    } else if (orderCertModel.getTypeEnum() == OrderType.renewCert) {
      return AppLocalizations.current.waitingForAcceptExtendTitle;
    } else if (orderCertModel.getTypeEnum() == OrderType.changeInfo) {
      return AppLocalizations.current.waitingForAcceptChangeInfoTitle;
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _backToHome(context);
        return true;
      },
      child: BaseScreen(
        // loadingWidget: BaseLoading<BuyCertificateController>(),
        hideAppBar: true,
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 100, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Assets.images.icChoduyet.image(
                        width: 250,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 50),
                    BaseText(
                      _getTitle(),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff08285C),
                      textAlign: TextAlign.center,
                      height: 24 / 14,
                    ),
                    SizedBox(height: 10),
                    BaseText(
                      AppLocalizations.current.waitingForAcceptCertDescription,
                      color: Color(0xff08285C),
                      height: 24 / 14,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    AppButtonWidget(
                      label: AppLocalizations.current.iUnderstand,
                      doublePadding: 15,
                      onTap: () {
                        _backToHome(context);
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            BottomContact(),
          ],
        ),
      ),
    );
  }
}
