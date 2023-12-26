import 'package:get/get.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../core/services/user_info_on_device.dart';
import '../../../views/controller/certificate_controller.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/active_account/generate_cer_key/index.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

class CommonActionCertificate {
  static goActiveCer(CertificateModel certificateModel, {Function? callBackGetTo}) async {
    final userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();
    // CHECK TRẠNG THÁI CERTIFICATE
    if (certificateModel.isWaitingActive) {
      // CHECK THIẾT BỊ TẠO CERTIFICATE
      var user = await userInfoOnDeviceService.getCurrentUser();
      if (user != null &&
          user.certs != null &&
          (user.certs!.where((element) {
            // trường hợp đã gắn idCer cho cặp khoá
            if (element.id == certificateModel.id) {
              return true;
            }
            // trường hợp có cặp khoá đang chờ gắn idCer
            if (element.id == null) {
              return true;
            }
            return false;
          })).isNotEmpty) {
        Get.to(() => GenerateCerKeyPage(certificateModel: certificateModel))?.then((value) {
          callBackGetTo?.call();
        });
      } else {
        showDialogActiveCerOtherDevice(certificateModel);
      }
    }
  }

  static showDialogActiveCerOtherDevice(CertificateModel certificateModel) async {
    showNotifyModal(AppLocalizations.current.notifActiveCerOtherDevice,
        onlyActionCancel: false,
        titleBtnAccept: AppLocalizations.current.confirm,
        titleBtnCancel: AppLocalizations.current.iUnderstand, actionAccept: () {

        if (certificateModel.serial == null) {
          return;
        }

        final CertificateController controller = Get.find<CertificateController>();
        controller.requestChangeDevice(id: certificateModel.id, serial: certificateModel.serial!);
    });
  }
}
