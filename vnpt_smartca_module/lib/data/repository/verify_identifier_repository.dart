import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';

import '../../core/models/response/user_status_model.dart';
import '../network/verify_identifier_api.dart';

class VerifyIdentifierRepository {
  final VerifyIdentifierApi remoteDataSource;

  VerifyIdentifierRepository(this.remoteDataSource);

  Future<Either<GenericException, UserStatusModel>> checkUserStatus(String identifier) async {
    try {
      final remoteData = await remoteDataSource.checkUserStatus(identifier);
      final resp = UserStatusModel.fromJson(remoteData.content);
      return remoteData.code == 0
          ? Right(resp)
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
