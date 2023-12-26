import 'package:injectable/injectable.dart';

import '../../../configs/app_config.dart';
import '../../../core/models/app/eseal_api_config.dart';
import '../../../core/models/response/service_response.dart';
import 'api_gateway_eseal.dart';

@injectable
class TransactionEsealApi {
  final ApiGatewayEseal _httpClientService;
  final EsealApiConfig apiGWConfig;

  TransactionEsealApi(this._httpClientService, this.apiGWConfig);

  Future<SmartCAApiResponse> eSealGetCode(dynamic reqSign) async {
    final result = await _httpClientService.post(
      '/CustomerProfile/getCode?lang=${AppConfig.language}',
      reqSign,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> confirmAcceptance(dynamic reqSign) async {
    final result = await _httpClientService.post(
      '/v2/Customer/confirmAcceptance?lang=${AppConfig.language}',
      reqSign,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> signhashEseal(dynamic reqSign) async {
    final result = await _httpClientService.post(
      '${apiGWConfig.signhashEsealUrl}?lang=${AppConfig.language}',
      reqSign,
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
