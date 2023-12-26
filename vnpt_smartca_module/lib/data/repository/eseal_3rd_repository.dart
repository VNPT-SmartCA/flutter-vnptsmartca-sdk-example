import '../../../data/network/eseal/3rd_eseal_api.dart';

class Eseal3rdRepository {
  final ThirdPartyApiEseal eseal3rdApi;

  Eseal3rdRepository(this.eseal3rdApi);

  // Future<Either<GenericException, SmartCAApiResponse>> get3rdLinks() async {
  //   try {

  //     }

  //     return Right(TokenModel.fromJson(localDataStr));
  //   } catch (e, s) {
  //     return Left(GenericException(error: e, stack: s));
  //   }
}
