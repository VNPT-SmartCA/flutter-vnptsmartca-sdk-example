import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
import '../../core/models/request/account_active.dart';
import '../../core/models/request/change_password.dart';
import '../../core/models/request/check_reactice_code.dart';
import '../../core/models/request/ekyc_customer.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

import '../../configs/app_config.dart';
import '../../core/models/app/econtract_api_config.dart';
import '../../core/models/app/smartca_api_config.dart';
import '../../core/models/request/get_user_status.dart';
import '../../core/models/request/login.dart';
import '../../core/models/response/token_model.dart';

import '../../core/models/response/contract_check_exist.dart';
import '../../core/models/response/econtract_model.dart';

class AuthRemoteApi {
  final SmartCAApiConfig _apiConfig;
  final EContractApiGWConfig _eContractApiGWConfig;
  final SmartCAApiGateway httpClientService;

  AuthRemoteApi(
      this._apiConfig, this.httpClientService, this._eContractApiGWConfig);

  Future<TokenModel> getAppAccessToken() async {
    var model = {
      'client_id': _apiConfig.clientId,
      'client_secret': _apiConfig.clientSecret,
      'grant_type': 'client_credentials',
    };
    final url = '/auth/token';
    var result = await httpClientService.post(
      url,
      model,
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    return TokenModel.fromMap(result as Map<String, dynamic>);
  }

  Future<TokenModel> getAccessToken(LoginRequestModel userLogin) async {
    userLogin.clientId = _apiConfig.clientId;
    userLogin.clientSecret = _apiConfig.clientSecret;
    userLogin.culturename = AppConfig.language;
    //${_apiConfig.gatewayUrl}
    final result = await httpClientService.post(
      '/auth/token',
      userLogin.toMap(),
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );

    return TokenModel.fromMap(result);
  }

  Future<SmartCAApiResponse> getProfile() async {
    final req = {
      'requestId': const Uuid().v4(),
      'serviceId': 'Account.Profile',
      'functionName': 'GetProfile',
      'locale': 'vi_VN',
    };

    final result = await httpClientService.post(
      "/${AppConfig.language}/identityapi/userinfo/info",
      json.encoder.convert(req),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<TokenModel> refreshToken(String refreshToken) async {
    final request = {
      "refresh_token": refreshToken,
      "clientId": _apiConfig.clientId,
      "clientSecret": _apiConfig.clientSecret,
      "grant_type": "refresh_token",
    };

    final result = await httpClientService.post(
      '/auth/token',
      request,
      // options: Options(contentType: Headers.formUrlEncodedContentType),
    );

    return TokenModel.fromMap(result);
  }

  Future<SmartCAApiResponse> checkExistedPartner(String clientId) async {
    final reqParams = {'mobileCode': clientId};
    final result = await httpClientService.post(
      '/${AppConfig.language}/identityapi/client/info_by_mobile_code',
      reqParams,
    );

    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> checkActiveCode(
      AccountActiveRequestModel req) async {
    final result = await httpClientService.post(
      '/${AppConfig.language}/identityapi/user/checkcode',
      json.encoder.convert(req.toMap()),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> activeAccount(
      AccountActiveRequestModel req) async {
    final result = await httpClientService.post(
      '/${AppConfig.language}/identityapi/user/active',
      json.encoder.convert(req.toMap()),
    );

    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getUserStatus(UserStatusRequest req) async {
    final result = await httpClientService.post(
        '/${AppConfig.language}/identityapi/user/user_status_public',
        req.toMap());

    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> submitEKyc(EkycCustomerRequest param) async {
    String path =
        '${_apiConfig.gatewayUrl}/${AppConfig.language}/identityapi/ekyc/ekyc_customer';

    final result = await httpClientService.post(
      path,
      param.toMap(),
      options: Options(contentType: 'multipart/form-data'),
    );

    return SmartCAApiResponse.fromJson(result);
  }

  Future<SmartCAApiResponse> changePassword(
      String accessToken, ChangePasswordRequest param) async {
    final result = await httpClientService.post(
      '/${AppConfig.language}/identityapi/user/change_pass',
      param.toJson(),
      options: Options(headers: {
        "authorization": "Bearer $accessToken",
      }),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  // reactive
  Future<SmartCAApiResponse> checkReactiveCode(
      CheckReactiveCodeRequest param) async {
    final url =
        '/${AppConfig.language}/identityapi/reactivation/checkReactivationCode';
    var result = await httpClientService.post(url, param);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> requestReactiveByEmail(String uid) async {
    var req = {'uid': uid};
    final url =
        '/${AppConfig.language}/identityapi/reactivation/reactivateByEmailRequest';
    var result = await httpClientService.post(url, req);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> eContractStatus(String uid, String orderId) async {
    final url = "/${AppConfig.language}/identityapi/user/updateContractStatus";
    var data = {"uid": uid, "orderId": orderId, "error": ""};
    var result = await httpClientService.post(url, data);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<ContractCheckExistModel> isSignedContract(String orderId) async {
    String url =
        '${_eContractApiGWConfig.domain}/management-service/contracts/check-exist?orderId=$orderId';

    var response = await httpClientService.get(
      url,
      options: Options(headers: {
        "Token-Key": _eContractApiGWConfig.tokenKey,
        "Token-Id": _eContractApiGWConfig.tokenId
      }),
    );

    if (response != null) {
      return ContractCheckExistModel.fromJson(response);
    } else {
      return ContractCheckExistModel(code: 0, message: "", contractData: null);
    }
  }

  Future<ContractResponse> ssoContract(
      String accessToken, String phoneNumber) async {
    String url;
    Map<String, String> param;
    param = {
      'token': '$accessToken,$phoneNumber',
      'client_id': _eContractApiGWConfig.clientId,
      'client_secret': _eContractApiGWConfig.clientSecret,
    };
    url = '${_eContractApiGWConfig.domain}/sso/exchange-sso-token';

    var result = await httpClientService.post(url, param);
    if (result == null) {
      return ContractResponse.fromJsonError(
          {'code': 404, 'message': 'Not Found'});
    }
    return ContractResponse.fromJson(result);
  }

  Future<SmartCAApiResponse> sentOTP(String sub, String phoneNumber) async {
    String url = "/${AppConfig.language}/thirdpartyapi/preuser/sentotp";
    var param = {"uid": sub, "phone": phoneNumber};
    final result = await httpClientService.post(url, param);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> verifyOTP(
      String sub, String phoneNumber, String otp) async {
    String url = "/${AppConfig.language}/thirdpartyapi/preuser/verifyOTP";
    var param = {"uid": sub, "phone": phoneNumber, "otp": otp};
    final result = await httpClientService.post(url, param);
    return SmartCAApiResponse.fromMap(result);
  }
}
