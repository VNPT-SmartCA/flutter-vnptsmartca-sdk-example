import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../data/network/smartca_api_gateway.dart';

import '../../configs/injector/injector.dart';
import '../../core/models/response/check_uid_response.dart';
import '../../core/services/device_info.dart';

@injectable
class CheckUidApi {
  final SmartCAApiGateway _httpClientService;

  CheckUidApi(this._httpClientService);

  final _deviceInfoService = getIt<DeviceInfoService>();

  checkUid(String identifier, String phone, String typeDocument) async {
    var deviceInfo = await _deviceInfoService.getDeviceInfo();
    final result = await _httpClientService.post(
      '/${AppConfig.language}/thirdpartyapi/register/checkUid',
      {"uid": identifier, "phone": phone, "loaiGiayTo": typeDocument, "deviceid": deviceInfo.deviceId},
    );
    return CheckUidResponse.fromJson(result);
  }
}
