import 'dart:convert';

import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/request/service_pack_his_request_model.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

@injectable
class ServicePackHistoryApi {
  final SmartCAApiGateway _httpClientService;

  ServicePackHistoryApi(this._httpClientService);

  getListServicePackOrderHistory(ServicePackOrderHistoryRequest params) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/order/PersonalSignturnOrder/listPersonalSignOrder',
      json.encoder.convert(params),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  requestInitPersonalSignOrderFromCustomer(String id) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/order/PersonalSignturnOrder/requestInitPersonalSignOrderFromCustomer',
      {'id': id},
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
