// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_is_empty

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scale_size/scale_size.dart';
import '../../../core/models/request/history_request_model.dart';
import '../../../core/models/response/transaction_model.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/app_controller.dart';
import '../../controller/auth_controller.dart';
import '../../controller/home_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../pages/account_information/index.dart';
import '../../pages/certificate/common_action.dart';
import '../../pages/doc_sign_history/index.dart';
import '../../pages/transaction_request/index.dart';
import '../../utils/enums.dart';
import '../../widgets/app_refresh.dart';
import '../../widgets/dialog/modal_bottom_sheet.dart';
import '../../widgets/widget.dart';

import '../active_account/setup_pin_code/index.dart';
import '../certificate/buy/order_list_screen.dart';
import 'widgets/biometric_auth.dart';
import 'widgets/buy_cert.dart';
import 'widgets/doc_sign_history.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();
  final authController = Get.find<AuthController>();

  HomePage({Key? key}) : super(key: key) {
    Timer(
      Duration(milliseconds: 400),
      () {
        if (authController.currentUser.value?.useBiometric == null) {
          CustomBottomSheetDialog.show(
            isScrollControlled: true,
            title: AppLocalizations.current.biometricAuthentication,
            childBuilder: (context) => BiometricAuthWidget(),
          );
        }
      },
    );
  }

  recentHistory() {
    return [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.to(() => TransactionRequests()),
              child: BaseText(
                AppLocalizations.current.recentTransactions,
                color: Color(0xff08285C),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const ListDocSignHistoryPage());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: BaseText(
                  AppLocalizations.current.viewMore,
                  color: Color(0xff0D75D6),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: AppRefresh<TransactionModel>(
          path: "/csc/signature/his",
          keyController: "/csc/signature/his",
          fromMap: TransactionModel.fromMap,
          params:
              HistoryRequestModel(order: 'InitialDate', isDesc: true).toMap(),
          appRefreshController: controller.appRefreshController,
          itemWidgetBuilder: (value, index) {
            return DocSignatureHistoryWidget(value: value);
          },
          isLoadMore: false,
          itemSpace: 8,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var listCert = controller.listCertificate.value;
      var listOrder = controller.listOrder.value;

      final isShowOrderList = (listOrder != null &&
              listOrder.length != 0 &&
              listCert?.length == 0) ||
          (listCert != null &&
              listCert.length == 1 &&
              listCert.first.status == StatusCertEnum.WAITING_APPROVE.index);

      final isShowBuyCert =
          listOrder != null && listOrder.length == 0 && listCert?.length == 0;

      return Column(
        children: [
          _UserProfileWidget(),
          NotificationWidget(),
          if (isShowOrderList)
            Expanded(
                child: OrderListScreen(
              hiddenBack: true,
              appBarColor: const Color.fromRGBO(241, 244, 250, 1),
              appBarBoxShadowColor: Colors.transparent,
            )),
          if (isShowBuyCert) Expanded(child: BuyCertWidget()),
          if (controller
              .transactionRequestController.transactionRequestList.isNotEmpty)
            Expanded(child: TransactionRequests()),
          if (!isShowOrderList &&
              !isShowBuyCert &&
              controller.transactionRequestController.transactionRequestList
                  .isEmpty) ...[
            // _UserNotificationWidget(),
            SizedBox(height: 15),
            ...recentHistory()
          ],
        ],
      );
    });
  }
}

// class _UserNotificationWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return _CardWrapperWidget(
//       child: Container(
//         padding: EdgeInsets.all(8),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Assets.images.icHomeNotification
//                 .image(width: 24, height: 24, fit: BoxFit.fill),
//             SizedBox(width: 8),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   BaseText(
//                     "Chứng thư số 01",
//                     color: Color(0xff0D75D6),
//                     fontWeight: FontWeight.w700,
//                     height: 21 / 14,
//                   ),
//                   SizedBox(height: 4),
//                   BaseText(
//                     "Nhấn để hiển thị mã OTP của chứng thư số",
//                     color: Color(0xff08285C),
//                     height: 21 / 14,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class _UserProfileWidget extends StatelessWidget {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 1.top + 9, bottom: 9),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Color(0xffe9ecf4), blurRadius: 20, spreadRadius: 1)
      ]),
      child: InkWell(
        onTap: () {
          Get.to(AccountInformationPage());
        },
        child: Row(
          children: [
            Assets.images.icHomeLogo
                .image(fit: BoxFit.fill, width: 50, height: 50),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => BaseText(
                      (controller.currentUser.value?.displayName ?? "")
                          .capitalize,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 24 / 16,
                      color: Color(0xff08285C),
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 4),
                  Obx(
                    () => BaseText(
                      AppLocalizations.current
                          .citizenId(controller.currentUser.value?.uid ?? ""),
                      height: 22 / 14,
                      color: Color(0xff5768A5),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final controller = Get.find<HomeController>();
  final appController = Get.find<AppController>();
  bool isShow = true;

  // @override
  // void initState() {
  //   debugPrint(">>>>controller.getCertificateListWaitingActive();");
  //   controller.getCertificateListWaitingActive();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var list = controller.listCertificateWaitingActive.value;
      // chỉ show khi có 1 cer cần active
      // if (list.length == 1 && isShow) {
      if (list.isNotEmpty && isShow) {
        return Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  if (list.length == 1) {
                    if (list.first.isNeedAssignKey) {
                      Get.to(() => SetupPinCodePage(
                            certificateModel: list.first,
                          ));
                    } else {
                      CommonActionCertificate.goActiveCer(list.first,
                          callBackGetTo: () {
                        controller.getCertificateListWaitingActive();
                      });
                    }
                  } else {
                    appController.selectTab(1);
                  }
                  // CommonActionCertificate.goActiveCer(list.first);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Assets.images.bgNotificaion.provider()),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: renderContent(list.length),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Assets.images.icNotification
                            .image(width: 64, height: 64),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isShow = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Assets.images.icQrClose
                        .image(width: 14, height: 14, color: Color(0xff5768A5)),
                  ),
                ),
              )
            ],
          ),
        );
      }
      return const SizedBox();
    });
  }

  renderContent(int numberCert) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          AppLocalizations.current.activeCer,
          color: Color(0xff08285C),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 3),
        BaseText(
          AppLocalizations.current.numberWaitingActiveCer(numberCert),
          color: Color(0xff5768A5),
          fontSize: 12,
        ),
        SizedBox(height: 3),
        BaseText(
          AppLocalizations.current.activeNow,
          color: const Color(0xff5768A5),
          fontWeight: FontWeight.w600,
          fontSize: 12,
        )
      ],
    );
  }
}
