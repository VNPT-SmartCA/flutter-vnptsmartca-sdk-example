import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/response/joined_service_pack.dart';
import '../../../core/models/response/service_response.dart';
import '../../../data/network/cert_api.dart';

import '../../core/models/response/order_cert_model.dart';

class CertificateRepository {
  CertApi remoteDataSource;

  CertificateRepository(this.remoteDataSource);

  Future<Either<GenericException, SmartCAApiResponse>>
      getCertificateList() async {
    try {
      final remoteData = await remoteDataSource.getCertificate();
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

  Future<Either<GenericException, SmartCAApiResponse>> initializeKey(
      dynamic dataItems) async {
    try {
      final remoteData = await remoteDataSource.initializeKey(dataItems);
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

  Future<Either<GenericException, SmartCAApiResponse>> generateCSRConfirm(
      String credentialId, String sad) async {
    try {
      final remoteData =
          await remoteDataSource.generateCSRConfirm(credentialId, sad);
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

  Future<Either<GenericException, SmartCAApiResponse>> getCertStatus(
      String uid, String identityId) async {
    try {
      final remoteData = await remoteDataSource.getCertStatus(uid, identityId);
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

  getJoinedServicePacks(String accessToken, String serial) async {
    try {
      final remoteData =
          await remoteDataSource.getJoinedServicePacks(accessToken, serial);
      if (remoteData.content != "") {
        JoinedServicePack resp = JoinedServicePack.fromMap(remoteData.content);
        return remoteData.code == 0
            ? Right(resp.remainingSign)
            : Left(
                GenericException(
                    error: ServerException(
                  message: remoteData.message,
                  code: remoteData.code,
                  codeDesc: remoteData.codeDesc,
                )),
              );
      } else {
        return const Right(0);
      }
    } catch (e, stackTrace) {
      return Left(GenericException(error: e, stack: stackTrace));
    }
  }

  Future<Either<GenericException, SmartCAApiResponse>> requestChangeDevice(
      String serial) async {
    try {
      final remoteData = await remoteDataSource.requestChangeDevice(serial);
      return [0, 60014].contains(remoteData.code)
          ? Right(remoteData)
          : Left(
              GenericException(
                error: ServerException(
                  message: remoteData.message,
                  code: remoteData.code,
                  codeDesc: remoteData.codeDesc,
                ),
              ),
            );
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, OrderCertModel>> getDetailOrder(
      String idCert) async {
    try {
      final remoteData = await remoteDataSource.getDetailOrder(idCert);
      OrderCertModel resp = OrderCertModel.fromJson(remoteData.content);
      return remoteData.code == 0
          ? Right(resp)
          : Left(
              GenericException(
                error: ServerException(
                  message: remoteData.message,
                  code: remoteData.code,
                  codeDesc: remoteData.codeDesc,
                ),
              ),
            );
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, SmartCAApiResponse>> getNumberSign(
      String idCert) async {
    try {
      final remoteData = await remoteDataSource.getNumberSign(idCert);
      // OrderCertModel resp = OrderCertModel.fromJson(remoteData.content);
      return remoteData.code == 0
          ? Right(remoteData)
          : Left(
              GenericException(
                error: ServerException(
                  message: remoteData.message,
                  code: remoteData.code,
                  codeDesc: remoteData.codeDesc,
                ),
              ),
            );
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, SmartCAApiResponse>> changeName(
      String idCert, String newName) async {
    try {
      final remoteData = await remoteDataSource.changeName(idCert, newName);
      // OrderCertModel resp = OrderCertModel.fromJson(remoteData.content);
      return remoteData.code == 0
          ? Right(remoteData)
          : Left(
              GenericException(
                error: ServerException(
                  message: remoteData.message,
                  code: remoteData.code,
                  codeDesc: remoteData.codeDesc,
                ),
              ),
            );
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, SmartCAApiResponse>> updateFCMToken(
      dynamic dataItems) async {
    try {
      final remoteData = await remoteDataSource.updateFCMToken(dataItems);
      return remoteData.code == 0
          ? Right(remoteData)
          : Left(
              GenericException(
                error: ServerException(
                  message: remoteData.message,
                  code: remoteData.code,
                  codeDesc: remoteData.codeDesc,
                ),
              ),
            );
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }
}
