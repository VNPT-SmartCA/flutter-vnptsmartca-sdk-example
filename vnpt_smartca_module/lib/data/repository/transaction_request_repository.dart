import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/request/transaction_info_request.dart';
import '../../../core/models/request/transaction_request_api_model.dart';
import '../../../core/models/response/transaction_model.dart';
import '../../../data/network/transaction_request_api.dart';

class TransactionRequestRepository {
  final TransactionRequestApi remoteDataSource;

  TransactionRequestRepository(this.remoteDataSource);

  getTransactionRequests(TransactionRequestApiModel req) async {
    try {
      final remoteData = await remoteDataSource.getTransactionRequests(req);
      List<TransactionModel> resp = List.from(
        remoteData.content.map(
          (x) => TransactionModel.fromMap(x),
        ),
      );

      resp = resp.where((element) => element.expiredIn > 1).toList();
      return remoteData.code == 0
          ? Right(resp)
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

  Future<Either<GenericException, TransactionModel>>
      getWaitingTransactionInfoById(
    TransactionInfoRequest req,
  ) async {
    try {
      final remoteData = await remoteDataSource.getWaitingTransactionById(req);
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
}
