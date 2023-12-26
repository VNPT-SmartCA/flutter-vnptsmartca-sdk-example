import 'dart:convert';

import '../../configs/injector/injector.dart';
import '../models/app/user_info_on_device.dart';
import '../utils/constants.dart';
import 'secure_local_storage.dart';

class UserInfoOnDeviceService {
  final secureLocalDataSource = getIt<SecureLocalStorageService>();

  Future<bool> addOrUpdate(UserInfoOnDeviceModel userInfoOnDevice) async {
    try {
      final userInfoListStr =
          await secureLocalDataSource.getLastData(USER_INFO_ON_DEVICE);
      List<UserInfoOnDeviceModel> userInfoList = [];

      if (userInfoListStr != null) {
        List accountsMap = json.decode(userInfoListStr);
        userInfoList = accountsMap.map((e) {
          return UserInfoOnDeviceModel.fromMap(json.decode(e));
        }).toList();

        userInfoList
            .removeWhere((element) => element.uid == userInfoOnDevice.uid);
      }

      userInfoList.insert(0, userInfoOnDevice);
      final str = json.encode(userInfoList);

      await secureLocalDataSource.saveData(USER_INFO_ON_DEVICE, str);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserInfoOnDeviceModel?> getUser(String uid) async {
    final userInfoListStr =
        await secureLocalDataSource.getLastData(USER_INFO_ON_DEVICE);
    List<UserInfoOnDeviceModel> userInfoList = [];

    if (userInfoListStr != null) {
      List accountsMap = json.decode(userInfoListStr);
      userInfoList = accountsMap.map((e) {
        return UserInfoOnDeviceModel.fromMap(json.decode(e));
      }).toList();

      try {
        final result = userInfoList.firstWhere((element) => element.uid == uid);
        return result;
      } catch (e) {
        return null;
      }
    }

    return null;
  }

  Future<List<UserInfoOnDeviceModel>> getAllUsers() async {
    final userInfoListStr =
        await secureLocalDataSource.getLastData(USER_INFO_ON_DEVICE);
    List<UserInfoOnDeviceModel> userInfoList = [];

    if (userInfoListStr != null) {
      List accountsMap = json.decode(userInfoListStr);
      userInfoList = accountsMap.map((e) {
        return UserInfoOnDeviceModel.fromMap(json.decode(e));
      }).toList();

      return userInfoList;
    }

    return [];
  }

  Future<UserInfoOnDeviceModel?> getCurrentUser() async {
    var uid = await secureLocalDataSource.getLastData(USERNAME_KEY) ?? "";
    return getUser(uid);
  }

  Future<CertModel?> getCerCurrentUserByIdCer(String? certId) async {
    UserInfoOnDeviceModel? currentUser = await getCurrentUser();
    CertModel? certModelLocal;
    // tìm idCer đã được gán cho cặp khoá
    currentUser?.certs?.forEach((element) {
      if (element.id == certId) {
        certModelLocal = element;
      }
    });
    return certModelLocal;
  }

  Future removerCertByIdCertificate({String? uid, String? certId}) async {
    try {
      var currentUserInfoOnDeviceModel = await getUser(uid ?? "");
      int indexCerRevokedInLocal = currentUserInfoOnDeviceModel?.certs
              ?.indexWhere((element) => certId == element.id) ??
          -1;
      if (indexCerRevokedInLocal > -1) {
        currentUserInfoOnDeviceModel?.certs?.removeAt(indexCerRevokedInLocal);
        await addOrUpdate(currentUserInfoOnDeviceModel!);
      }
    } catch (e) {}
  }

  Future<bool> addOrUpdateCert(String uidUser, CertModel certModel) async {
    try {
      UserInfoOnDeviceModel? userInfoOnDeviceModel = await getUser(uidUser);
      int indexCerRevokedInLocal = userInfoOnDeviceModel?.certs
              ?.indexWhere((element) => certModel.id == element.id) ??
          -1;
      if (indexCerRevokedInLocal > -1) {
        userInfoOnDeviceModel?.certs?[indexCerRevokedInLocal] = certModel;
      } else {
        if (userInfoOnDeviceModel?.certs == null) {
          userInfoOnDeviceModel?.certs = [];
        }
        userInfoOnDeviceModel?.certs?.add(certModel);
      }
      return await addOrUpdate(userInfoOnDeviceModel!);
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeUser(String uid) async {
    try {
      final userInfoListStr =
          await secureLocalDataSource.getLastData(USER_INFO_ON_DEVICE);
      List<UserInfoOnDeviceModel> userInfoList = [];

      if (userInfoListStr != null) {
        List accountsMap = json.decode(userInfoListStr);
        userInfoList = accountsMap.map((e) {
          return UserInfoOnDeviceModel.fromMap(json.decode(e));
        }).toList();

        userInfoList.removeWhere((element) => element.uid == uid);
      }

      final str = json.encode(userInfoList);

      await secureLocalDataSource.saveData(USER_INFO_ON_DEVICE, str);

      return true;
    } catch (e) {
      return false;
    }
  }
}
