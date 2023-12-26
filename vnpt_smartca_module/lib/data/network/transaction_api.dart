import 'dart:convert';

import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/request/confirm_wt_req.dart';
import '../../core/models/request/reject_wt_req.dart';
import '../../core/models/request/request_params_to_sign.dart';
import '../../core/models/request/waiting_tran_req_model.dart';
import '../../core/models/request/waiting_trans_req_model.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

@injectable
class TransactionApi {
  final SmartCAApiGateway _httpClientService;

  TransactionApi(this._httpClientService);

  Future<SmartCAApiResponse> getWaitingTransactionById(
    WaitingTransactionRequest req,
  ) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/ssa/sic/waitingtraninfo',
      json.encoder.convert(req.toMap()),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> confirmWaitingTransaction(
    ConfirmWTRequest confirmReq,
  ) async {
    final result = await _httpClientService.post(
        '/${AppConfig.language}/ssa/sic/signconfirm',
        json.encoder.convert(confirmReq.toMap()));
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> rejectWaitingTransaction(
    RejectWTRequest rejectReq,
  ) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/ssa/sic/signreject',
      json.encoder.convert(rejectReq.toMap()),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getWaitingTransactions(
      WaitingTransactionListRequest req) async {
    final result = await _httpClientService.post(
        '/${AppConfig.language}/ssa/sic/waitingtrans', req.toMap());
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getTransInfor(String tranID) async {
    final result = await _httpClientService.post(
        '/${AppConfig.language}/csc/credentials/gettraninfo',
        {'tranId': tranID});
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> signMutiple(
    RequestSignParams req,
  ) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/csc/signature/sign',
      json.encoder.convert(req.toMap()),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getSignatureItemTemplates(String accessToken) async {
    final result = await _httpClientService.post(
        '/${AppConfig.language}/csc/credentials/load_sig_temp', accessToken);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> addSigTemplates(
    dynamic params,
  ) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/csc/credentials/add_sig_temp',
      json.encoder.convert(params),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> removeSigTemplate(
    String key,
  ) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/csc/credentials/remove_sig_temp',
      json.encoder.convert({"key": key}),
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
