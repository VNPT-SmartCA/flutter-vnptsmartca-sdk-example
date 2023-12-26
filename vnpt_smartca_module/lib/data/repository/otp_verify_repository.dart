import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../data/network/otp_verify_api.dart';

import '../../core/models/request/ekyc_result_model.dart';

class OTPVerifyRepository {
  final OTPVerifyApi remoteDataSource;

  OTPVerifyRepository(this.remoteDataSource);

  Future<Either<GenericException, bool>> verifyOTP(EkycResponseModel ekycModel) async {
    try {
      final remoteData = await remoteDataSource.verifyOTP(ekycModel);
      return remoteData.code == 0
          ? const Right(true)
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

  Future<Either<GenericException, bool>> resendOTP(EkycResponseModel ekycModel) async {
    try {
      final remoteData = await remoteDataSource.resendOTP(ekycModel);
      return remoteData.code == 0
          ? const Right(true)
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
