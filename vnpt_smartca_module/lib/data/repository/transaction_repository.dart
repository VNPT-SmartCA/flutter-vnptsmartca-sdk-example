// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/device_info.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/app/user_info_on_device.dart';
import '../../../core/models/request/confirm_wt_req.dart';
import '../../../core/models/request/reject_wt_req.dart';
import '../../../core/models/request/request_params_to_sign.dart';
import '../../../core/models/request/signature_item_template.dart';
import '../../../core/models/request/waiting_tran_req_model.dart';
import '../../../core/models/request/waiting_trans_req_model.dart';
import '../../../core/models/response/service_response.dart';
import '../../../core/models/response/token_model.dart';
import '../../../core/models/response/transaction_model.dart';
import '../../../core/services/crypto/aes_encryption_util.dart';
import '../../../core/services/crypto/jwt_util.dart';
import '../../../core/services/crypto/kak_utils.dart';
import '../../../core/services/device_info.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../core/services/user_info_on_device.dart';
import '../../../core/utils/constants.dart';
import '../../../data/network/transaction_api.dart';
import '../../../data/repository/eseal/certificate_repository.dart';
import '../../../views/i18n/generated_locales/l10n.dart';

import '../../core/services/dart_otp/src/totp.dart';

class TransactionRepository {
  final TransactionApi remoteDataSource;

  TransactionRepository(this.remoteDataSource);

  Future<Either<GenericException, TransactionModel>> getWaitingTransactionById(
    WaitingTransactionRequest req,
  ) async {
    try {
      try {
        final remoteData =
            await remoteDataSource.getWaitingTransactionById(req);
        return remoteData.code == 0
            ? Right(TransactionModel.fromMap(remoteData.content))
            : Left(GenericException(
                error: ServerException(
                message: remoteData.message,
                code: remoteData.code,
                codeDesc: remoteData.codeDesc,
              )));
      } catch (e, s) {
        return Left(GenericException(error: e, stack: s));
      }
    } on SocketException catch (e) {
      return Left(GenericException(
          error: ServerException(
        message: AppLocalizations.current.noInternet,
        code: 404,
        codeDesc: AppLocalizations.current.noInternet,
      )));
    }
  }

  Future<Either<GenericException, SmartCAApiResponse>>
      confirmWaitingTransaction(
          TransactionModel model, String userPIN, String sad) async {
    try {
      final remoteData = await remoteDataSource.confirmWaitingTransaction(
        ConfirmWTRequest(
          tranId: model.tranId,
          credentialId: model.credentialId,
          sad: sad,
        ),
      );
      return remoteData.code == 0
          ? Right(remoteData)
          : Left(GenericException(
              error: ServerException(
              message: remoteData.message,
              code: remoteData.code,
              codeDesc: remoteData.codeDesc,
            )));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, SmartCAApiResponse>> rejectWaitingTransaction(
      TransactionModel model, String userPIN, String sad) async {
    try {
      final remoteData =
          await remoteDataSource.rejectWaitingTransaction(RejectWTRequest(
        tranId: model.tranId,
        credentialId: model.credentialId,
        sad: sad,
      ));
      return remoteData.code == 0
          ? Right(remoteData)
          : Left(GenericException(
              error: ServerException(
              message: remoteData.message,
              code: remoteData.code,
              codeDesc: remoteData.codeDesc,
            )));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, List<TransactionModel>>>
      getWaitingTransactions(WaitingTransactionListRequest req) async {
    try {
      final remoteData = await remoteDataSource.getWaitingTransactions(req);
      if (remoteData.content != null && remoteData.code == 0) {
        List<TransactionModel> trans = List.from(
          remoteData.content.map(
            (x) => TransactionModel.fromMap(x),
          ),
        );

        return Right(trans);
      } else {
        return Left(GenericException(
          error: ServerException(
            message: remoteData.message,
            code: remoteData.code,
            codeDesc: remoteData.codeDesc,
          ),
        ));
      }
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  getTransInfor(String tranID) async {
    try {
      final remoteData = await remoteDataSource.getTransInfor(tranID);
      return remoteData.code == 0
          ? Right(TransactionModel.fromMap(remoteData.content))
          : Left(GenericException(
              error: ServerException(
              message: remoteData.message,
              code: remoteData.code,
              codeDesc: remoteData.codeDesc,
            )));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  //nvtruong: Hàm gửi yêu cầu ký tài liệu tên app
  Future<Either<GenericException, SmartCAApiResponse>> signMutiple(
    RequestSignParams req,
  ) async {
    try {
      try {
        final remoteData = await remoteDataSource.signMutiple(req);
        return remoteData.code == 0
            ? Right(remoteData)
            : Left(GenericException(
                error: ServerException(
                message: remoteData.message,
                code: remoteData.code,
                codeDesc: remoteData.codeDesc,
              )));
      } catch (e, s) {
        return Left(GenericException(error: e, stack: s));
      }
    } on SocketException catch (e) {
      return Left(GenericException(
          error: ServerException(
        message: AppLocalizations.current.noInternet,
        code: 404,
        codeDesc: AppLocalizations.current.noInternet,
      )));
    }
  }

  Future<Either<GenericException, List<SignatureItemTemplateModel>>>
      getSignatureItemTemplates(String accessToken) async {
    try {
      List<SignatureItemTemplateModel> signatureItemTemps = [];
      final remoteData =
          await remoteDataSource.getSignatureItemTemplates(accessToken);
      if (remoteData.code == 0 && remoteData.content == '') {
        return Right(signatureItemTemps);
      } else if (remoteData.content != '' && remoteData.code == 0) {
        signatureItemTemps = List.from(
          remoteData.content.map(
            (x) => SignatureItemTemplateModel.fromJson(x),
          ),
        );

        return Right(signatureItemTemps);
      } else {
        return Left(GenericException(
          error: ServerException(
            message: remoteData.message,
            code: remoteData.code,
            codeDesc: remoteData.codeDesc,
          ),
        ));
      }
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, SmartCAApiResponse>> addSigTemplates(
      dynamic params) async {
    try {
      final remoteData = await remoteDataSource.addSigTemplates(params);
      return remoteData.code == 0
          ? Right(remoteData)
          : Left(GenericException(
              error: ServerException(
              message: remoteData.message,
              code: remoteData.code,
              codeDesc: remoteData.codeDesc,
            )));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, SmartCAApiResponse>> removeSigTemplate(
      String key) async {
    try {
      final remoteData = await remoteDataSource.removeSigTemplate(key);
      return remoteData.code == 0
          ? Right(remoteData)
          : Left(GenericException(
              error: ServerException(
              message: remoteData.message,
              code: remoteData.code,
              codeDesc: remoteData.codeDesc,
            )));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }
}

@lazySingleton
class GenerateSADUtils {
  final _secureLocalDataSource = getIt<SecureLocalStorageService>();
  final _deviceInfoService = getIt<DeviceInfoService>();
  final aesEncryptionService = getIt<AESEncryptionService>();
  final rsaKeyService = getIt<RsaKeyService>();
  final jwtService = getIt<JWTService>();
  final userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();
  final certificateRepository = getIt<CertificateRepositoryEseal>();

  checkedAndGenerateSAD(
      TransactionModel model, String userPIN, CertModel certModel) async {
    try {
      dynamic token =
          await _secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);
      var tokenModel = TokenModel.fromJson(token);
      if (token == null) throw AppLocalizations.current.serviceExpireToken;

      var privateBase64 = certModel.privateKey;
      // String? pinFailed =
      //     await _secureLocalDataSource.getLastData(PIN_FAILED_COUNT_KEY);
      // pinFailed ??= "";
      // var failed = int.tryParse(pinFailed) ?? 0;
      // if (failed >= 5) throw AppLocalizations.current.serviceLockPINOverEnter;
      var deviceInfoModel = await _deviceInfoService.getDeviceInfo();
      Uint8List priv = base64.decode(privateBase64);
      var map1 = <String, Object>{};
      map1["data"] = priv;
      map1["key"] = utf8.encode(userPIN);
      var decrypted = aesEncryptionService.decryptList(map1);

      // await _secureLocalDataSource.saveData(PIN_FAILED_COUNT_KEY, "0");
      final pem = utf8.decode(decrypted!);
      Map<String, Object> keyAuth = <String, Object>{};
      keyAuth['key'] = pem;
      keyAuth['data'] = base64.decode(model.challenge);
      final keyAuthData = rsaKeyService.signHash(keyAuth);

      String sad = jwtService.createSAD(
          _generateSAD(model, pem, keyAuthData, deviceInfoModel, tokenModel));
      return sad;
    } catch (e) {
      rethrow;
    }
  }

  checkedAndGenerateSADAcceptanceESeal(TransactionModel model, String uid,
      String userPIN, CertModel certModel) async {
    try {
      final token =
          await _secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);
      if (token == null) throw AppLocalizations.current.serviceExpireToken;
      var tokenModel = TokenModel.fromJson(token);

      var deviceInfoModel = await _deviceInfoService.getDeviceInfo();
      var totp = TOTP(secret: certModel.otpSecret!);
      var otp = totp.now();

      // Tạo keyAuthData bằng ký challenge
      var b64KeyAuth = model.challenge;

      var reqSignKeyAuthData = <String, Object>{};
      reqSignKeyAuthData["uid"] = uid;
      reqSignKeyAuthData["credentialId"] = model.credentialId;
      reqSignKeyAuthData["hash"] = b64KeyAuth;
      reqSignKeyAuthData["otp"] = otp;

      var resSignKeyAuthDataResp =
          await certificateRepository.signData(reqSignKeyAuthData);

      // TẠO Dữ liệu SAD
      String keyAuthData = "";
      resSignKeyAuthDataResp.fold((failure) {
        throw failure;
      }, (r) {
        keyAuthData = r.content;
      });

      var builder = JWTBuilder();
      var tokenSad = builder
        ..id = Uuid().v4()
        ..subject = model.sub
        ..audience = deviceInfoModel.deviceId
        ..issuer = 'VNPT SIC component'
        ..issuedAt = DateTime.now()
        ..expiresAt = DateTime.now().add(const Duration(minutes: 5))
        ..setClaim('seElnSadext', {
          'access_token': tokenModel.accessToken,
          'docs': model.docs[0]['hash'],
          'requestId': model.challengeId.toInt(),
          'irt': model.challengeId.toInt().toString(),
          'keyAuthData': keyAuthData,
          'attr': 'urn:oid:1.2.752.29.4.13',
          'deviceId': deviceInfoModel.deviceId,
          'loa': "http://id.elegnamnden.se/loa/1.0/loa3-sigmessage"
        })
        ..getToken();

      var sadHeader = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9";
      String tokenSadString = tokenSad.getToken().toString();
      tokenSadString = tokenSad.getToken().toString();
      tokenSadString = "$sadHeader.${tokenSadString.split(".").last}";

      var byteTokenString = utf8.encode(tokenSadString);
      var sha2562 = sha256.convert(byteTokenString);
      var b64HashDataSad = base64Encode(sha2562.bytes);

      // ký sad  confirm csr
      String otp4 = totp.now();
      final reqSignSad = <String, Object>{};
      reqSignSad["uid"] = uid;
      reqSignSad["credentialId"] = model.credentialId;
      reqSignSad["hash"] = b64HashDataSad;
      reqSignSad["otp"] = otp4;

// ký KEYAUDATA ACCEPTANCE
      String otp5 = totp.now();
      final reqSignKeyAuthAcceptace = <String, Object>{};
      reqSignKeyAuthAcceptace["uid"] = uid;
      reqSignKeyAuthAcceptace["credentialId"] = model.credentialId;
      reqSignKeyAuthAcceptace["hash"] = model.challenge;
      reqSignKeyAuthAcceptace["otp"] = otp5;

      final resSignKeyAuthAcceptanceResp =
          await certificateRepository.signData(reqSignKeyAuthAcceptace);

      String keyAuthAppceptance = "";
      resSignKeyAuthAcceptanceResp.fold((failure) {
        throw failure;
      }, (r) {
        keyAuthAppceptance = r.content;
      });

      // tạo dữ liệu sad ký biên bản nghiệp thu
      var token3 = builder
        ..id = Uuid().v4()
        ..subject = model.sub
        ..audience = "VNPT_SmartCA_System"
        ..issuer = 'VNPT SIC component'
        ..issuedAt = DateTime.now()
        ..expiresAt = DateTime.now().add(Duration(minutes: 5))
        ..setClaim('seElnSadext', {
          'access_token': tokenModel.accessToken,
          'docs': model.docs[0]["hash"],
          'requestId': model.challengeId.toInt(),
          'irt': model.tranId,
          'keyAuthData': keyAuthAppceptance,
          'attr': 'urn:oid:1.2.752.29.4.13',
          'deviceId': deviceInfoModel.deviceId,
          'loa': "http://id.elegnamnden.se/loa/1.0/loa3-sigmessage"
        })
        ..getToken();

      // var sadHeader = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9";
      String tokenAcceptance = token3.getToken().toString();
      tokenAcceptance = token3.getToken().toString();
      tokenAcceptance = "$sadHeader.${tokenAcceptance.split(".").last}";

      final resSignSadAcceptanceResp =
          await certificateRepository.signData(reqSignSad);

      String sadAcceptance = "";
      resSignSadAcceptanceResp.fold((failure) {
        throw failure;
      }, (r) {
        sadAcceptance = replaceSad("$tokenAcceptance." + r.content);
      });

      return sadAcceptance;
    } catch (e) {
      rethrow;
    }
  }

  checkedAndGenerateSADESeal(TransactionModel model, String uid, String userPIN,
      CertModel certModel) async {
    try {
      dynamic token =
          await _secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);
      var tokenModel = TokenModel.fromJson(token);
      if (token == null) throw AppLocalizations.current.serviceExpireToken;

      var deviceInfoModel = await _deviceInfoService.getDeviceInfo();
      var totp = TOTP(secret: certModel.otpSecret!);
      var otp = totp.now();

      // Tạo keyAuthData bằng ký challenge
      var b64KeyAuth = model.challenge;

      var reqSignKeyAuthData = <String, Object>{};
      reqSignKeyAuthData["uid"] = uid;
      reqSignKeyAuthData["credentialId"] = model.credentialId;
      reqSignKeyAuthData["hash"] = b64KeyAuth;
      reqSignKeyAuthData["otp"] = otp;

      var resSignKeyAuthDataResp =
          await certificateRepository.signData(reqSignKeyAuthData);

      // TẠO Dữ liệu SAD
      String keyAuthData = "";
      resSignKeyAuthDataResp.fold((failure) {
        throw failure;
      }, (r) {
        keyAuthData = r.content;
      });

      var builder = JWTBuilder();
      var tokenSad = builder
        ..id = Uuid().v4()
        // ..subject = transaction.sub
        ..audience = model.relyPartyId
        ..issuer = 'VNPT SIC component'
        ..issuedAt = DateTime.now()
        ..expiresAt = DateTime.now().add(const Duration(minutes: 5))
        ..setClaim('seElnSadext', {
          'access_token': tokenModel,
          'docs': model.docs[0]['hash'],
          'requestId': model.challengeId.toInt(),
          'irt': model.challengeId.toInt().toString(),
          'keyAuthData': keyAuthData,
          'attr': 'urn:oid:1.2.752.29.4.13',
          'deviceId': deviceInfoModel.deviceId,
          'loa': "http://id.elegnamnden.se/loa/1.0/loa3-sigmessage"
        })
        ..getToken();

      var sadHeader = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9";
      String tokenSadString = tokenSad.getToken().toString();
      tokenSadString = tokenSad.getToken().toString();
      tokenSadString = "$sadHeader.${tokenSadString.split(".").last}";

      var byteTokenString = utf8.encode(tokenSadString);
      var sha2562 = sha256.convert(byteTokenString);
      var b64HashDataSad = base64Encode(sha2562.bytes);

      // ký sad  confirm csr
      String otp4 = totp.now();
      final reqSignSad = <String, Object>{};
      reqSignSad["uid"] = uid;
      reqSignSad["credentialId"] = model.credentialId;
      reqSignSad["hash"] = b64HashDataSad;
      reqSignSad["otp"] = otp4;

      final resSignSadResp = await certificateRepository.signData(reqSignSad);

      String sad = "";
      resSignSadResp.fold((failure) {
        throw failure;
      }, (r) {
        sad = replaceSad("$tokenSadString." + r.content);
      });

      return sad;
    } catch (e) {
      rethrow;
    }
  }

  String replaceSad(String sad) {
    return sad.replaceAll("+", "-").replaceAll("/", "_").replaceAll("=", "");
  }

  // Sinh SAD
  Map<String, Object> _generateSAD(
      TransactionModel model,
      String pem,
      Uint8List keyAuthData,
      DeviceInfoModel deviceInfoModel,
      TokenModel tokenModel) {
    Map<String, Object> sadData = <String, Object>{};
    sadData['sub'] = model.sub;
    sadData['appId'] = model.relyPartyId;
    sadData['tranId'] = model.tranId;
    sadData['signReqId'] = model.signReqId;
    sadData['keyAuthData'] = base64.encode(keyAuthData);
    sadData['access_token'] = tokenModel.accessToken;
    sadData['challengeId'] = model.challengeId;
    sadData['docs'] = model.docs;
    sadData['deviceId'] = deviceInfoModel.deviceId;
    sadData['privKeyPEM'] = pem;
    return sadData;
  }
}
