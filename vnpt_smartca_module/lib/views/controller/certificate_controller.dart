import 'package:get/get.dart';
import '../../../configs/injector/injector.dart';
import '../../../data/repository/certificate_repository.dart';

import '../../core/models/app/exceptions.dart';
import '../../core/models/response/order_cert_model.dart';
import '../../core/models/response/service_response.dart';
import '../i18n/generated_locales/l10n.dart';
import '../pages/certificate/buy/order_detail_screen.dart';
import '../pages/change_device/sign_bill.dart';
import '../utils/exception_handler.dart';
import '../widgets/dialog/common_dialog.dart';
import '../widgets/dialog_notification.dart';
import 'base_controler.dart';

class CertificateController extends BaseController {
  final certificateRepository = getIt<CertificateRepository>();

  final RxString currentName = "".obs;

  final requestChangeDeviceResponse = Rx<SmartCAApiResponse?>(null);

  final orderCertModel = Rx<OrderCertModel?>(null);

  void requestChangeDevice({required String id, required String serial}) async {
    showLoading();
    try {
      final failureOrVerified = await certificateRepository.requestChangeDevice(serial);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          if (result.code == 60014) {
            // YEU CAU DA TON TAI
            Get.dialog(DialogNotification(
              content: result.message,
              titleBtnAccept: AppLocalizations.current.Continue,
              actionAccept: () {
                // GET DETAIL ORDER
                OrderCertModel resp = OrderCertModel.fromJson(result.content);
                if (resp.getTypeEnum() == OrderType.changeDevice) {
                  String orderId = resp.id;
                  Get.to(() => SignBillPage(serial: serial, orderId: orderId));
                } else {
                  Get.to(() => OrderDetailScreen(orderCertModel: resp));
                }
              },
            ));
          } else {
            OrderCertModel resp = OrderCertModel.fromJson(result.content);
            Get.to(() => SignBillPage(serial: serial, orderId: resp.id));
          }
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void getDetailOrder(String idCert) async {
    showLoading();
    try {
      final failureOrVerified = await certificateRepository.getDetailOrder(idCert);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          orderCertModel.value = result;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void changeName(String idCert, String newName) async {
    showLoading();
    try {
      final failureOrVerified = await certificateRepository.changeName(idCert, newName);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) {
          currentName.value = newName;
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
}
