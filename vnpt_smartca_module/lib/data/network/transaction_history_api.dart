import 'dart:convert';

import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/request/history_request_model.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

@injectable
class TransactionHistoryApi {
  final SmartCAApiGateway _httpClientService;

  TransactionHistoryApi(this._httpClientService);

  getTransactionHistory(HistoryRequestModel req) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/csc/signature/his',
      json.encoder.convert(req.toMap()),
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
