import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

import '../../configs/injector/injector.dart';
import '../../core/services/device_info.dart';

@injectable
class VerifyIdentifierApi {
  final SmartCAApiGateway _httpClientService;

  VerifyIdentifierApi(this._httpClientService);

  final _deviceInfoService = getIt<DeviceInfoService>();

  checkUserStatus(String identifier) async {
    var deviceInfo = await _deviceInfoService.getDeviceInfo();
    final result = await _httpClientService.post(
      '/${AppConfig.language}/identityapi/user/check_user_status',
      {"uid": identifier, "deviceId": deviceInfo.deviceId},
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
