import 'dart:convert';

import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

@injectable
class ServicePackApi {
  final SmartCAApiGateway _httpClientService;

  ServicePackApi(this._httpClientService);

  getServicePacks(String accessToken) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/identityapi/pricing/list_personal_sign_pricing_for_purchase',
      {'accessToken': accessToken},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  createServicePackOrder(dynamic cartItems) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/order/PersonalSignturnOrder/createPersonalSignTurnOrder',
      json.encoder.convert(cartItems),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  initSignOrderTransaction(String refId) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/order/PersonalSignturnOrder/initPersonalSignOrderTransaction',
      {'id': refId},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  checkOrderPaymentResult(
      String id, String responseCode, String secureCode) async {
    final result = await _httpClientService.post(
        '/${AppConfig.language}/order/payment/checkOrderPaymentResult',
        {"id": id, "ResponseCode": responseCode, "SecureCode": secureCode});
    return SmartCAApiResponse.fromMap(result);
  }
}
