// ignore_for_file: unnecessary_new, prefer_const_constructors, depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info/device_info.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../configs/app_config.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/response/profile_model.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../core/utils/constants.dart';
import '../../../data/repository/authen_repository.dart';
import '../../../data/repository/user_repository.dart';
import '../../../views/i18n/generated_locales/l10n.dart';

import '../../core/models/app/user_info_on_device.dart';
import '../../core/models/request/login.dart';
import '../../core/models/response/certificate_model.dart';
import '../../core/services/device_info.dart';
import '../../core/services/user_info_on_device.dart';
import '../../data/repository/certificate_repository.dart';

class AppController extends GetxController {
  final internetConnection = getIt<InternetConnectionChecker>();
  final localStorage = getIt<SecureLocalStorageService>();
  final deviceInfo = getIt<DeviceInfoService>();
  final _userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();
  final currentHostAppMethod = Rx<String>('');
  final pageController = PageController();
  final selectedIndex = 0.obs;

  final isNetworkConnected = false.obs;
  final isJailbroken = false.obs;
  final isPhysicalDevice = true.obs;
  final isValidDateime = true.obs;
  final isValidPlatform = true.obs;

  final language = AppConfig.language.obs;
  final appVersion = "".obs;

  final refreshMainPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initLanguage();
    deviceChecker();
    transferOldData();
    internetChecker();
    permissionChecker();
    getAppVersion();
  }

  getAppVersion() async {
    appVersion.value = await deviceInfo.getAppversion() ?? "";
  }

  deviceChecker() async {
    isJailbroken.value = true;//await FlutterJailbreakDetection.jailbroken;
    isValidPlatform.value =
        GetPlatform.isAndroid || GetPlatform.isIOS || GetPlatform.isMobile;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      if (iosInfo.isPhysicalDevice) {
        isPhysicalDevice.value = true;
      }
    } else {
      var androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.isPhysicalDevice == true) {
        isPhysicalDevice.value = true;
      }
    }
  }

  internetChecker() async {
    isNetworkConnected.value = await internetConnection.hasConnection;

    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        isNetworkConnected.value =
            await InternetConnectionChecker().hasConnection;
      } else {
        isNetworkConnected.value = false;
      }
    });
  }

  permissionChecker() async {
    var cameraStatus = await Permission.camera.status;
    var notificationStatus = await Permission.notification.status;

    if (notificationStatus.isDenied) {
      await Permission.notification.request();
    }

    if (cameraStatus.isDenied) {
      await Permission.camera.request();
    }
  }

  initLanguage() {
    Future.delayed(Duration(milliseconds: 500), () async {
      final savedLanguage = await localStorage.getLastData(LANGUAGE);
      if (savedLanguage != null) {
        await updateLanguage(savedLanguage);
      }
    });
  }

  updateLanguage(String languageCode) async {
    AppConfig.language = languageCode;
    language.value = languageCode;
    await localStorage.saveData(LANGUAGE, languageCode);

    await AppLocalizations.load(Locale(languageCode));
    await Get.updateLocale(Locale(languageCode));
  }

  toggleLanguage() async {
    final language = await localStorage.getLastData(LANGUAGE);
    switch (language) {
      case "en":
        updateLanguage("vi");
        break;
      default:
        updateLanguage("en");
    }
  }

  transferOldData() async {
    try {
      final mergedData = await localStorage.getLastData("MERGED_DATA");
      if (mergedData != null && mergedData == "true") return;

      final useBiometric = await localStorage.getLastData("USE_BIOMETRIC");
      final userName = await localStorage.getLastData("USER_NAME");
      final password = await localStorage.getLastData("PASS_WORD");
      // final fullName = await localStorage.getLastData("USER_FULL_NAME");
      final pin = await localStorage.getLastData("userPIN");
      final otpSecret = await localStorage.getLastData("SECRET");
      final otpSecretAdvanced =
          await localStorage.getLastData("OTPSecretAdvanced");
      final privateKey = await localStorage.getLastData(KAK_PRIVATE);
      final publicKey = await localStorage.getLastData(KAK_PUBLIC);
      String? credentialId = await localStorage.getLastData("credentialId");

      CertificateModel? cert;
      bool getCertIdSuccess = false;

      if (userName != null && password != null) {
        if (credentialId == null || credentialId == "") {
          final certificateRepository = getIt<CertificateRepository>();
          final authenRepository = getIt<AuthenRepository>();

          final failureOrToken = await authenRepository
              .getAccessToken(LoginRequestModel(userName, password));
          String accessToken = "";

          failureOrToken.fold((failure) {
            getCertIdSuccess = false;
            // showErrorModal(exceptionHandler(failure));
          }, (token) {
            accessToken = token.accessToken;
          });
          final failureOrCertList =
              await certificateRepository.getCertificateList();
          failureOrCertList.fold(
            (failure) {
              getCertIdSuccess = false;
            },
            (res) {
              var list = CertificateListModel.fromMap(res.content);
              List<CertificateModel> listCer = list.items;
              if (listCer.length > 0) {
                cert = listCer.first;
                credentialId = cert?.id;
                getCertIdSuccess = true;
              }
            },
          );
        } else {
          getCertIdSuccess = true;
        }

        final userRepository = getIt<UserRepository>();
        ProfileModel? getProfile;
        final response = await userRepository.getProfile();
        response.fold(
          (l) {},
          (r) {
            getProfile = r;
          },
        );

        var user = UserInfoOnDeviceModel(
            uid: userName,
            password: password,
            displayName: cert?.subjectCN ?? getProfile?.fullName,
            useBiometric: useBiometric == "true",
            email: getProfile?.address,
            phone: getProfile?.phone,
            certs: [
              CertModel(
                pin: pin!,
                publicKey: publicKey!,
                privateKey: privateKey!,
                otpSecret: otpSecret,
                otpSecretAdvanced: otpSecretAdvanced,
                id: credentialId,
              )
            ]);

        // Lưu thông tin đăng nhập
        await _userInfoOnDeviceService.addOrUpdate(user);
        await localStorage.saveData("MERGED_DATA", getCertIdSuccess.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  backToMainPage() {
    Get.until((route) => Get.currentRoute == "/");
    refreshMainPage.value += 1;
  }

  selectTab(int index) {
    if (selectedIndex.value == index) return;

    pageController.jumpToPage(index);
    selectedIndex.value = index;
    if (index == 0) backToMainPage();
  }
}
