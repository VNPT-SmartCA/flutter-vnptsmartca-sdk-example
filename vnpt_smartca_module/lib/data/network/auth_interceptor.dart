// ignore_for_file: unnecessary_overrides

import 'dart:io';

import 'package:dio/dio.dart';

import '../../configs/injector/injector.dart';
import '../../core/models/response/token_model.dart';
import '../../core/services/secure_local_storage.dart';
import '../../core/utils/constants.dart';
import '../repository/authen_repository.dart';

final ignoreList = [
  "/auth/token",
  "/auth/refresh_token",
  "https://econtract-api-demo.vnptit3.vn/sso/exchange-sso-token",
  "https://api-hopdong.vnpt.vn/sso/exchange-sso-token"
];

class AuthInterceptor extends Interceptor {
  late SecureLocalStorageService _secureLocalDataSource;
  late Dio _dio;

  AuthInterceptor(SecureLocalStorageService secureLocalDataSource, Dio dio) {
    _secureLocalDataSource = secureLocalDataSource;
    _dio = dio;
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!ignoreList.contains(options.path)) {
      final tokenString =
          await _secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);

      if (tokenString != null) {
        var token = TokenModel.fromJson(tokenString);

        options.headers["Authorization"] = "Bearer ${token.accessToken}";
      }
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // super.onError(err, handler);
    Future.delayed(
      const Duration(seconds: 1),
      () => refreshTokenHandler(err, handler),
    );
  }

  refreshTokenHandler(DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == HttpStatus.unauthorized ||
        error.response?.statusCode == HttpStatus.forbidden) {
      try {
        final authenRepository = getIt<AuthenRepository>();

        final tokenJson = await authenRepository.refreshToken();
        return tokenJson.fold((l) => handler.reject(error), (token) async {
          //set bearer
          error.requestOptions.headers["Authorization"] =
              "Bearer " + token.accessToken;
          //create request with new access token
          final opts = Options(
              method: error.requestOptions.method,
              headers: error.requestOptions.headers);
          final cloneReq = await _dio.request(error.requestOptions.path,
              options: opts,
              data: error.requestOptions.data,
              queryParameters: error.requestOptions.queryParameters);

          return handler.resolve(cloneReq);
        });
      } catch (e) {
        return handler.reject(error);
      }
    }

    return handler.reject(error);
  }
}
