import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/request/history_request_model.dart';
import '../../../core/models/response/transaction_history.dart';
import '../../../data/network/transaction_history_api.dart';

class TransactionHistoryRepository {
  final TransactionHistoryApi remoteDataSource;

  TransactionHistoryRepository(this.remoteDataSource);

  getTransactionHistory(HistoryRequestModel req) async {
    try {
      final remoteData = await remoteDataSource.getTransactionHistory(req);
      final resp = TransactionHistoryRespModel.fromMap(remoteData.content);
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
}
