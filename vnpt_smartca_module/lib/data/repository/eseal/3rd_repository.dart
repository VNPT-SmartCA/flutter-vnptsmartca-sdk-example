import 'package:dartz/dartz.dart';

import '../../../core/models/app/exceptions.dart';
import '../../../core/models/response/link_system_response.dart';
import '../../../core/models/response/service_response.dart';
import '../../network/eseal/3rd_eseal_api.dart';

class ThirdPartyRepositoryEseal {
  final ThirdPartyApiEseal remoteDataSource;

  ThirdPartyRepositoryEseal(this.remoteDataSource);

  Future<Either<GenericException, LinkSystemResponse>> get3rdLinks(String idCert) async {
    try {
      final remoteData = await remoteDataSource.get3rdLinks(idCert);
      return remoteData.code == 0
          ? Right(LinkSystemResponse.fromJson(remoteData.content))
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

  Future<Either<GenericException, SmartCAApiResponse>> requestDelete3rdLink(String idLink) async {
    try {
      final remoteData = await remoteDataSource.requestDelete3rdLink(idLink);

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

  Future<Either<GenericException, SmartCAApiResponse>> reLink3rd(String idLink, String totp) async {
    try {
      final remoteData = await remoteDataSource.reLink3rd(idLink, totp);

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

  Future<Either<GenericException, LinkSystemModel>> set3rdLinkMode(String idLink, bool permanent, String totp) async {
    try {
      final remoteData = await remoteDataSource.set3rdLinkMode(idLink, permanent, totp);

      return remoteData.code == 0
          ? Right(LinkSystemModel.fromJson(remoteData.content))
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

  Future<Either<GenericException, LinkSystemModel>> configLifeTime3rdLink(String idLink, int time, String totp) async {
    try {
      final remoteData = await remoteDataSource.configLifeTime3rdLink(idLink, time, totp);

      return remoteData.code == 0
          ? Right(LinkSystemModel.fromJson(remoteData.content))
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

  Future<Either<GenericException, LinkSystemModel>> pauseLifeTime3rdLink(
      String idLink, bool isPause, String totp) async {
    try {
      final remoteData = await remoteDataSource.pauseLifeTime3rdLink(idLink, isPause, totp);

      return remoteData.code == 0
          ? Right(LinkSystemModel.fromJson(remoteData.content))
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

  Future<Either<GenericException, SmartCAApiResponse>> confirmLink3rd(dynamic reqSign) async {
    try {
      final remoteData = await remoteDataSource.confirmLink3rd(reqSign);

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

  Future<Either<GenericException, SmartCAApiResponse>> confirmDelete3rdLink(dynamic reqSign) async {
    try {
      final remoteData = await remoteDataSource.confirmDelete3rdLink(reqSign);

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
