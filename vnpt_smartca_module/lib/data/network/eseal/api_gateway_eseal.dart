// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';

import '../../../core/models/app/eseal_api_config.dart';
import '../../../core/services/network_info_service.dart';
import '../../../core/services/secure_local_storage.dart';
import '../auth_interceptor.dart';

String sha =
    "[85, 157, 12, 4, 249, 229, 81, 82, 144, 144, 121, 75, 147, 151, 160, 66, 174, 246, 135, 143]";
String certSubject = '/CN=*.vnptit.vn';
String certSubject1 = '/CN=*.vnpt.vn';

const CONNECT_TIMEOUT = 3 * 60;
const RECEIVE_TIMEOUT = 4 * 60;

class ApiGatewayEseal<TData> {
  final EsealApiConfig apiGWConfig;
  final SecureLocalStorageService _secureLocalDataSource;
  final NetworkInfoService _networkInfo;

  late Dio _dio;

  // ignore: long-method
  ApiGatewayEseal(
      this.apiGWConfig, this._secureLocalDataSource, this._networkInfo) {
    var options = BaseOptions(
      baseUrl: apiGWConfig.gatewayUrl,
      connectTimeout: Duration(seconds: CONNECT_TIMEOUT),
      receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT),
      maxRedirects: 5,

      /// will automatically encode the request body
      // contentType: Headers.formUrlEncodedContentType,
      // responseType: ResponseType.json,
    );

    _dio = Dio(options);
    _dio
      ..interceptors.clear()
      ..interceptors.add(AuthInterceptor(_secureLocalDataSource, _dio))
      ..interceptors.add(LogInterceptor(
          requestBody: kDebugMode,
          requestHeader: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode))
      ..interceptors.add(
        // [408,429,500,502,503,504,440,460,499,520,521,522,523,524,525,527,598,599]
        RetryInterceptor(
          dio: _dio,
          // logPrint: print, // specify log function (optional)
          retries: 1, // retry count (optional)
          retryDelays: const [
            Duration(seconds: 2),
            // Duration(seconds: 4),
          ],
        ),
      );

    // Add CertificatePinningInterceptor in dio Client
    // Dio getClient(String baseUrl, List<String> allowedSHAFingerprints) {
    //   var dio = Dio(BaseOptions(baseUrl: baseUrl))
    //     ..interceptors
    //         .add(CertificatePinningInterceptor(allowedSHAFingerprints));
    //   return dio;
    // }

    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: true));
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) {
          if (cert.subject != certSubject || cert.subject != certSubject1) {
            return true;
          }
          if (cert.sha1.toString() == sha) {
            return true;
          }
          return true;
        });
        return client;
      },
    );
  }

  Future _processRequest(String path, {dynamic data, options}) async {
    try {
      // return await _networkInfo.isConnected
      //     ? await _dio.request(path, data: data, options: options)
      //     : throw NoInternetException();
      return await _dio.request(path, data: data, options: options);
    } catch (e) {
      rethrow;
    }
  }

  Future<T> get<T>(String path, {options}) async {
    options ??= Options();
    (options as Options).method = "GET";

    Response? resp = await _processRequest(path, options: options);
    return resp!.data as T;
  }

  Future<T> post<T>(String path, dynamic data, {options}) async {
    options ??= Options();
    (options as Options).method = "POST";

    Response? resp = await _processRequest(path, data: data, options: options);
    return resp!.data;
  }

  Future<T> postFormData<T>(String path, dynamic body) async {
    var formData = FormData.fromMap(body);
    Response? resp = await _processRequest(
      path,
      data: formData,
      options: Options(method: "POST"),
    );
    return resp!.data;
  }

  // ignore: avoid-unused-parameters
  Future<Stream<Uint8List>> getStream(String path) {
    throw UnimplementedError();
  }

  // ignore: avoid-unused-parameters
  Future<T> postStream<T>(String path, List<int> postData) {
    throw UnimplementedError();
  }
}
