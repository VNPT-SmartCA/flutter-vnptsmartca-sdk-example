import 'dart:convert';

import '../app/device_info.dart';


class AccountActiveRequestModel {
  String sub;
  String password;
  String rePassword;
  String activationCode;
  String? kakPub;
  DeviceInfoModel device;
  String signature;
  String? ekycCode;

  AccountActiveRequestModel(
      {required this.sub,
      required this.password,
      required this.rePassword,
      required this.activationCode,
      required this.device,
      this.kakPub,
      required this.signature,
      this.ekycCode});

  Map<String, dynamic> toMap() {
    return {
      'sub': sub,
      'password': password,
      'rePassword': rePassword,
      'activationCode': activationCode,
      'kakPub': kakPub,
      'device': device.toMap(),
      'signature': signature,
      'ekycCode': ekycCode,
    };
  }

  String toJson() => json.encode(toMap());
}
