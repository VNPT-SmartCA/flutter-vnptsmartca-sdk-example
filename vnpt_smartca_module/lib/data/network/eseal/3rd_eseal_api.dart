import 'package:injectable/injectable.dart';

import '../../../configs/app_config.dart';
import '../../../core/models/response/service_response.dart';
import 'api_gateway_eseal.dart';

@injectable
class ThirdPartyApiEseal {
  final ApiGatewayEseal _httpClientService;

  ThirdPartyApiEseal(this._httpClientService);

  Future<SmartCAApiResponse> get3rdLinks(String idCert) async {
    final result = await _httpClientService.post(
      '/v2/Customer/get3rdLinks?lang=${AppConfig.language}',
      {"pageIndex": 1, "pageSize": 50, "credentialId": idCert},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> requestDelete3rdLink(String idLink) async {
    final result = await _httpClientService.post(
      '/v2/Customer/requestDelete3rdLink?lang=${AppConfig.language}',
      {"id": idLink},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> reLink3rd(String idLink, String totp) async {
    final result = await _httpClientService.post(
      '/v2/Customer/reLink3rd?lang=${AppConfig.language}',
      {"linkId": idLink, "otp": totp},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> set3rdLinkMode(String idLink, bool permanent, String totp) async {
    final result = await _httpClientService.post(
      '/v2/Customer/set3rdLinkMode?lang=${AppConfig.language}',
      {"linkId": idLink, "permanent": permanent, "otp": totp},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> configLifeTime3rdLink(String idLink, int time, String totp) async {
    final result = await _httpClientService.post(
      '/v2/Customer/configLifeTime3rdLink?lang=${AppConfig.language}',
      {"linkId": idLink, "validToTimestamp": time, "otp": totp},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> pauseLifeTime3rdLink(String idLink, bool isPause, String totp) async {
    final result = await _httpClientService.post(
      '/v2/Customer/pauseLifeTime3rdLink?lang=${AppConfig.language}',
      {"linkId": idLink, "isPause": isPause, "otp": totp},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> confirmLink3rd(dynamic reqSign) async {
    final result = await _httpClientService.post(
      '/v2/Customer/confirmLink3rd?lang=${AppConfig.language}',
      reqSign,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> confirmDelete3rdLink(dynamic reqSign) async {
    final result = await _httpClientService.post(
      '/v2/Customer/confirmDelete3rdLink?lang=${AppConfig.language}',
      reqSign,
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
