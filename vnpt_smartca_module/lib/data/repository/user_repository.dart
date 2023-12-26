import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/request/change_password_request_model.dart';
import '../../../core/models/request/get_user_status.dart';
import '../../../core/models/response/profile_model.dart';
import '../../../core/models/response/service_response.dart';
import '../../../core/models/response/token_model.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../core/utils/constants.dart';
import '../../../data/network/auth_api.dart';

class UserRepository {
  final AuthRemoteApi remoteDataSource;
  final SecureLocalStorageService secureLocalDataSource;

  UserRepository(this.remoteDataSource, this.secureLocalDataSource);

  Future<Either<GenericException, ProfileModel>> getProfile() async {
    try {
      SmartCAApiResponse remoteData = await remoteDataSource.getProfile();
      ProfileModel profileModel = ProfileModel.fromJson(remoteData.content);
      // cache full name, phone
      await secureLocalDataSource.saveData(FULLNAME_KEY, profileModel.fullName);
      await secureLocalDataSource.saveData(PHONE_NUMBER, profileModel.phone);
      await secureLocalDataSource.saveData(
          LOCAL_USER_PROFILE, json.encode(profileModel));
      return Right(profileModel);
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<String?> getLocalFullName() async {
    try {
      final fullName = await secureLocalDataSource.getLastData(FULLNAME_KEY);
      return fullName;
    } catch (e, s) {
      return null;
    }
  }

  getUserStatus(UserStatusRequest req) async {
    try {
      final remoteData = await remoteDataSource.getUserStatus(req);
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

  Future<Either<GenericException, TokenModel>> changePassword(
      // ignore: avoid-unused-parameters
      String accessToken,
      ChangePasswordRequestModel param) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}
