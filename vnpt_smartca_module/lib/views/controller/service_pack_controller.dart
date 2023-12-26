import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/request/login.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../core/models/response/service_pack_model.dart';
import '../../../core/models/response/token_model.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../core/utils/constants.dart';
import '../../../data/repository/authen_repository.dart';
import '../../../data/repository/service_pack_page_respository.dart';
import '../../../views/controller/app_controller.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/service_packs/sandboxpay_screen.dart';
import '../../../views/pages/service_packs/service_pack_order.dart';
import '../../../views/pages/service_packs/vnptpay_notify_screen.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

import '../../gen/assets.gen.dart';
import '../widgets/dialog_notification.dart';

class ServicePackController extends GetxController {
  final _servicePackRepository = getIt<ServicePackRepository>();
  final secureLocalDataSource = getIt<SecureLocalStorageService>();
  final _authenRepository = getIt<AuthenRepository>();

  final refreshController = RefreshController(initialRefresh: true);

  var servicePackItems = List<ServicePackModel>.empty().obs;
  var cartItems = List<ServicePackModel>.empty().obs;
  var loading = false.obs;
  var subtotalPrice = 0.0.obs;
  var subtotalSignturn = 0.obs;

  final formKey = GlobalKey<FormBuilderState>();

  onFormSubmit(ServicePackModel packageModel) {
    if (formKey.currentState!.saveAndValidate()) {
      final values = formKey.currentState!.value;
      var referralCode = values["referralCode"] ?? "";
      createPersonalSignTurnOrder(packageModel, referralCode);
    }
  }

  /*
    nvtruong: Lấy danh sách gói lượt ký
   */
  // ignore: long-methods
  // ignore: long-method
  Future<void> getListPackageSignatures(CertificateModel certModel) async {
    try {
      loading.value = true;

      final tokenString = await secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);
      if (tokenString == null) {
        loading.value = false;
        showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
        return;
      }
      var token = TokenModel.fromJson(tokenString);

      // Xóa KAK nếu như cert status == REVOKED // đã hết hạn/ tạm dừng
      if (certModel.status == 5 || certModel.status == 4 || certModel.status == 6 || certModel.certExpired == 0) {
        loading.value = false;
        showErrorModal(certModel.certStatusMessage);
      } else {
        final failureOrServicePackItems = await _servicePackRepository.getServicePacks(token.accessToken);
        failureOrServicePackItems.fold(
          (failure) => {
            showErrorModal(exceptionHandler(failure)),
          },
          (result) => {
            servicePackItems.value = result,
          },
        );
      }
    } catch (e, s) {
      loading.value = false;
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  /*
    nvtruong: Hàm thanh toán đơn hàng (hàm này sẽ connect api qua vnpt dưới dạng webview)
   */
  // ignore: long-method
  Future<void> createPersonalSignTurnOrder(ServicePackModel packageModel, String referralCode) async {
    try {

      final tokenString = await secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);
      if (tokenString == null) {
        showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
        return;
      }

      final failureOrServicePackItems = await _servicePackRepository.createServicePackOrder(packageModel, referralCode);
      failureOrServicePackItems.fold(
        (failure) => {
          Get.back(),
          Get.dialog(
            DialogNotification(
              title: AppLocalizations.current.paymentFailed,
              content: AppLocalizations.current.pleaseMakePaymentAgain,
              image: Assets.images.icDialogFail,
              onlyActionAccept: true,
              titleBtnAccept: AppLocalizations.current.makePaymentAgain,
            ),
          )
        },
        (result) => {
          Get.back(),
          Get.to(() => SandboxPayScreen(urlWebview: result)),
        },
      );
    } catch (e, s) {
      Get.back();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  /*
    nvtruong: Hàm kiểm tra thanh toán đơn hàng (hàm này sẽ connect api qua vnpt dưới dạng webview)
   */
  // ignore: long-method
  Future<void> checkOrderPaymentResult(String id, String responseCode, String secureCode) async {
    loading.value = true;
    try {
      var userName = await secureLocalDataSource.getLastData(USERNAME_KEY);
      var pass = await secureLocalDataSource.getLastData(PASSWORD_KEY);
      if (userName == null || pass == null) {
        loading.value = false;
        showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
      } else {
        TokenModel? token;
        final failureOrTokenModel = await _authenRepository.getAccessToken(LoginRequestModel(userName, pass));

        failureOrTokenModel.fold(
          (l) => throw l.error,
          (r) => {token = r},
        );

        if (token != null) {
          final failureOrServicePackItems =
              await _servicePackRepository.checkOrderPaymentResult(id, responseCode, secureCode);
          failureOrServicePackItems.fold(
            (l) => throw l.error,
            (r) => {
              showProgress(),
              Timer(const Duration(seconds: 10), () async {
                hideProgress();
                clearSuccessOrder();
                refreshController.refreshCompleted();
                final appController = Get.find<AppController>();
                appController.backToMainPage();
                
                Get.to(() => const VNPTPayNotifyScreen(), arguments: {"message": r});
              }),
            },
          );
        } else {
          loading.value = false;
          showErrorModal(AppLocalizations.current.serviceExpireToken);
        }
      }
    } catch (e, s) {
      loading.value = false;
      refreshController.refreshFailed();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  /*
    nvtruong: Lấy đối tượng gói lượt ký (object)
   */
  ServicePackModel getDetails(int index) {
    return servicePackItems[index];
  }

  /*
    nvtruong: Hàm tăng số lượng gói lượt ký (màn hình Danh sách gói lượt ký đã chọn ServicePackScreen())
   */
  // ignore: avoid-unused-parameters
  void addToCart(ServicePackModel item, int index) async {
    servicePackItems[index].quantity++;
    servicePackItems[index].isExits = true;
    onUpdatePackItems();
    caculateCartTotals();
    updateCartItemInfo();
    update();
  }

  /*
    nvtruong: Hàm giảm số lượng gói lượt ký (màn hình Danh sách gói lượt ký đã chọn ServicePackScreen())
   */
  void removeToCart(ServicePackModel item, int index) async {
    if (item.quantity <= 0) {
      servicePackItems[index].quantity = 0;
    } else {
      servicePackItems[index].quantity--;
    }
    onUpdatePackItems();
    caculateCartTotals();
    updateCartItemInfo();
    update();
  }

  /*
    nvtruong: Hàm tăng số lượng gói lượt ký đã chọn (màn hình Danh sách gói lượt ký đã chọn ServicePackOrderScreen())
   */
  // ignore: avoid-unused-parameters
  void increaseQuantity(ServicePackModel item, int index) async {
    final int indexAt = servicePackItems.indexWhere((x) => x.id == item.id);
    servicePackItems[indexAt].quantity++;
    final ServicePackModel objServicePackModel = getDetails(indexAt);
    if (cartItems.isEmpty) {
      cartItems.add(objServicePackModel);
    } else if (servicePackItems[indexAt].isExits == false) {
      cartItems.add(objServicePackModel);
    }
    servicePackItems[indexAt].isExits = true;

    // ignore: invalid_use_of_protected_member
    onUpdatePackItems();
    onUpdateCartItems();
    caculateCartTotals();
    update();
  }

  /*
    nvtruong: Hàm giảm số lượng gói lượt ký đã chọn (màn hình Danh sách gói lượt ký đã chọn ServicePackOrderScreen())
   */
  // ignore: avoid-unused-parameters
  void decreaseQuantity(ServicePackModel item, int index) async {
    final int indexAt = servicePackItems.indexWhere((x) => x.id == item.id);
    if (item.quantity != 0) {
      servicePackItems[indexAt].quantity--;
    } else {
      servicePackItems[indexAt].quantity = 0;
    }
    onUpdatePackItems();
    caculateCartTotals();
    updateCartItemInfo();
    update();
  }

  /*
    nvtruong: Hàm xóa gói cước đã chọn (màn hình Danh sách gói lượt ký đã chọn ServicePackOrderScreen())
   */
  // ignore: avoid-unused-parameters
  void deleteCartItem(ServicePackModel item, int index) async {
    final int indexAt = servicePackItems.indexWhere((x) => x.id == item.id);
    if (item.quantity != 0) {
      servicePackItems[indexAt].quantity = 0;
      cartItems.removeWhere((item) => item.id == item.id);
      onUpdatePackItems();
      caculateCartTotals();
      updateCartItemInfo();
      update();
    }
  }

  // tính tổng tiền đơn hàng
  void caculateCartTotals() async {
    resetTotalAmount();
    // ignore: avoid_function_literals_in_foreach_calls
    servicePackItems.forEach((element) {
      subtotalPrice(subtotalPrice.value + element.price * (element.quantity ?? 1));
      subtotalSignturn(subtotalSignturn.value + (element.signTurnNumber ?? 1) * (element.quantity ?? 1));
    });
  }

  // tính tổng tiền đơn hàng
  void caculateCartTotalsInfo() async {
    resetTotalAmount();
    // ignore: avoid_function_literals_in_foreach_calls
    cartItems.forEach((element) {
      subtotalPrice(subtotalPrice.value + element.price * element.quantity);
      subtotalSignturn(subtotalSignturn.value + (element.signTurnNumber ?? 1) * (element.quantity ?? 1));
    });
  }

  void updateCartItemInfo() async {
    cartItems.value = servicePackItems.where((item) => item.quantity > 0).toList();
    caculateCartTotalsInfo();
    update();
  }

  void resetTotalAmount() async {
    subtotalPrice.value = 0;
    subtotalSignturn.value = 0;
  }

  void clearSuccessOrder() async {
    resetTotalAmount();
    // ignore: avoid_function_literals_in_foreach_calls
    servicePackItems.forEach((element) => element.quantity = 0);
    // ignore: avoid_function_literals_in_foreach_calls
    cartItems.forEach((element) => element.quantity = 0);
    onUpdatePackItems();
    onUpdateCartItems();
    updateCartItemInfo();
    update();
  }

  void onRefresh() async {
    // getListPackageSignatures();
  }

  void onUpdatePackItems() {
    // ignore: invalid_use_of_protected_member
    servicePackItems.value = List<ServicePackModel>.from(servicePackItems.value);
  }

  void onUpdateCartItems() {
    // ignore: invalid_use_of_protected_member
    cartItems.value = List<ServicePackModel>.from(cartItems.value);
  }

  void onRedirectToServicePackPorder() async {
    if (cartItems.isNotEmpty) {
      Get.to(() => ServicePackOrderScreen(), arguments: null);
    } else {
      showErrorModal(AppLocalizations.current.create_order_no_data_selected);
    }
  }
}
