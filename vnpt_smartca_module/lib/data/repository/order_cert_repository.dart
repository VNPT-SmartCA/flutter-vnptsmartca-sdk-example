import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/request/ekyc_customer.dart';
import '../../../core/models/response/service_response.dart';
import '../../../data/network/ekyc_api.dart';
import '../../../data/network/order_cert_api.dart';

import '../../core/models/response/user_address.dart';

class OrderCertRepository {
  OrderCertApi remoteDataSource;

  OrderCertRepository(this.remoteDataSource);

  Future<Either<GenericException, SmartCAApiResponse>> getOrderList() async {
    try {
      final remoteData = await remoteDataSource.getListOrder();
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
  Future<Either<GenericException, SmartCAApiResponse>> updateMailPhone(Map<String, dynamic> map) async {
    try {
      final remoteData = await remoteDataSource.updateMailPhone(map);
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

  Future<Either<GenericException, SmartCAApiResponse>> getUserAddress() async {
    try {
      final remoteData = await remoteDataSource.getUserAddress();
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

  Future<Either<GenericException, SmartCAApiResponse>> getOrderOTP(dynamic dataItems) async {
    try {
      final remoteData = await remoteDataSource.getOrderOTP(dataItems);
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

  Future<Either<GenericException, SmartCAApiResponse>> verifyOTPAndActiveKeyPair(dynamic dataItems) async {
    try {
      final remoteData = await remoteDataSource.verifyOTPAndActiveKeyPair(dataItems);
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

  Future<Either<GenericException, SmartCAApiResponse>> updateUserAddress(UserAddress userAddress) async {
    try {
      final remoteData = await remoteDataSource.updateUserAddress(userAddress);
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

  Future<Either<GenericException, SmartCAApiResponse>> updateOrderAddress(String orderId) async {
    try {
      final remoteData = await remoteDataSource.updateOrderAddress(orderId);
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

  createPersonalCertificateOrder(dynamic dataItems, String accessToken) async {
    try {
      final remoteData = await remoteDataSource.createPersonalCertificateOrder(dataItems, accessToken);
      // final resp = TransactionHistoryRespModel.fromMap(remoteData.content);
      return remoteData.code == 0
          ? Right(remoteData.content)
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

  getOrderInfo(dynamic dataItems) async {
    try {
      final remoteData = await remoteDataSource.getOrderInfo(dataItems);
      // final resp = TransactionHistoryRespModel.fromMap(remoteData.content);
      return remoteData.code == 0
          ? Right(remoteData.content)
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

  verifyEkycWithOrderId(dynamic dataItems) async {
    try {
      final remoteData = await remoteDataSource.verifyEkycWithOrderId(dataItems);
      // final resp = TransactionHistoryRespModel.fromMap(remoteData.content);
      return remoteData.code == 0
          ? Right(remoteData.content)
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

  Future<Either<GenericException, SmartCAApiResponse>> verifyEkyc(EkycCustomerRequest ekycCustomerRequest) async {
    try {
      final remoteData = await remoteDataSource.verifyEkyc(ekycCustomerRequest);
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

  Future<Either<GenericException, SmartCAApiResponse>> createExtendOrder(String certSerial, String pricingCode) async {
    try {
      final remoteData = await remoteDataSource.createExtendOrder(certSerial, pricingCode);
      return (remoteData.code == 0 || remoteData.code == 60014)
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

  Future<Either<GenericException, SmartCAApiResponse>> cancelOrder(String orderId) async {
    try {
      final remoteData = await remoteDataSource.cancelOrder(orderId);
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