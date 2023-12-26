import 'package:package_info_plus/package_info_plus.dart';
import '../../../core/services/device_info.dart';
import '../../../data/network/send_log_api.dart';

import '../../core/models/request/error_handler_param.dart';
import '../../core/services/secure_local_storage.dart';
import '../../core/utils/constants.dart';

enum LogType { INFOR, ERROR, EXCEPTION, CUSTOM }

class SendLogRepository {
  final SendLogAPI remoteData;
  final SecureLocalStorageService secureLocalDataSource;
  final DeviceInfoService deviceInfoService;

  SendLogRepository(
      this.remoteData, this.secureLocalDataSource, this.deviceInfoService);

  Future sendLog(String error) async {
    final packageInfo = await PackageInfo.fromPlatform();

    try {
      var deviceInfo = await deviceInfoService.getDeviceInfo();

      String? uid;
      uid = await secureLocalDataSource.getLastData(USERNAME_KEY);
      if (uid == null || uid.isEmpty) {
        uid = '';
      }

      var user = UserLog(uid: uid);
      var param = SendLogRequest(
          user: user,
          type: LogType.EXCEPTION.index,
          title:
              '${packageInfo.version != null ? 'v${packageInfo.version} - ' : ''}$error',
          description: error,
          deviceInfo: deviceInfo!);

      var res = await remoteData.sendErrorLog(param);
      return res;
    } catch (e) {
      print(e);
    }
  }
}
