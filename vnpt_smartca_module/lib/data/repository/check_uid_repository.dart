import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';

import '../../core/models/response/check_uid_response.dart';
import '../network/check_uid_api.dart';

class CheckUidRepository {
  final CheckUidApi remoteDataSource;

  CheckUidRepository(this.remoteDataSource);

  Future<Either<GenericException, CheckUidResponse>> checkUid(String identifier, String phone, String typeDocument) async {
    try {
      final remoteData = await remoteDataSource.checkUid(identifier, phone, typeDocument);
      return [0, 60000, 60001, 60002, 60003, 60013].contains(remoteData.code)
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
