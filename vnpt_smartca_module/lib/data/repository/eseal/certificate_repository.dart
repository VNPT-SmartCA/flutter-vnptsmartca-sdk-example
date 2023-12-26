import 'package:dartz/dartz.dart';

import '../../../core/models/app/exceptions.dart';
import '../../../core/models/response/service_response.dart';
import '../../network/eseal/cert_api_eseal.dart';

class CertificateRepositoryEseal {
  CertApiEseal remoteDataSource;
  CertificateRepositoryEseal(this.remoteDataSource);

  Future<Either<GenericException, SmartCAApiResponse>> assignKey(
      dynamic reqSign) async {
    try {
      final remoteData = await remoteDataSource.assignKey(reqSign);

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

  Future<Either<GenericException, SmartCAApiResponse>> assignWithOtp(
      dynamic reqSign) async {
    try {
      final remoteData = await remoteDataSource.assignWithOtp(reqSign);

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

  Future<Either<GenericException, SmartCAApiResponse>> csrConfirm(
      dynamic reqSign) async {
    try {
      final remoteData = await remoteDataSource.csrConfirm(reqSign);
      return remoteData.code == 0
          ? Right(remoteData)
          : Left(GenericException(
              error: ServerException(
              message: remoteData.codeDesc ?? "",
              code: remoteData.code, //code = 61000
              codeDesc:
                  remoteData.codeDesc, //codeDesc=CREDENTIAL_ASSIGN_KEY_FAILED
            )));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, SmartCAApiResponse>> signData(
      dynamic reqSign) async {
    try {
      final remoteData = await remoteDataSource.signData(reqSign);
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
