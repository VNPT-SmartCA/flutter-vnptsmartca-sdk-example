import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/request/login.dart';
import '../../../core/models/request/service_pack_his_request_model.dart';
import '../../../core/models/response/service_pack_order_history_item.dart';
import '../../../core/models/response/token_model.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../core/utils/constants.dart';
import '../../../data/repository/authen_repository.dart';
import '../../../data/repository/service_pack_history_respository.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

class ServicePackOrderHistoryController extends GetxController {
  final _servicePackHistoryRepository = getIt<ServicePackHistoryRepository>();
  final secureLocalDataSource = getIt<SecureLocalStorageService>();
  final _authenRepository = getIt<AuthenRepository>();
  final refreshController = RefreshController(initialRefresh: true);

  var servicePackHistoryItems = List<ServicePackOrderHistoryItem>.empty().obs;
  var loading = false.obs;
  int totalItemCount = 0;
  int currentPage = 1;
  int pageCount = 0;
  /*
    nvtruong: Lấy thông tin lịch sử mua gói lượt ký
   */
  // ignore: long-methods
  // ignore: long-method
  Future<void> getListServicePackOrderHistory({bool isLoadmore = false}) async {
    loading.value = true;
    try {
      var userName = await secureLocalDataSource.getLastData(USERNAME_KEY);
      var pass = await secureLocalDataSource.getLastData(PASSWORD_KEY);
      if (userName == null || pass == null) {
        loading.value = false;
        refreshController.refreshFailed();
        showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
      } else {
        TokenModel? token;
        final failureOrTokenModel = await _authenRepository
            .getAccessToken(LoginRequestModel(userName, pass));

        failureOrTokenModel.fold(
          (l) => throw l.error,
          (r) => {token = r},
        );

        if (token != null) {
          final failureOrServicePackHistoryItems =
              await _servicePackHistoryRepository
                  .getListServicePackOrderHistory(
                      ServicePackOrderHistoryRequest(
                          page: currentPage, pageSize: 10, isDesc: true));
          failureOrServicePackHistoryItems.fold(
            (l) => throw l.error,
            (r) {
              if (isLoadmore) {
                servicePackHistoryItems.value.addAll(r.items);
                servicePackHistoryItems.refresh();
              } else {
                servicePackHistoryItems.value = r.items;
              }
              totalItemCount = r.totalItemCount;
              pageCount = r.pageCount;

              refreshController.refreshCompleted();
            },
          );
        } else {
          loading.value = false;
          refreshController.refreshFailed();
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
    nvtruong: Hàm khởi tạo lại gói lượt ký KH mua nhưng chưa khởi tạo thành công dưới core & dhsxkd
   */
  Future<void> reReInitializeOrders(String id) async {
    loading.value = true;
    try {
      var userName = await secureLocalDataSource.getLastData(USERNAME_KEY);
      var pass = await secureLocalDataSource.getLastData(PASSWORD_KEY);
      if (userName == null || pass == null) {
        loading.value = false;
        showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
      } else {
        TokenModel? token;
        final failureOrTokenModel = await _authenRepository
            .getAccessToken(LoginRequestModel(userName, pass));

        failureOrTokenModel.fold(
          (l) => throw l.error,
          (r) => {token = r},
        );

        if (token != null) {
          final failureOrServicePackHistoryItems =
              await _servicePackHistoryRepository.reCreateServicePackOrder(id);
          failureOrServicePackHistoryItems.fold(
            (l) => throw l.error,
            (r) => {refreshController.refreshCompleted()},
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

  onRefresh() async {
    currentPage = 1;
    getListServicePackOrderHistory();
  }

  onLoadMore() async {
    if (currentPage < pageCount) {
      ++currentPage;
      await getListServicePackOrderHistory(isLoadmore: true);
      refreshController.loadComplete();
    } else {
      refreshController.loadComplete();
    }
  }
}
