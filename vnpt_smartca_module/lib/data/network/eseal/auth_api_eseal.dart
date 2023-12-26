import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../configs/app_config.dart';
import '../../../core/models/request/account_active.dart';
import '../../../core/models/response/service_response.dart';
import 'api_gateway_eseal.dart';

@injectable
class AuthApiEseal {
  final ApiGatewayEseal _httpClientService;

  AuthApiEseal(this._httpClientService);

  Future<SmartCAApiResponse> activeAccount(
      AccountActiveRequestModel req) async {
    final result = await _httpClientService.post(
      '/v2/Account/activeAccount?lang=${AppConfig.language}',
      json.encoder.convert(req.toMap()),
    );

    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> changePin(AccountActiveRequestModel req) async {
    final result = await _httpClientService.post(
      '/v2/CustomerProfile/changePin?lang=${AppConfig.language}',
      json.encoder.convert(req.toMap()),
    );

    return SmartCAApiResponse.fromMap(result);
  }
}
