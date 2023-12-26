import 'dart:convert';

class DeviceInfoModel {
  String deviceId;
  String deviceName;
  String osName;
  String osVersion;
  String branch;
  String? fcmDeviceToken;
  String? deviceModel;

  DeviceInfoModel({
    required this.deviceId,
    required this.deviceName,
    required this.osName,
    required this.osVersion,
    required this.branch,
    this.deviceModel,
    this.fcmDeviceToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'deviceName': deviceName,
      'osName': osName,
      'osVersion': osVersion,
      'branch': branch,
      'fcmDeviceToken': fcmDeviceToken,
    };
  }

  factory DeviceInfoModel.fromMap(Map<String, dynamic> map) {
    return DeviceInfoModel(
      deviceId: map['deviceId'] ?? '',
      deviceName: map['deviceName'] ?? '',
      osName: map['osName'] ?? '',
      osVersion: map['osVersion'] ?? '',
      branch: map['branch'] ?? '',
      fcmDeviceToken: map['fcmDeviceToken'],
      deviceModel: map['deviceModel'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceInfoModel.fromJson(String source) =>
      DeviceInfoModel.fromMap(json.decode(source));
}
