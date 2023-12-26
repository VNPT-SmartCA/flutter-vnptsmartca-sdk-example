import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../configs/app_config.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/response/service_response.dart';
import '../../../data/network/smartca_api_gateway.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

class AppListController<T> extends GetxController {
  RxBool isLoading = true.obs;
  final data = Rx<List<T>>([]);
  final totalItemCount = Rx<int?>(null);
  final SmartCAApiGateway _httpClientService = getIt<SmartCAApiGateway>();

  // current page
  int _currentPage = 1;
  int _totalPage = 0;
  final int pageSize = 10;

  final RefreshController refreshController = RefreshController();

  void getData(String path, final T Function(Map<String, dynamic>) fromMap,
      {RefreshController? refreshController, Map<String, dynamic>? bodyOrParam}) async {
    if (refreshController == null) {
      isLoading.value = true;
    } else {
      isLoading.value = false;
    }
    _currentPage = 1;

    Map<String, dynamic> body = <String, dynamic>{};
    if (bodyOrParam != null) {
      body.addAll(bodyOrParam);
    }
    body["page"] = _currentPage;
    body["pageSize"] = pageSize;
    // await Future.delayed(Duration(seconds: 3));
    try {
      final result = await _httpClientService.post(
        '/${AppConfig.language}$path',
        body,
      );
      SmartCAApiResponse smartCAApiResponse = SmartCAApiResponse.fromMap(result);

      if (smartCAApiResponse.code == 0) {
        _AppListResponse<T> appListResponse;
        if (smartCAApiResponse.content is List) {
          appListResponse = _AppListResponse.fromList(smartCAApiResponse.content, fromMap);
        } else {
          appListResponse = _AppListResponse.fromMap(smartCAApiResponse.content, fromMap);
        }
        data.value = appListResponse.items;
        _totalPage = appListResponse.pageCount ?? 0;
        totalItemCount.value = appListResponse.totalItemCount;
      } else {
        var failure = GenericException(
            error: ServerException(
          message: smartCAApiResponse.message,
          code: smartCAApiResponse.code,
          codeDesc: smartCAApiResponse.codeDesc,
        ));
        showErrorModal(exceptionHandler(failure));
      }
    } catch (e, s) {
      var failure = GenericException(error: e, stack: s);
      showErrorModal(exceptionHandler(failure));
    }
    if (refreshController == null) {
      isLoading.value = false;
    } else {
      refreshController.refreshCompleted();
    }
  }

  void getMore(String path, final T Function(Map<String, dynamic>) fromMap, RefreshController refreshController,
      {Map<String, dynamic>? bodyOrParam}) async {
    if ((_currentPage + 1) >= _totalPage) {
      refreshController.loadComplete();
    }
    Map<String, dynamic> body = <String, dynamic>{};
    if (bodyOrParam != null) {
      body.addAll(bodyOrParam);
    }
    body["page"] = _currentPage + 1;
    body["pageSize"] = pageSize;
    // await Future.delayed(Duration(seconds: 3));
    try {
      final result = await _httpClientService.post(
        '/${AppConfig.language}$path',
        body,
      );
      SmartCAApiResponse smartCAApiResponse = SmartCAApiResponse.fromMap(result);

      if (smartCAApiResponse.code == 0) {
        _AppListResponse<T> appListResponse = _AppListResponse.fromMap(smartCAApiResponse.content, fromMap);
        if (appListResponse.items.isNotEmpty) {
          List<T> newData = [];
          newData.addAll(data.value);
          newData.addAll(appListResponse.items);
          data.value = newData;
          _currentPage++;
        }
        // _totalPage = appListResponse.pageCount ?? 0;
      } else {
        var failure = GenericException(
            error: ServerException(
          message: smartCAApiResponse.message,
          code: smartCAApiResponse.code,
          codeDesc: smartCAApiResponse.codeDesc,
        ));
        showErrorModal(exceptionHandler(failure));
      }
    } catch (e, s) {
      var failure = GenericException(error: e, stack: s);
      showErrorModal(exceptionHandler(failure));
    }
    refreshController.loadComplete();
  }
// Future<List<T>> getList({Map? bodyOrParam});
}

class _AppListResponse<T> {
  int? count;
  int? pageNumber;
  int? pageCount;
  int? totalItemCount;
  List<T> items;

  _AppListResponse.fromMap(Map<String, dynamic> map, T Function(Map<String, dynamic>) fromMap)
      : count = map['count'],
        pageNumber = map['pageNumber'],
        pageCount = map['pageCount'],
        totalItemCount = map['totalItemCount'],
        items = map['items'] != null ? List<T>.from(map['items'].map((x) {
          return fromMap(x);
        })) : [];

  _AppListResponse.fromList(List? list, T Function(Map<String, dynamic>) fromMap)
      : totalItemCount = list?.length ?? 0,
        items = list != null ? List<T>.from(list.map((x) {
          return fromMap(x);
        })) : [];
}
