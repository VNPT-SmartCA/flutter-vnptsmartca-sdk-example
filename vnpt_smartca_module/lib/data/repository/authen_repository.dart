// ignore_for_file: unused_catch_clause, constant_identifier_names
import 'package:dartz/dartz.dart';
import '../../../core/models/request/change_password.dart';
import '../../../core/models/response/user_status.dart';

import '../../core/models/app/exceptions.dart';
import '../../core/models/request/get_user_status.dart';
import '../../core/models/request/login.dart';
import '../../core/models/response/token_model.dart';
import '../../core/services/secure_local_storage.dart';
import '../../core/utils/constants.dart';
import '../network/auth_api.dart';

class AuthenRepository {
  final AuthRemoteApi remoteDataSource;
  final SecureLocalStorageService secureLocalDataSource;

  AuthenRepository(
    this.remoteDataSource,
    this.secureLocalDataSource,
  );

  Future<Either<GenericException, TokenModel>> getAccessToken(LoginRequestModel userLogin) async {
    try {
      TokenModel remoteData = await remoteDataSource.getAccessToken(userLogin);
      // Cache Token, Username, Password
      await secureLocalDataSource.saveData(LOCAL_ACCESS_TOKEN_AUTH, remoteData.toJson());
      await secureLocalDataSource.saveData(USERNAME_KEY, userLogin.username);
      await secureLocalDataSource.saveData(PASSWORD_KEY, userLogin.password);
      return Right(remoteData);
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future logout() async {
    await secureLocalDataSource.removeData(LOCAL_ACCESS_TOKEN_AUTH);
    await secureLocalDataSource.removeData(USERNAME_KEY);
    await secureLocalDataSource.removeData(PASSWORD_KEY);
    await secureLocalDataSource.removeData(FULLNAME_KEY);
    await secureLocalDataSource.removeData(PHONE_NUMBER);
  }

  Future<Either<GenericException, TokenModel>> getLocalAccessToken() async {
    try {
      final localDataStr = await secureLocalDataSource.getLastData(LOCAL_ACCESS_TOKEN_AUTH);

      if (localDataStr == null) {
        return Left(GenericException(error: NotFoundException()));
      }

      return Right(TokenModel.fromJson(localDataStr));
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, LoginRequestModel>> getUsernamePasswordLocal() async {
    try {
      final username = await secureLocalDataSource.getLastData(USERNAME_KEY);
      final password = await secureLocalDataSource.getLastData(PASSWORD_KEY);

      if (username == null || password == null) {
        return Left(GenericException(error: NotFoundException()));
      }

      final loginRequestModel = LoginRequestModel(username, password);
      return Right(loginRequestModel);
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, TokenModel>> refreshToken() async {
    try {
      final tokenOrFailure = await getUsernamePasswordLocal();

      return tokenOrFailure.fold((fail) => Left(GenericException(error: NotFoundException())), (acc) async {
        try {
          TokenModel remoteData = await remoteDataSource.getAccessToken(LoginRequestModel(acc.username, acc.password));
          // Cache Token
          await secureLocalDataSource.saveData(LOCAL_ACCESS_TOKEN_AUTH, remoteData.toJson());

          return Right(remoteData);
        } catch (e, s) {
          return Left(GenericException(error: e, stack: s));
        }
      });
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  Future<Either<GenericException, UserStatus>> getUserStatus(String uid) async {
    try {
      var req = UserStatusRequest(uid: uid);
      final remoteData = await remoteDataSource.getUserStatus(req);
      if (remoteData.content != null && remoteData.code == 0) {
        var userStatus = UserStatus.fromJson(remoteData.content);
        secureLocalDataSource.saveData(ACCOUNT_TYPE, userStatus.accountTypeDesc);
        return Right(userStatus);
      } else {
        return Left(GenericException(
          error: ServerException(
            message: remoteData.message,
            code: remoteData.code,
            codeDesc: remoteData.codeDesc,
          ),
        ));
      }
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  checkExistedPartner(String clientId) async {
    try {
      final remoteData = await remoteDataSource.checkExistedPartner(clientId);
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

  changePassword(String accessToken, ChangePasswordRequest param) async {
    try {
      final remoteData = await remoteDataSource.changePassword(accessToken, param);
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

  sendOTP(String citizenId, String phoneNumber) async {
    try {
      final remoteData = await remoteDataSource.sentOTP(citizenId, phoneNumber);
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

  verifyOTP(String citizenId, String phoneNumber, String otp) async {
    try {
      final remoteData = await remoteDataSource.verifyOTP(citizenId, phoneNumber, otp);
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
