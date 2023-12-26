import 'dart:convert';

import 'package:get/get.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/response/link_system_response.dart';
import '../../../views/controller/base_controler.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

import '../../core/models/response/service_response.dart';
import '../../core/services/dart_otp/src/totp.dart';
import '../../core/services/user_info_on_device.dart';
import '../../data/repository/eseal/3rd_repository.dart';
import '../../data/repository/eseal/transaction_repository.dart';
import '../../gen/assets.gen.dart';
import '../i18n/generated_locales/l10n.dart';
import '../widgets/dialog_notification.dart';
import 'auth_controller.dart';
import 'package:base32/base32.dart';

class SystemLinkController extends BaseController {
  final thirdPartyRepositoryEseal = getIt<ThirdPartyRepositoryEseal>();

  RxBool deleteLinkSuccess = false.obs;
  RxBool reLinkSuccess = false.obs;

  final listLinkSystem = Rx<List<LinkSystemModel>>([]);
  final linkUpdatedByConfigTime = Rx<LinkSystemModel?>(null);
  final linkUpdatedByConfigDemand = Rx<LinkSystemModel?>(null);
  final linkUpdatedByPause = Rx<LinkSystemModel?>(null);

  void getList3rdLinks(String idCert) async {
    showLoading();
    try {
      final failureOrVerified =
          await thirdPartyRepositoryEseal.get3rdLinks(idCert);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          listLinkSystem.value = result.data ?? [];
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void deleteLink3rd(String? idLink) async {
    if (idLink == null) return;
    showLoading();
    try {
      final failureOrVerified =
          await thirdPartyRepositoryEseal.requestDelete3rdLink(idLink);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          // deleteLinkSuccess.value = true;
          Get.dialog(DialogNotification(
            image: Assets.images.icDialogSuccess,
            content: AppLocalizations.current.requestUnlinkSuccess,
            onlyActionCancel: true,
          ));
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void reLink3rd(String? idLink, String totp) async {
    if (idLink == null) return;
    showLoading();
    try {
      final failureOrVerified =
          await thirdPartyRepositoryEseal.reLink3rd(idLink, totp);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          // reLinkSuccess.value = true;
          Get.dialog(DialogNotification(
            image: Assets.images.icDialogSuccess,
            content: AppLocalizations.current.requestLinkSuccess,
            onlyActionCancel: true,
          ));
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void set3rdLinkMode(String? idLink, bool permanent, String totp) async {
    if (idLink == null) return;
    showLoading();
    try {
      final failureOrVerified = await thirdPartyRepositoryEseal.set3rdLinkMode(
          idLink, permanent, totp);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          linkUpdatedByConfigDemand.value = result;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void configLifeTime3rdLink(String? idLink, int time, String totp) async {
    if (idLink == null) return;
    showLoading();
    try {
      final failureOrVerified = await thirdPartyRepositoryEseal
          .configLifeTime3rdLink(idLink, time, totp);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          linkUpdatedByConfigTime.value = result;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void pauseLifeTime3rdLink(String? idLink, bool isPause, String totp) async {
    if (idLink == null) return;
    showLoading();
    try {
      final failureOrVerified = await thirdPartyRepositoryEseal
          .pauseLifeTime3rdLink(idLink, isPause, totp);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          linkUpdatedByPause.value = result;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  getTOTP(String credentialId) async {
    try {
      final TransactionRepositoryEseal transactionRepositoryEseal =
          getIt<TransactionRepositoryEseal>();
      final userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();

      final authController = Get.find<AuthController>();

      final currentUser = authController.currentUser.value;
      final certModel =
          await userInfoOnDeviceService.getCerCurrentUserByIdCer(credentialId);

      if (certModel == null || certModel.otpSecret == null) {
        showNotifyModal(AppLocalizations.current.KAKNotFound,
            titleBtnAccept: AppLocalizations.current.changeDevice,
            titleBtnCancel: AppLocalizations.current.close,
            actionAccept: () {},
            onlyActionCancel: false);

        return null;
      }

      var param = {
        'uid': currentUser!.uid,
        'pin': certModel.pin,
        'showQr': true,
        'credentialId': credentialId,
      };

      final failureOrConfirmed =
          await transactionRepositoryEseal.eSealGetCode(param);

      SmartCAApiResponse<dynamic>? resp;

      failureOrConfirmed.fold((l) => throw l, (_resp) => resp = _resp);

      if (resp?.code != 0) {
        var totp = TOTP(secret: certModel.otpSecret ?? "");
        var otp = totp.now();
        return otp;
      }

      final totpBasicSpec = resp?.content['totpBasicSpec'];
      final cert =
          await userInfoOnDeviceService.getCerCurrentUserByIdCer(credentialId);
      final newTOTP = base32.encode(base64Decode(totpBasicSpec['totp']));

      if (cert?.otpSecret != newTOTP) {
        cert?.otpSecret = newTOTP;
        await userInfoOnDeviceService.addOrUpdateCert(currentUser.uid, cert!);
      }
      var totp = TOTP(secret: newTOTP);
      var otp = totp.now();
      return otp;
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
}
