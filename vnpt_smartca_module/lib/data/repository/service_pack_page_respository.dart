import 'package:dartz/dartz.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/response/order.dart';
import '../../../core/models/response/service_pack_model.dart';
import '../../../data/network/service_pack_api.dart';
import '../../../views/i18n/generated_locales/l10n.dart';

class ServicePackRepository {
  final ServicePackApi remoteDataSource;

  ServicePackRepository(this.remoteDataSource);

  getServicePacks(String accessToken) async {
    try {
      final remoteData = await remoteDataSource.getServicePacks(accessToken);
      List<ServicePackModel> resp = List.from(remoteData.content.map((x) => ServicePackModel.fromJson(x)));

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

  // ignore: long-method
  createServicePackOrder(ServicePackModel packModel, String referralCode) async {
    var refId = '';
    var refUrl = '';
    try {
      final List<DataItems> carts = [];

      DataItems dataItems = DataItems(
        id: packModel.id ?? "",
        quantity: 1,
        signTurnNumber: packModel.signTurnNumber,
      );

      //    priceType = 1: số lượt ký min = 50 và cho phép thay đổi số lượng
      //    priceType = 0: không cho phép thay đổi số lượng
      if (packModel.priceType == 0) {
        dataItems.signTurnNumber = 0;
      }

      carts.add(dataItems);

      if (carts.isEmpty) {
        return Left(GenericException(
          error: ServerException(
            message: AppLocalizations.current.create_order_no_data_selected,
            code: -1,
            codeDesc: AppLocalizations.current.create_order_no_data_selected,
          ),
        ));
      }

      var params = {"Items": carts, "RaCode": referralCode};

      var result = await remoteDataSource.createServicePackOrder(params);

      if (result.content == null || result.code != 0) {
        return Left(GenericException(
          error: ServerException(
            message: result?.message,
            code: -1,
            codeDesc: result.codeDesc,
          ),
        ));
      } else {
        if (result.content != null) {
          refId = result.content["id"];
          //Gọi hàm tích hợp thanh toán
          result = await remoteDataSource.initSignOrderTransaction(refId);

          if (result.content == null || result.code != 0) {
            String m = result?.message;
            return Left(GenericException(
              error: ServerException(
                message: m,
                code: -1,
                codeDesc: result.codeDesc,
              ),
            ));
          } else {
            if (result.content != null) {
              //Thành công hiển thị webview
              refUrl = result.content;
              return Right(refUrl);
            } else {
              return Left(GenericException(
                error: ServerException(
                  message: AppLocalizations.current.service_pack_payment_failed,
                  code: -1,
                  codeDesc: result.codeDesc,
                ),
              ));
            }
          }
        } else {
          return Left(GenericException(
            error: ServerException(
              message: AppLocalizations.current.service_pack_create_order_failed,
              code: -1,
              codeDesc: result.codeDesc,
            ),
          ));
        }
      }
    } catch (e, s) {
      return Left(GenericException(error: e, stack: s));
    }
  }

  checkOrderPaymentResult(String id, String responseCode, String secureCode) async {
    try {
      final remoteData = await remoteDataSource.checkOrderPaymentResult(id, responseCode, secureCode);

      return remoteData.code == 0
          ? Right(remoteData?.message)
          : Left(GenericException(
              error: ServerException(
              message: remoteData.message,
              code: remoteData.code,
              codeDesc: remoteData.codeDesc,
            )));
    } catch (e, stackTrace) {
      return Left(GenericException(error: e, stack: stackTrace));
    }
  }
}
