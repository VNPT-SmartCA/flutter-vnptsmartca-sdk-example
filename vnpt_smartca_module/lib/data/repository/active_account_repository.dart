// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../configs/app_config.dart';
import '../../core/models/app/exceptions.dart';
import '../../core/models/app/smartca_api_config.dart';
import '../../core/models/request/account_active.dart';
import '../../core/models/request/check_reactice_code.dart';
import '../../core/models/request/ekyc_customer.dart';
import '../../core/models/request/network_service_response.dart';
import '../../core/models/request/ptdtt_model.dart';
import '../../core/models/request/reactive_acc_by_email.dart';
import '../../core/models/request/reactive_ekyc_param.dart';
import '../../core/models/response/service_response.dart';
import '../../views/i18n/generated_locales/l10n.dart';
import '../network/auth_api.dart';
import '../network/ekyc_api.dart';

class ActiveAccountRepository {
  final AuthRemoteApi remoteDataSource;
  final SmartCAApiConfig apiConfig;
  final EKycRemoteApi remoteDataEKyc;

  ActiveAccountRepository(
      this.remoteDataSource, this.apiConfig, this.remoteDataEKyc);

  Future<Either<GenericException, SmartCAApiResponse>> checkActiveCode(
      AccountActiveRequestModel req) async {
    try {
      final remoteData = await remoteDataSource.checkActiveCode(req);
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

  Future<Either<GenericException, SmartCAApiResponse>> activeAccount(
      AccountActiveRequestModel req) async {
    try {
      final remoteData = await remoteDataSource.activeAccount(req);
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

  Future<NetworkServiceResponse<SmartCAApiResponse>> submitEKycResult(
      EkycCustomerRequest param, int userType) async {
    try {
      String path =
          '${apiConfig.gatewayUrl}/${AppConfig.language}/identityapi/ekyc/ekyc_customer';
      log(path);
      var result = await remoteDataEKyc.eKycUserOnlineTT<SmartCAApiResponse>(
          path, param, userType);

      if (result.mappedResult != null) {
        if (result.mappedResult['code'] != 0) {
          return NetworkServiceResponse(
            success: false,
            message: result.mappedResult['message'],
          );
        } else {
          if (result.mappedResult['message'] == null ||
              result.mappedResult['message'] == '') {
            result.mappedResult['message'] = 'success';
          }
          var res1 = SmartCAApiResponse.fromMap(result.mappedResult);

          return NetworkServiceResponse(
              content: res1,
              success: result.networkServiceResponse.success,
              message: '');
        }
      }
      return NetworkServiceResponse(
          success: result.networkServiceResponse.success,
          message: result.networkServiceResponse.message);
      // return ServiceResponse.fromJson(result.mappedResult);
    } catch (e) {
      log(e.toString());
      return NetworkServiceResponse(
        success: false,
        message: AppLocalizations.current.serviceSomethingWentWrong,
      );
    }
  }

  Future<Either<GenericException, String>> submitEKyc(
      EkycCustomerRequest param) async {
    try {
      final remoteData = await remoteDataSource.submitEKyc(param);
      return remoteData.code == 0
          ? Right('valid')
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

  Future<Either<GenericException, SmartCAApiResponse>> reactivateByCode(
      ReactiveAccByEmailParam param) async {
    final url =
        '/${AppConfig.language}/identityapi/reactivation/reactivateByCode';
    final result = await remoteDataEKyc.reactivateByCode(param, url);
    return Right(result);
  }

  @override
  Future<Either<GenericException, String>> ekycCustomer(
      ReactiveAccParam param) async {
    try {
      final remoteData = await remoteDataEKyc.ekycReactive(param);
      return remoteData.success
          ? Right('valid')
          : Left(GenericException(
              error: ServerException(
              code: remoteData.content!.code,
              message: remoteData.content!.message,
              codeDesc: remoteData.content!.codeDesc,
            )));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, String>> checkReactiveCode(
      CheckReactiveCodeRequest param) async {
    try {
      final remoteData = await remoteDataSource.checkReactiveCode(param);
      return remoteData.code == 0
          ? Right('valid')
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

  Future<Either<GenericException, SmartCAApiResponse>> getPyctdtt(
      GetPtdttParam param) async {
    var result = await remoteDataEKyc.getPhieuThayDoiTT(param);
    return Right(result);
  }

  Future<Either<GenericException, String>> get_Pyctdtt(
      GetPtdttParam param) async {
    var result = await remoteDataEKyc.getPhieuThayDoiTT(param);
    return result.code == 0
        ? Right('valid')
        : Left(GenericException(
            error: ServerException(
            message: result.message,
            code: result.code,
            codeDesc: result.codeDesc,
          )));
  }

  Future<Either<GenericException, String>> requestReactiveByEmail(
      String uid) async {
    final remoteData = await remoteDataSource.requestReactiveByEmail(uid);
    return remoteData.code == 0
        ? Right('valid')
        : Left(GenericException(
            error: ServerException(
            message: remoteData.message,
            code: remoteData.code,
            codeDesc: remoteData.codeDesc,
          )));
  }
}
