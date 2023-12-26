// ignore_for_file: unnecessary_null_comparison, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:convert';

import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/extensions/either_data.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/app/user_info_on_device.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../core/models/response/service_response.dart';
import '../../../core/models/response/token_model.dart';
import '../../../core/services/crypto/aes_encryption_util.dart';
import '../../../core/services/crypto/gen_key_util.dart';
import '../../../core/services/crypto/jwt_util.dart';
import '../../../core/services/crypto/kak_utils.dart';
import '../../../core/services/device_info.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../core/services/user_info_on_device.dart';
import '../../../core/utils/constants.dart';
import '../../../data/repository/authen_repository.dart';
import '../../../data/repository/certificate_repository.dart';
import '../../../data/repository/eseal/certificate_repository.dart';
import '../../../views/controller/app_controller.dart';
import '../../../views/controller/auth_controller.dart';
import '../../../views/controller/base_controler.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/active_account/sign_bbnt/index.dart';
import '../../../views/utils/enums.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';
import 'package:base32/base32.dart';

import '../../core/services/dart_otp/src/totp.dart';

class ProcessDescModel {
  final String? title;
  final String content;
  final bool isSuccess;

  ProcessDescModel({this.title, required this.content, this.isSuccess = false});
}

class GenerateCerKeyController extends BaseController {
  final CertificateModel certificateModel;
  final String? pin;
  final String? otp;

  final _secureLocalDataSource = getIt<SecureLocalStorageService>();
  final _aesEncryptionService = getIt<AESEncryptionService>();
  final _sJWTService = getIt<JWTService>();
  final _rsaKeyService = getIt<RsaKeyService>();
  final _deviceInfoService = getIt<DeviceInfoService>();
  final _certificateRepository = getIt<CertificateRepository>();
  final _authenRepository = getIt<AuthenRepository>();
  final _certificateEsealRep = getIt<CertificateRepositoryEseal>();

  final isApproved = false.obs;
  RxString loadingTitle = "".obs;
  final processDesc = Rx<ProcessDescModel?>(null);
  final userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();
  UserInfoOnDeviceModel? currentUserInfoOnDeviceModel;
  final authController = Get.find<AuthController>();

  bool canLoop = true;

  GenerateCerKeyController(
      {required this.certificateModel, this.pin, this.otp});

  @override
  showLoading({String loadingTitle = ""}) {
    super.showLoading();
    this.loadingTitle.value = loadingTitle;
  }

  exitLoop() {
    canLoop = false;
  }

  Future<void> checkCertIsWaitAcceptance() async {
    try {
      //initPercentage.value = 95;
      // loadingTitle.value = AppLocalizations.current.activingKey;
      showLoading(loadingTitle: AppLocalizations.current.activingKey);
      bool isReady = false;
      bool hasError = false;
      //Gọi kiểm tra trạng thái thái chứng thư
      //Thoát vòng lặp nếu cert.status == 7 hoặc có lỗi
      do {
        // thoat khoi vong lap khi an back
        if (canLoop == false) {
          isReady = true;
          hasError = true;
          break;
        }
        TokenModel? token;
        final failureOrTokenModel =
            await _authenRepository.getLocalAccessToken();

        if (failureOrTokenModel.isLeft()) {
          hasError = true;
          _showError(AppLocalizations.current.calAuthDataFail);
          return;
        } else {
          token = failureOrTokenModel.asRight();
          if (token != null) {
            // showLoading();
            final failureOrCertList =
                await _certificateRepository.getCertificateList();
            // hideLoading();
            if (failureOrCertList.isLeft()) {
              hasError = true;
              _showError(exceptionHandler(failureOrCertList.asLeft()));
            } else {
              var cert = CertificateListModel.fromMap(
                  failureOrCertList.asRight().content);
              CertificateModel? certificateInfo = cert.items
                  .firstWhere((element) => element.id == certificateModel.id);

              if (certificateInfo.typeStatus ==
                  StatusCertEnum.WAITING_GENERATE_CERTIFICATE) {
                isReady = false;
                // hideLoading();
                // processDesc.value = ProcessDescModel(
                //   content: AppLocalizations.current.waitingForApproval,
                //   isSuccess: true,
                //   title: AppLocalizations.current.waitingForApprovalTitle,
                // );
              }
              if (certificateInfo.typeStatus ==
                  StatusCertEnum.WAITING_SIGN_ACCEPTANCE) {
                isReady = true;
                // var credentialId = item.id;
                // _secureLocalDataSource.saveData(CREDENTIAL_ID_KEY, credentialId);
                Timer(const Duration(milliseconds: 1500), () {
                  gotoSignBBNT(credentialId: certificateInfo.id);
                });
              }
              if (certificateInfo.typeStatus == StatusCertEnum.VALID) {
                isReady = true;
                showDialogCertValid();
              }
            }
          } else {
            hideLoading();
            hasError = true;
            _showError(AppLocalizations.current.serviceExpireToken);
          }
        }
        await Future.delayed(const Duration(seconds: 3));
      } while (!isReady && !hasError);
    } catch (e) {
      _showError(AppLocalizations.current.serviceSomethingWentWrong);
    }
  }

  checkCertStatus() {
    switch (certificateModel.typeStatus) {
      case StatusCertEnum.WAITING_GENERATE_KEYPAIR:
      case StatusCertEnum.WAITING_ASSIGNED_TO_SIGNER:

        // if (iseSeal) {
        //   _activeSigningKeyEseal();
        // } else {
        _assignKey();
        // }
        break;
      case StatusCertEnum.WAITING_GENERATE_CERTIFICATE:
        processDesc.value = ProcessDescModel(
          content: AppLocalizations.current.waitingForApproval,
          isSuccess: true,
          title: AppLocalizations.current.waitingForApprovalTitle,
        );
        break;
      case StatusCertEnum.WAITING_SIGN_ACCEPTANCE:
        gotoSignBBNT(credentialId: certificateModel.id);
        break;
      case StatusCertEnum.EXPIRED:
        processDesc.value =
            ProcessDescModel(content: AppLocalizations.current.keyCerExpired);
        break;
      case StatusCertEnum.REVOKED:
        processDesc.value =
            ProcessDescModel(content: AppLocalizations.current.keyCerRevoked);
        break;
      case StatusCertEnum.SUSPENDED:
        processDesc.value =
            ProcessDescModel(content: AppLocalizations.current.keyCerSuspended);
        break;
      case StatusCertEnum.VALID:
        // TODO: Handle this case.
        break;
      default:
        break;
    }
  }

  saveUserInfo({
    String? identityID,
    bool requiredEKYC = false,
    required GenkeyModel genkeyModel,
    required String certId,
    String? otpSecret,
    String? otpSecretAdvanced,
    String? serviceType,
  }) async {
    try {
      var idNumber =
          await _secureLocalDataSource.getLastData(USERNAME_KEY) ?? "";

      await userInfoOnDeviceService.addOrUpdateCert(
          idNumber,
          CertModel(
              id: certId,
              pin: genkeyModel.userPIN,
              publicKey: genkeyModel.kakPub,
              privateKey: genkeyModel.kakPrivate,
              otpSecret: otpSecret,
              otpSecretAdvanced: otpSecretAdvanced,
              serviceType: serviceType));
    } catch (e) {}
  }

  Future<void> _assignKey() async {
    showLoading(loadingTitle: AppLocalizations.current.activingKey);
    var userName = authController.currentUser.value?.uid;
    GenkeyModel genkeyModel = GenKeyUtil.genKeyWithPinCode(pinCode: pin!);

    await saveUserInfo(
        genkeyModel: genkeyModel,
        certId: certificateModel.id,
        serviceType: certificateModel.certProfile?.serviceType);

    try {
      String? privBase64 = genkeyModel.kakPrivate;
      if (privBase64 == null) {
        _showError(AppLocalizations.current.KAKNotFound);
        return;
      }

      Uint8List priv = base64.decode(privBase64);
      var map1 = <String, Object>{};
      map1['data'] = priv;
      map1['key'] = utf8.encode(pin!);
      final decrypted = _aesEncryptionService.decryptList(map1);
      if (decrypted == null) {
        _showError(AppLocalizations.current.invalidPIN);
        return;
      }
      final privPem = utf8.decode(decrypted);
      final pubPem = genkeyModel.kakPub;
      Map<String, String> chal = <String, String>{};
      chal['privPem'] = privPem;
      chal['pubPem'] = pubPem;
      final challengeSig =
          _rsaKeyService.getKeyInitializeChallengeFromPem(chal);
      if (challengeSig == null) {
        _showError(AppLocalizations.current.calAuthDataFail);
        return;
      }
      var deviceInfo = await _deviceInfoService.getDeviceInfo();
      if (deviceInfo == null) {
        _showError(AppLocalizations.current.serviceNotFoundDevice);
        return;
      }
      final localDataStr =
          await _secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);

      if (localDataStr == null) {
        _showError(AppLocalizations.current.serviceExpireToken);
        return;
      }

      TokenModel data = TokenModel.fromJson(localDataStr);
      Map<String, Object> sadData = <String, Object>{};
      sadData['sub'] = userName!;
      sadData['credentialId'] = certificateModel.id;
      sadData['keyAuthData'] = base64.encode(challengeSig);
      sadData['deviceId'] = deviceInfo.deviceId;
      sadData['kakPriv'] = privPem;
      sadData['kakPub'] = pubPem;
      sadData['access_token'] = data.accessToken;
      String sad = _sJWTService.createActiveData(sadData);

      bool iseSeal = certificateModel.certProfile?.isEseal() ?? false;

      final param = {
        "uid": iseSeal ? userName : null,
        "credentialId": certificateModel.id,
        "sad": sad,
        "pin": iseSeal ? pin : null,
        "phoneNumber": authController.currentUser.value?.phone ?? "",
        "otp": otp ?? "",
        "deviceInfo": {
          "deviceId": deviceInfo.deviceId,
          "deviceName": deviceInfo.deviceName,
          "deviceModel": deviceInfo.branch,
          "branch": deviceInfo.branch,
          "fcmDeviceToken":
              "fcmDeviceToken", //await FirebaseMessaging.instance.getToken(),
          "kakPublicKey": !iseSeal ? genkeyModel.kakPub : null,
          "osName": deviceInfo.osName,
          "osVersion": deviceInfo.osVersion,
          "useBiometrics":
              authController.currentUser.value?.useBiometric ?? false,
        }
      };

      Either<GenericException, SmartCAApiResponse> result;

      if (iseSeal) {
        result = await _certificateEsealRep.assignWithOtp(param);
      } else {
        result = await _certificateRepository.initializeKey(param);
      }

      hideLoading();
      result.fold((failure) {
        _showError(exceptionHandler(failure));
      }, (result) {
        if (result.content == null || result.code != 0) {
          String m = result.message;
          _showError(m);
        } else {
          //Cache data cho luồng tiếp tục khi thoát app: Bước tiếp theo, dữ liệu SAD, credential ID
          if (iseSeal) {
            _generateCSRConfirmEseal(result.content);
          } else {
            final sadReq = SADRequest.fromJson(result.content);

            _generateCSRConfirm(
                certificateModel.id, data.accessToken, sadReq, genkeyModel);
          }
        }
      });
    } catch (e) {
      _showError(exceptionHandler(GenericException(error: e)));
    }
  }

  _generateCSRConfirm(String credentialId, String token, SADRequest sadReq,
      GenkeyModel genkeyModel) async {
    try {
      showLoading(loadingTitle: AppLocalizations.current.activingKey);
      String? privBase64 = genkeyModel.kakPrivate;
      if (privBase64 == null) {
        _showError(AppLocalizations.current.KAKNotFound);
        return;
      }
      Uint8List priv = base64.decode(privBase64);
      var map1 = <String, Object>{};
      map1['data'] = priv;
      map1['key'] = utf8.encode(pin!);
      final privKey = _aesEncryptionService.decryptList(map1);
      if (privKey == null) {
        _showError(AppLocalizations.current.invalidPIN);
        return;
      }
      final pem = utf8.decode(privKey);
      Map<String, Object> challegeData = <String, Object>{};
      challegeData['key'] = pem;
      challegeData['data'] = base64.decode(sadReq.challenge);
      Uint8List keyAuthData = _rsaKeyService.signHash(challegeData);
      if (keyAuthData == null) {
        _showError(AppLocalizations.current.cannotSignKeyChallenge);
        return;
      }

      var deviceInfo = await _deviceInfoService.getDeviceInfo();
      if (deviceInfo == null) {
        _showError(AppLocalizations.current.serviceNotFoundDevice);
        return;
      }

      Map<String, Object> sadData = <String, Object>{};
      // định danh user
      sadData['sub'] = sadReq.sub;
      // 3rd là SAM luôn
      sadData['appId'] = sadReq.audience;
      // authrequest từ hsm
      sadData['tranId'] = sadReq.authRequestId;
      // request cert id
      sadData['signReqId'] = credentialId;
      sadData['challengeId'] = sadReq.challengeId;
      sadData['docs'] = [sadReq.data];
      sadData['access_token'] = token;
      sadData['keyAuthData'] = base64.encode(keyAuthData);
      sadData['deviceId'] = deviceInfo.deviceId;
      sadData['privKeyPEM'] = pem;

      String sad = _sJWTService.createAssignKeyData(sadData);
      var result =
          await _certificateRepository.generateCSRConfirm(credentialId, sad);
      hideLoading();
      result.fold(
        (failure) {
          _showError(exceptionHandler(failure));
        },
        (result) async {
          canLoop = true;
          checkCertIsWaitAcceptance();
        },
      );
    } catch (e) {
      _showError(exceptionHandler(GenericException(error: e)));
    }
  }

  void gotoSignBBNT({required String credentialId}) {
    Get.until((route) => Get.currentRoute == "/");
    Get.to(() => SignAcceptanceView(credentialId: credentialId));
  }

  _showError(String? error) {
    hideLoading();
    showErrorModal(error ?? AppLocalizations.current.serviceSomethingWentWrong)
        .then((value) {
      goHome();
    });
  }

  _generateCSRConfirmEseal(Map resAssignKey) async {
    final certificateRepository = getIt<CertificateRepositoryEseal>();
    try {
      final localDataStr =
          await _secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);

      if (localDataStr == null) {
        _showError(AppLocalizations.current.serviceExpireToken);
        return;
      }

      TokenModel data = TokenModel.fromJson(localDataStr);
      var uid = authController.currentUser.value?.uid;

      var deviceInfo = await _deviceInfoService.getDeviceInfo();
      if (deviceInfo == null) {
        _showError(exceptionHandler(GenericException(
            error: AppLocalizations.current.cannotGetDeviceInfo)));
        return;
      }
      String secret = resAssignKey["totpSpec"]["totp"];
      var bytes = base64Decode(
          decodeTOTP(cipher: secret, deviceId: deviceInfo.deviceId, pin: pin!));
      var secretB32 = base32.encode(bytes);

      final cert = await userInfoOnDeviceService
          .getCerCurrentUserByIdCer(certificateModel.id);
      cert?.otpSecret = secretB32;
      await userInfoOnDeviceService.addOrUpdateCert(uid!, cert!);

      var totp = TOTP(secret: secretB32);

      var otp1 = totp.now();
      var b64KeyAuthConfirmCsr = resAssignKey["challenge"];
      var reqSignKeyAuthDataConfirmCsr = <String, Object>{};
      reqSignKeyAuthDataConfirmCsr["uid"] = uid!;
      reqSignKeyAuthDataConfirmCsr["credentialId"] = certificateModel.id;
      reqSignKeyAuthDataConfirmCsr["hash"] = b64KeyAuthConfirmCsr;
      reqSignKeyAuthDataConfirmCsr["otp"] = otp1;

      var resSignKeyAuthDataConfirmCsrResp =
          await certificateRepository.signData(reqSignKeyAuthDataConfirmCsr);

      dynamic resSignKeyAuthDataConfirmCsr;
      resSignKeyAuthDataConfirmCsrResp.fold((failure) {
        _showError(exceptionHandler(failure));
        return;
      }, (r) {
        resSignKeyAuthDataConfirmCsr = r.content;
      });

      var keyAuthDataConfirmCsr = resSignKeyAuthDataConfirmCsr;
      // tạo dữ liệu sad confirm csr
      var builder = JWTBuilder();
      var token2 = builder
        ..id = const Uuid().v4()
        ..subject = resAssignKey["sub"]
        ..audience = resAssignKey["audience"]
        ..issuer = 'VNPT SIC component'
        ..issuedAt = DateTime.now()
        ..expiresAt = DateTime.now().add(const Duration(minutes: 5))
        ..setClaim('seElnSadext', {
          'access_token': data.accessToken,
          'docs': resAssignKey["data"],
          'requestId': resAssignKey["challengeId"].toInt(),
          'irt': resAssignKey["challengeId"].toInt().toString(),
          'keyAuthData': keyAuthDataConfirmCsr,
          'attr': 'urn:oid:1.2.752.29.4.13',
          'deviceId': deviceInfo.deviceId,
          'loa': "http://id.elegnamnden.se/loa/1.0/loa3-sigmessage"
        })
        ..getToken();

      var sadHeader = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9";
      String tokenConfirmCSR = token2.getToken().toString();
      tokenConfirmCSR = token2.getToken().toString();
      tokenConfirmCSR = "$sadHeader.${tokenConfirmCSR.split(".").last}";

      var byteTokenConfirmCSR = utf8.encode(tokenConfirmCSR);
      var sha2562 = sha256.convert(byteTokenConfirmCSR);
      var b64HashDataConfirmCSRSad = base64Encode(sha2562.bytes);

      // ký sad  confirm csr
      String otp2 = totp.now();
      final reqSignSadCsrConfirm = <String, Object>{};
      reqSignSadCsrConfirm["uid"] = uid;
      reqSignSadCsrConfirm["credentialId"] = certificateModel.id;
      reqSignSadCsrConfirm["hash"] = b64HashDataConfirmCSRSad;
      reqSignSadCsrConfirm["otp"] = otp2;

      final resSignSadCsrConfirmResp =
          await certificateRepository.signData(reqSignSadCsrConfirm);

      dynamic resSignSadCsrConfirm;
      resSignSadCsrConfirmResp.fold((failure) {
        _showError(exceptionHandler(failure));
        return;
      }, (r) {
        resSignSadCsrConfirm = r.content;
      });

      // tạo sad  confirm csr
      String sadCsrConfirm =
          replaceSad("$tokenConfirmCSR." + resSignSadCsrConfirm);

      // gửi confirm csr
      final reqCsrConfirm = <String, Object>{};
      reqCsrConfirm["uid"] = uid;
      reqCsrConfirm["credentialId"] = certificateModel.id;
      reqCsrConfirm["sad"] = sadCsrConfirm;

      final resConfimCsr =
          await certificateRepository.csrConfirm(reqCsrConfirm);
      hideLoading();
      resConfimCsr.fold((failure) {
        _showError(exceptionHandler(failure));
      }, (r) {
        checkCertIsWaitAcceptance();
        // gotoSignBBNT(credentialId: certificateModel.id);
      });
    } on Exception catch (e, s) {
      _showError(exceptionHandler(GenericException(error: e, stack: s)));
      // await _errorHandlerService.sendErrorToServer('certBloc', e.toString());
    }
  }

  String replaceSad(String sad) {
    return sad.replaceAll("+", "-").replaceAll("/", "_").replaceAll("=", "");
  }

  decodeTOTP(
      {required String cipher, required String deviceId, required String pin}) {
    String keyString = "$pin.$deviceId"; // 112233.f67950794eb68ee0
    var x = base64.encode(utf8.encode(keyString));
    var bytes = sha256.convert(utf8.encode(x));

    var keyBytes = chunk(bytes.bytes, 16);

    var key = encrypt.Key.fromBase64(base64.encode(keyBytes));
    // var key = Key.fromUtf8(pin + "." + deviceId);
    var iv = encrypt.IV.fromLength(16);

    var aes = encrypt.AES(
      key,
      mode: encrypt.AESMode.ecb, /* padding: AESPadding */
    );
    var encrypter = encrypt.Encrypter(aes);
    var decrypted = encrypter.decrypt64(cipher, iv: iv);
    return decrypted;
  }

  List<int> chunk(List<int> sequence, int subIndex) {
    List<int> target = List<int>.filled(16, 0);
    while (subIndex > 0) {
      subIndex = subIndex - 1;
      target[subIndex] = sequence[subIndex];
    }
    return target;
  }

  void clearCache() {
    _secureLocalDataSource.removeAll();
  }

  void showDialogCertValid() {
    showSuccessModal(
      message: AppLocalizations.current.certValid,
      titleBtnAccept: AppLocalizations.current.goHome,
      title: AppLocalizations.current.successNotirce,
      actionAccept: () {
        goHome();
      },
    );
  }
}

goHome() {
  final appController = Get.find<AppController>();
  appController.backToMainPage();
}
