import 'dart:convert';

import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/request/transaction_info_request.dart';
import '../../core/models/request/transaction_request_api_model.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

@injectable
class TransactionRequestApi {
  final SmartCAApiGateway _httpClientService;

  TransactionRequestApi(this._httpClientService);

  Future<SmartCAApiResponse> getTransactionRequests(TransactionRequestApiModel req) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/ssa/sic/waitingtrans',
      json.encoder.convert(req.toMap()),
    );
    return SmartCAApiResponse.fromMap(result);
  }

   Future<SmartCAApiResponse> getWaitingTransactionById(
    TransactionInfoRequest req,
  ) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/ssa/sic/waitingtraninfo',
      json.encoder.convert(req.toMap()),
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
