import 'dart:ffi';

import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';

import '../../core/models/response/order_cert_model.dart';
import '../network/sign_bill_api.dart';

class SignBillRepository {
  final SignBillApi remoteDataSource;

  SignBillRepository(this.remoteDataSource);

  Future<Either<GenericException, String>> getBill(String serial) async {
    try {
      final remoteData = await remoteDataSource.getBill(serial);
      return remoteData.code == 0
          ? Right(remoteData.content)
          : Left(GenericException(
              error: ServerException(
                message: remoteData.message,
                code: remoteData.code,
                codeDesc: remoteData.codeDesc,
              ),
            ));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, String>> saveSignatureImage(String serial, String base64SignatureImage) async {
    try {
      final remoteData = await remoteDataSource.saveSignatureImage(serial, base64SignatureImage);
      return remoteData.code == 0
          ? Right(remoteData.content)
          : Left(GenericException(
              error: ServerException(
                message: remoteData.message,
                code: remoteData.code,
                codeDesc: remoteData.codeDesc,
              ),
            ));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, OrderCertModel>> uploadOrderContract(String orderId, String base64Contract) async {
    try {
      final remoteData = await remoteDataSource.uploadOrderContract(orderId, base64Contract);
      // final resp = OrderCertModel.fromJson(remoteData.content);
      return remoteData.code == 0
          ? Right(OrderCertModel.fromJson(remoteData.content))
          : Left(GenericException(
        error: ServerException(
          message: remoteData.message,
          code: remoteData.code,
          codeDesc: remoteData.codeDesc,
        ),
      ));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }
}
