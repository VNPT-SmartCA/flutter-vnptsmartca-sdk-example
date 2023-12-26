import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/request/service_pack_his_request_model.dart';
import '../../../core/models/response/service_pack_order_history.dart';
import '../../../data/network/service_pack_history_api.dart';

class ServicePackHistoryRepository {
  final ServicePackHistoryApi remoteDataSource;

  ServicePackHistoryRepository(this.remoteDataSource);

  getListServicePackOrderHistory(ServicePackOrderHistoryRequest params) async {
    try {
      final remoteData = await remoteDataSource.getListServicePackOrderHistory(params);
      final resp = ServicePackOrderHistoryList.fromJson(remoteData.content);
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

  // ignore: long-method
  reCreateServicePackOrder(String id) async {
    try {
      var remoteData = await remoteDataSource.requestInitPersonalSignOrderFromCustomer(id);
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
