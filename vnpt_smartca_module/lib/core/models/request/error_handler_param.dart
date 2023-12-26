import '../app/device_info.dart';

class SendLogRequest {
  UserLog user;
  DeviceInfoModel deviceInfo;
  String description;
  String title;
  // String stackTrace;
  int type;
  SendLogRequest({
    required this.user,
    required this.deviceInfo,
    required this.description,
    required this.title,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'title': title,
      'device': deviceInfo.toMap(),
      'description': description,
      'type': type,
    };
  }
}

class UserLog {
  String uid;
  UserLog({
    required this.uid,
  });
  Map<String, dynamic> toJson() {
    return {'uid': uid};
  }
}
