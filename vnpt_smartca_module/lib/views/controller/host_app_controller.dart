import 'package:get/get.dart';
import 'package:vnpt_smartca_module/core/models/response/token_model.dart';

import '../../configs/injector/injector.dart';
import '../../core/models/app/exceptions.dart';
import '../../core/models/app/smartca_message_result.dart';
import '../../core/services/secure_local_storage.dart';
import '../../core/utils/constants.dart';
import '../../method_channel_handler.dart';
import '../i18n/generated_locales/l10n.dart';
import '../utils/enums.dart';
import '../utils/exception_handler.dart';
import '../widgets/navigator_helper.dart';
import 'app_controller.dart';
import 'auth_controller.dart';
import 'home_controller.dart';

class HostAppController extends GetxController {
  final _methodChannelHandler = getIt<MethodChannelHandler>();
  final SecureLocalStorageService _secureLocalDataSource =
      getIt<SecureLocalStorageService>();

  @override
  onInit() {
    super.onInit();
    listenEventFromHost();
  }

  /// Lấy credential được lưu dưới local storage.
  Future<String> _getCredential() async {
    try {
      final _credentialId =
          await _secureLocalDataSource.getLastData(CREDENTIAL_ID_KEY);
      if (_credentialId != null && _credentialId.isNotEmpty) {
        return _credentialId;
      }
    } catch (e) {
      return '';
    }
    return '';
  }

  sendAuthError(String mess) {
    _methodChannelHandler.send(
      method: MethodChannelNames.getAuthenticationResult,
      data: SmartCaResult.sendError(
        '<VNPTSmartCA SDK>: ' + mess,
      ),
    );
    NavigatorHandler.closeSDK();
  }

  sendGetWaitingTransactionError(String mess) {
    _methodChannelHandler.send(
      method: MethodChannelNames.getWaitingTransactionResult,
      data: SmartCaResult.sendError(
        '<VNPTSmartCA SDK>: ' + mess,
      ),
    );
    NavigatorHandler.closeSDK();
  }

  sendListenMainInfo(String mess) {
    _methodChannelHandler.send(
      method: MethodChannelNames.getMainInfoResult,
      data: SmartCaResult.sendError(
        '<VNPTSmartCA SDK>: ' + mess,
      ),
    );
    NavigatorHandler.closeSDK();
  }

  /// Lắng nghe sự kiện lấy access token và credential
  // ignore: long-method
  listenGetAuthentication() {
    _methodChannelHandler.listen(
      method: MethodChannelNames.getAuthentication,
      listener: (event) async {
        try {
          final authController = Get.find<AuthController>();
          final tokenString =
              await _secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);
          TokenModel? tokenModel;
          if (tokenString != null) {
            tokenModel = TokenModel.fromJson(tokenString);
          }

          if (tokenModel != null &&
              tokenModel.expireTime!.millisecondsSinceEpoch <=
                  DateTime.now().millisecondsSinceEpoch - 5 * 60 * 1000) {
            await authController.checkAuth();
            await Future.delayed(Duration(seconds: 2));
          }
          final authState = authController.authStatus.value;
          Get.find<AppController>().currentHostAppMethod.value =
              MethodChannelNames.getAuthentication;
          var accessToken = tokenModel?.accessToken;
          if (authState == AuthenticationStatus.authenticated &&
              accessToken != null) {
            final homeController = Get.put(HomeController());
            homeController.getCertificateListWaitingActive();
          } else {
            SmartCaResult data = SmartCaResult(
              ResultCode.SUCCESS_OPEN,
              ResultCodeDesc.SUCCESS,
            );
            _methodChannelHandler.send(
              method: MethodChannelNames.getAuthenticationResult,
              data: data,
            );
          }
        } catch (e, s) {
          exceptionHandler(GenericException(error: e, stack: s));
          sendAuthError(AppLocalizations.current.getAuthenticationFailed);
        }
      },
    );
  }

  /// Lắng nghe sự kiện xem chi tiết giao dịch chờ ký
  listenGetWaitingTransaction() {
    _methodChannelHandler.listen(
      method: MethodChannelNames.getWaitingTransaction,
      listener: (data) async {
        try {
          Get.find<AppController>().currentHostAppMethod.value =
              MethodChannelNames.getWaitingTransaction;

          final authController = Get.find<AuthController>();
          final authState = authController.authStatus.value;

          if (authState == AuthenticationStatus.authenticated) {
            String tranId = data;
            if (tranId.isNotEmpty) {
              final homeController = Get.isRegistered<HomeController>()
                  ? Get.find<HomeController>()
                  : Get.put(HomeController());
              await homeController.transactionRequestController
                  .getDetailTrans(tranId);
            } else {
              sendGetWaitingTransactionError(
                  AppLocalizations.current.invalidParameter);
            }
          } else {
            sendGetWaitingTransactionError(
                AppLocalizations.current.notAuthenticated);
          }
        } catch (e, s) {
          sendGetWaitingTransactionError(exceptionHandler(GenericException(
            error: e,
            stack: s,
          )));
        }
      },
    );
  }

  listenMainInfo() {
    _methodChannelHandler.listen(
        method: MethodChannelNames.getMainInfo,
        listener: (event) async {
          try {
            Get.find<AppController>().currentHostAppMethod.value =
                MethodChannelNames.getMainInfo;
            SmartCaResult resp = SmartCaResult(
              ResultCode.SUCCESS_CODE,
              ResultCodeDesc.SUCCESS,
            );
            _methodChannelHandler.send(
                method: MethodChannelNames.getMainInfoResult, data: resp);
          } catch (e, s) {
            exceptionHandler(GenericException(error: e, stack: s));
            sendListenMainInfo(e.toString());
          }
        });
  }

  /// Tổng hợp các listeners
  listenEventFromHost() {
    listenGetAuthentication();
    listenGetWaitingTransaction();
    listenMainInfo();
  }
}
