import 'package:injectable/injectable.dart';

import '../../../configs/app_config.dart';
import '../../../core/models/response/service_response.dart';
import 'api_gateway_eseal.dart';

@injectable
class CertApiEseal {
  final ApiGatewayEseal _httpClientService;

  CertApiEseal(this._httpClientService);

  Future<SmartCAApiResponse> signData(dynamic reqSign) async {
    final result = await _httpClientService.post(
      '/v2/Customer/sign?lang=${AppConfig.language}',
      reqSign,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> assignKey(dynamic reqSign) async {
    final result = await _httpClientService.post(
      '/v2/Customer/assign?lang=${AppConfig.language}',
      reqSign,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> assignWithOtp(dynamic reqSign) async {
    final result = await _httpClientService.post(
      '/v2/Customer/assignWithOtp?lang=${AppConfig.language}',
      reqSign,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> csrConfirm(dynamic reqSign) async {
    final result = await _httpClientService.post(
      '/v2/Customer/confirmCsr?lang=${AppConfig.language}',
      reqSign,
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
