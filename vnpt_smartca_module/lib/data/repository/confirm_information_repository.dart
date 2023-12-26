import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';

import '../../core/models/request/ekyc_result_model.dart';
import '../../core/models/response/check_uid_response.dart';
import '../network/confirm_information_api.dart';

class ConfirmInformationRepository {
  final ConfirmInformationApi remoteDataSource;

  ConfirmInformationRepository(this.remoteDataSource);

  Future<Either<GenericException, List<WardInformationModel>>> getAllAddress() async {
    try {
      final remoteData = await remoteDataSource.getAllAddress();
      final resp = List<WardInformationModel>.from(remoteData.content.map((x) => WardInformationModel.fromJson(x)));
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

  Future<Either<GenericException, bool>> register(EkycResponseModel ekycModel) async {
    try {
      final remoteData = await remoteDataSource.register(ekycModel);
      return remoteData.code == 0
          ? Right(true)
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

  // Future<Either<GenericException, bool>> verifyOTP(String phone, String uid, String otp) async {
  //   try {
  //     final remoteData = await remoteDataSource.verifyOTP(phone, uid, otp);
  //     return remoteData.code == 0
  //         ? Right(true)
  //         : Left(
  //       GenericException(
  //         error: ServerException(
  //           message: remoteData.message,
  //           code: remoteData.code,
  //           codeDesc: remoteData.codeDesc,
  //         ),
  //       ),
  //     );
  //   } catch (e, s) {
  //     return Left(GenericException(error: e, stack: s));
  //   }
  // }
}
