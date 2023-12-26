// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../configs/injector/injector.dart';
import '../models/app/device_info.dart';
import 'secure_local_storage.dart';

class DeviceInfoService {
  Future<DeviceInfoModel> getDeviceInfo() async {
    var devInfo = DeviceInfoPlugin();
    late DeviceInfoModel deviceInfoModel;

    if (Platform.isIOS) {
      final secureLocalDataSource = getIt<SecureLocalStorageService>();
      DeviceInfoModel? deviceInfo;
      final deviceInfoStr =
          await secureLocalDataSource.getLastData("DEVICE_INFO_KEY");
      if (deviceInfoStr != null) {
        deviceInfo = DeviceInfoModel.fromJson(deviceInfoStr);
      }

      var ios = await devInfo.iosInfo;
      deviceInfoModel = DeviceInfoModel(
        deviceId:
            deviceInfo != null ? deviceInfo.deviceId : ios.identifierForVendor,
        deviceName: ios.name,
        osName: ios.systemName,
        osVersion: ios.systemVersion,
        branch: 'Apple',
        deviceModel: ios.model,
      );

      await secureLocalDataSource.saveData(
          "DEVICE_INFO_KEY", deviceInfoModel.toJson());
    } else if (Platform.isAndroid) {
      var android = await devInfo.androidInfo;
      deviceInfoModel = DeviceInfoModel(
        deviceId: android.androidId,
        deviceName: android.model,
        branch: android.brand,
        osVersion: android.version.release,
        osName: 'Android',
        deviceModel: android.model,
      );
    }

    return deviceInfoModel;
  }

  Future<bool> isPhysicalDevice() async {
    var devInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      final ios = await devInfo.iosInfo;
      return ios.isPhysicalDevice;
    } else {
      final android = await devInfo.androidInfo;
      return android.isPhysicalDevice;
    }
  }

  Future<bool> trustDevice() async {
    // bool jailbroken;
    // try {
    //   jailbroken = await FlutterJailbreakDetection.jailbroken;
    // } on PlatformException {
    //   jailbroken = true;
    // }
    //
    // return !jailbroken;
    return true;
  }

  Future<String?> getBundleIndentifier() async {
    String? projectAppID;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      projectAppID = packageInfo.packageName;
    } on PlatformException {
      projectAppID = null;
    }

    return projectAppID;
  }

  Future<String?> getAppversion() async {
    String? version;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      version = packageInfo.version;
    } on PlatformException {
      version = null;
    }

    return version;
  }

  // Future<DeviceInfoModel?> getLocalDeviceInfo() async {
  //   try {
  //     String? deviceInfo =
  //         await _secureLocalDataSource.getLastData(DEVICE_INFO_KEY);

  //     if (deviceInfo != null) {
  //       return DeviceInfoModel.fromJson(deviceInfo);
  //     } else {
  //       final deviceInfo = await getDeviceInfo();
  //       await _secureLocalDataSource.saveData(
  //         DEVICE_INFO_KEY,
  //         deviceInfo.toJson(),
  //       );
  //       return deviceInfo;
  //     }
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
