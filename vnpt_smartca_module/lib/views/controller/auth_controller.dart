import 'package:get/get.dart';
import '../../../core/models/request/login.dart';
import '../../../core/models/response/token_model.dart';
import '../../../core/services/user_info_on_device.dart';
import '../../../data/repository/authen_repository.dart';
import '../../../views/controller/app_controller.dart';
import '../../../views/pages/register_account/register_account/index.dart';
import '../../../views/utils/enums.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

import '../../configs/injector/injector.dart';
import '../../core/models/app/exceptions.dart';
import '../../core/models/app/user_info_on_device.dart';
import '../../core/services/biometrics.dart';
import '../../core/services/secure_local_storage.dart';
import '../../core/utils/constants.dart';
import '../../data/repository/user_repository.dart';
import '../i18n/generated_locales/l10n.dart';
import '../utils/exception_handler.dart';
import '../widgets/dialog/common_dialog.dart';

class AuthController extends GetxController {
  final authStatus = AuthenticationStatus.unauthenticated.obs;
  final _secureLocalDataSource = getIt<SecureLocalStorageService>();
  // final tokenModel = Rx<TokenModel?>(null);
  final currentUser = Rx<UserInfoOnDeviceModel?>(null);
  final _authenRepository = getIt<AuthenRepository>();
  final _userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();
  final _biometricsService = getIt<BiometricsService>();
  final _userRepository = getIt<UserRepository>();
  bool isRegisterAccount = true;
  final canCheckBiometrics = false.obs;

  @override
  void onInit() {
    super.onInit();

    checkAuth();
  }

  @override
  onReady() async {
    super.onReady();

    _biometricsService.init(
        AppLocalizations.current
            .requestBiometricDesc(AppLocalizations.current.Continue),
        [
          AndroidAuthMessages(
            signInTitle: AppLocalizations.current.Notice,
            biometricHint: AppLocalizations.current.biometricDialogTitle,
            cancelButton: AppLocalizations.current.close,
            goToSettingsButton: AppLocalizations.current.goToSettingsButton,
            goToSettingsDescription:
                AppLocalizations.current.biometricsGoToSettingsDesc,
            biometricNotRecognized: AppLocalizations.current.bioNotRecognized,
            biometricRequiredTitle: AppLocalizations.current.bioRequiredTitle,
            biometricSuccess: AppLocalizations.current.biometricSuccess,
          ),
          IOSAuthMessages(
              cancelButton: AppLocalizations.current.close,
              goToSettingsButton: AppLocalizations.current.goToSettingsButton,
              goToSettingsDescription:
                  AppLocalizations.current.biometricsGoToSettingsDesc,
              lockOut: AppLocalizations.current.iOSLockOut),
        ]);

    canCheckBiometrics.value = await _biometricsService.isDeviceSupported();
  }

  toggleAuthBiometrics({bool? value, bool? authRequired = true}) async {
    if (!await _biometricsService.isDeviceSupported()) {
      showErrorModal(AppLocalizations.current.notSupportBiometrics);
      return false;
    }

    if (authRequired == true) {
      final authenticated =
          await _biometricsService.authenticateWithBiometrics();
      if (!authenticated) {
        return false;
      }
    }

    final newUser = currentUser.value;
    newUser?.useBiometric =
        value ?? !(currentUser.value?.useBiometric ?? false);
    currentUser.value = newUser;

    await _userInfoOnDeviceService.addOrUpdate(newUser!);
    currentUser.refresh();
    return true;
  }

  checkAuth() async {
    try {
      var uid = await _secureLocalDataSource.getLastData(USERNAME_KEY);

      final tokenString =
          await _secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);
      if (tokenString != null) {
        var token = TokenModel.fromJson(tokenString);
        if (token.expireTime!.millisecondsSinceEpoch >
            DateTime.now().millisecondsSinceEpoch + 3 * 60 * 1000) {
          authStatus.value = AuthenticationStatus.authenticated;
          final allUsers = await _userInfoOnDeviceService.getAllUsers();
          if (allUsers.isNotEmpty) {
            currentUser.value = allUsers.first;
          }
          //TODO: Kiểm tra trạng thái User
        } else {
          final appController = Get.find<AppController>();
          final password =
              await _secureLocalDataSource.getLastData(PASSWORD_KEY);
          if (password != null && uid != null) onLogin(uid, password);
        }
      }
      if (uid == null) {
        return;
      }
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  void signOut() async {
    try {
      await _secureLocalDataSource.removeData(LOCAL_ACCESS_TOKEN_AUTH);
      await _secureLocalDataSource.removeData(FULLNAME_KEY);
      authStatus.value = AuthenticationStatus.unauthenticated;

      final appController = Get.find<AppController>();
      appController.selectedIndex.value = 0;
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  loginWithBiometric() async {
    try {
      var authenticated = await _biometricsService.authenticateWithBiometrics();

      if (authenticated == true && currentUser.value != null) {
        onLogin(currentUser.value!.uid, currentUser.value!.password);
      }
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  onLogin(String uid, String password) async {
    try {
      showProgress();
      authStatus.value = AuthenticationStatus.unauthenticated;

      final failureOrTokenModel = await _authenRepository
          .getAccessToken(LoginRequestModel(uid, password));
      TokenModel? token;
      hideProgress(closeOverlays: true);

      failureOrTokenModel.fold(
        (failure) {
          try {
            String error =
                (failure.error as dynamic).response!.data['error_description'];
            if (error.toLowerCase().contains("no account") ||
                error.contains("Không tìm thấy thông tin tài khoản")) {
              showNotifyModal(exceptionHandler(failure),
                  titleBtnAccept: AppLocalizations.current.createAccount,
                  actionAccept: () {
                Get.to(() => RegisterAccountPage());
              }, onlyActionCancel: false);
              return;
            }
          } catch (e) {
            print(e);
          }

          showErrorModal(exceptionHandler(failure));
        },
        (_token) {
          token = _token;
          // Cache Token, Username, Password
        },
      );

      if (token == null) {
        return false;
      }

      authStatus.value = AuthenticationStatus.authenticated;

      await _secureLocalDataSource.saveData(
          LOCAL_ACCESS_TOKEN_AUTH, token!.toJson());

      _secureLocalDataSource.saveData(USERNAME_KEY, uid);
      _secureLocalDataSource.saveData(PASSWORD_KEY, password);
      // tokenModel.value = token;

      await getProfile(uid, password);

      return true;
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  getProfile(String uid, String password) async {
    var user = await _userInfoOnDeviceService.getUser(uid);
    if (user != null) {
      user.password = password;
      user.uid = uid;
    } else {
      user = UserInfoOnDeviceModel(uid: uid, password: password);
    }

    // if (user.displayName.isNullOrEmpty ||
    //     user.phone.isNullOrEmpty ||
    //     user.email.isNullOrEmpty) {
    bool finished = false;
    int count = 0;

    while (finished == false && count < 3) {
      final response = await _userRepository.getProfile();
      count++;
      response.fold(
        (l) {
          user?.displayName = "";
          user?.phone = "";
          user?.email = "";
          finished = false;
        },
        (r) {
          user?.displayName = r.fullName;
          user?.phone = r.phone;
          user?.email = r.email;
          user?.accType = r.accType;
          finished = true;
        },
      );

      if (finished == false) {
        await Future.delayed(Duration(seconds: count + 3), () {});
      }
    }

    currentUser.value = user;
    // Lưu thông tin đăng nhập
    await _userInfoOnDeviceService.addOrUpdate(user);
  }
}
