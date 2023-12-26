import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/response/service_response.dart';
import '../../../data/network/eseal/transaction_api_eseal.dart';

class TransactionRepositoryEseal {
  final TransactionEsealApi remoteDataSource;

  TransactionRepositoryEseal(this.remoteDataSource);

  Future<Either<GenericException, SmartCAApiResponse>> eSealGetCode(
      dynamic reqSign) async {
    try {
      final remoteData = await remoteDataSource.eSealGetCode(reqSign);

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

  Future<Either<GenericException, SmartCAApiResponse>> confirmAcceptance(
      dynamic reqSign) async {
    try {
      final remoteData = await remoteDataSource.confirmAcceptance(reqSign);

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

  Future<Either<GenericException, SmartCAApiResponse>> signhashEseal(
      dynamic reqSign) async {
    try {
      final remoteData = await remoteDataSource.signhashEseal(reqSign);

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
