import 'package:dartx/dartx.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../views/controller/auth_controller.dart';
import '../../configs/injector/injector.dart';
import '../../core/services/secure_local_storage.dart';
import '../../core/services/econtract_service.dart';
import '../../core/utils/constants.dart';
import '../../data/network/auth_api.dart';

class ContractController extends GetxController {
  AuthRemoteApi authenService = getIt<AuthRemoteApi>();
  ContractService eContractService = ContractService();
  final _localDataSource = getIt<SecureLocalStorageService>();

  // final IErrorHandlerService _errorHandlerService =
  //     Injector().errorHandlerServiceService;

  final accessTokenSSO = ''.obs;
  final refresh_token = ''.obs;

  final isContractSuccess = false.obs;
  final authStatus = false.obs;
  final requiredContract = false.obs;
  final uid = ''.obs;

  // kiểm tra lại xem hợp đồng đã ký chưa?
  Future<bool?> checkSigned(String orderIdContract) async {
    final result = await authenService.isSignedContract(orderIdContract);
    return result.contractData?.isSigned;
  }

  Future signedContract({String? orderId}) async {
    try {
      isContractSuccess.value = false;
      var token = await authenService.getAppAccessToken();
      String accessToken = token.accessToken;
      if (accessToken.isEmpty) {
        // await _errorHandlerService.sendErrorToServer(
        //     "showContract", AppLocalizations.current.invalidToken);
        return;
      }
      uid.value = await _localDataSource.getLastData(USERNAME_KEY) ?? "";
      final authController = Get.find<AuthController>();
      final currentUser = authController.currentUser.value;

      final phone = currentUser?.phone ?? "";
      if (currentUser?.phone == null) {
        isContractSuccess.value = false;
        // showErrorModal(AppLocalizations.current.phoneNumberIncorrect);
      } else {
        final result = await authenService.ssoContract(accessToken, phone);
        if (result.access_token == null) {
          // showErrorModal(result.message);
          debugPrint(result.message);
        } else {
          accessTokenSSO.value = result.access_token ?? "";
          refresh_token.value = result.refresh_token ?? "";

          if (orderId.isNotNullOrBlank) {
            bool? isSigned = await checkSigned(orderId!);
            if (!isSigned!) {
              var eContractResult = await eContractService.signContract(
                  accessTokenSSO.value, orderId);
              if (eContractResult != null) {
                if (eContractResult['isSuccess']) {
                  isContractSuccess.value = eContractResult['isSuccess'];
                }
              }
            } else {
              isContractSuccess.value = true;
            }
          } else {
            // showErrorModal('Không lấy được thông tin mã đơn hàng!');
            debugPrint('Không lấy được thông tin mã đơn hàng!');
          }
        }
      }
    } catch (e) {
      // showErrorModal(S.current.contractMessage);
      debugPrint(e.toString());
    }
  }

  Future<bool> getContractSuccess() async {
    final isSuccess = await _localDataSource.getLastData(eCONTRACT_SUCCESS);
    if (isSuccess == "true") {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }

  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
  }
}
