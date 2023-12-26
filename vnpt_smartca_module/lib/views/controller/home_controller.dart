// ignore_for_file: prefer_is_empty

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vnpt_smartca_module/core/models/app/smartca_message_result.dart';
import 'package:vnpt_smartca_module/core/models/response/token_model.dart';
import 'package:vnpt_smartca_module/core/utils/constants.dart';
import 'package:vnpt_smartca_module/method_channel_handler.dart';
import 'package:vnpt_smartca_module/views/pages/certificate/select_cert_screen.dart';
import 'package:vnpt_smartca_module/views/widgets/navigator_helper.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../data/repository/certificate_repository.dart';
import '../../../views/controller/app_controller.dart';
import '../../../views/controller/auth_controller.dart';
import '../../../views/controller/transaction_controller.dart';
import '../../../views/utils/enums.dart';
import '../../../views/widgets/app_refresh.dart';

import '../../core/models/response/order_cert_model.dart';
import '../../core/services/secure_local_storage.dart';
import '../../data/repository/order_cert_repository.dart';
// import 'firebase_controller.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;

  final _certificateRepository = getIt<CertificateRepository>();
  final listCertificateWaitingActive = Rx<List<CertificateModel>>([]);
  final transactionRequestController = Get.put(TransactionController());
  final authController = Get.find<AuthController>();
  final appController = Get.find<AppController>();
  final AppRefreshController appRefreshController = AppRefreshController();
  // final firebaseController = Get.find<FirebaseController>();

  final orderCertRepository = getIt<OrderCertRepository>();
  final secureStorage = getIt<SecureLocalStorageService>();
  final listCertificate = Rx<List<CertificateModel>?>(null);
  final listOrder = Rx<List<OrderCertModel>?>(null);

  @override
  void onInit() {
    super.onInit();

    authController.authStatus.listen((status) {
      if (status == AuthenticationStatus.authenticated) {
        onReady();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();

    getCertificateListWaitingActive();
    transactionRequestController.getTransactionRequests();
  }

  void getCertificateListWaitingActive() async {
    try {
      final failureOrCertList =
          await _certificateRepository.getCertificateList();
      failureOrCertList.fold(
        (failure) {},
        (res) {
          var list = CertificateListModel.fromMap(res.content);
          List<CertificateModel> listCer = [];
          for (var element in list.items) {
            if (element.countCertNotificationInHome()) {
              listCer.add(element);
            }
          }
          listCertificateWaitingActive.value = listCer;

          listCertificate.value = list.items;
          ///list = 1. mà getAuth thì về native luôn
          var listCertActive = listCertificate.value?.where((element) {
            return element.typeStatus == StatusCertEnum.VALID;
          }).toList();
          if (listCertActive?.length == 1 &&
              Get.find<AppController>().currentHostAppMethod.value ==
                  MethodChannelNames.getAuthentication) {
            onSendDataNative(listCertActive!.first.id);
            return;
          } else if (listCertActive?.length != 1 &&
              Get.find<AppController>().currentHostAppMethod.value ==
                  MethodChannelNames.getAuthentication) {
            SmartCaResult data = SmartCaResult(
              ResultCode.SUCCESS_OPEN,
              ResultCodeDesc.SUCCESS,
            );
            final methodChannelHandler = getIt<MethodChannelHandler>();
            methodChannelHandler.send(
              method: MethodChannelNames.getAuthenticationResult,
              data: data,
            );
          }
          // firebaseController.updateFirebaseToken(list.items);

          if (list.items.length == 0) {
            getListOrder();
          }
        },
      );
    } catch (e) {}
  }
  onSendDataNative(String certId) async {
    // await getIt<SecureLocalStorageService>().saveData(CREDENTIAL_ID_KEY, certId);
    final methodChannelHandler = getIt<MethodChannelHandler>();
    final tokenString =
    await getIt<SecureLocalStorageService>().getLastData(LOCAL_ACCESS_TOKEN_AUTH);
    if (tokenString != null && tokenString.isNotEmpty) {
      TokenModel token = TokenModel.fromJson(tokenString);
      SmartCaResult data = SmartCaResult(
          ResultCode.SUCCESS_CODE,
          ResultCodeDesc.SUCCESS,
          jsonEncode({
            'accessToken': token.accessToken,
            'credentialId': certId,
          }));

      methodChannelHandler.send(
        method: MethodChannelNames.getAuthenticationResult,
        data: data,
      );
      NavigatorHandler.closeSDK();
    }
  }


  void getListOrder() async {
    try {
      final failureOrVerified = await orderCertRepository.getOrderList();
      failureOrVerified.fold(
        (failure) => {},
        (result) async {
          OrderCertListModel orderCertListModel =
              OrderCertListModel.fromMap(result.content);
          listOrder.value = orderCertListModel.items;
        },
      );
    } catch (e) {}
  }
}
