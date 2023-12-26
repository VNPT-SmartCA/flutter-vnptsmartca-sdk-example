import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vnpt_smartca_module/method_channel_handler.dart';

import '../../configs/injector/injector.dart';
import '../../method_channel_handler.dart';
import '../models/app/econtract_api_config.dart';

class ContractService {
  final eContractApiGWConfig = getIt<EContractApiGWConfig>();
  final MethodChannel _channel =
      const MethodChannel('com.vnpt.smartca/econtract');
  final hostMethodChannelHandler = MethodChannelHandler();

  String? _accessToken;
  Map<String, dynamic>? data;

  ContractService() {
    configContract();
  }

  Future configContract() async {
    debugPrint("quannm activeEContract");
    getIt<MethodChannelHandler>().send(method: MethodChannelNames.activeEContract);

    data = {
      "tokenKey": eContractApiGWConfig.tokenKey,
      "tokenId": eContractApiGWConfig.tokenId,
      "domain": eContractApiGWConfig.domain,
      "access_token": _accessToken,
      "orderId": ""
    };

    debugPrint("quannm configContract");
    final result = await _channel.invokeMethod('configContract', data);
    return result;
  }

  Future<dynamic> signContract(String token, String orderId) async {
    try {
      data = {
        "tokenKey": eContractApiGWConfig.tokenKey,
        "tokenId": eContractApiGWConfig.tokenId,
        "domain": eContractApiGWConfig.domain,
        "access_token": token,
        "orderId": orderId
      };

      reloadConfig(data!);
      debugPrint("quannm showContract");
      var dataReturn = await _channel.invokeMethod('showContract', data);
      return dataReturn;
    } catch (e) {
      return null;
    }
  }

  Future reloadConfig(Map<String, dynamic> data) async {
    final result = await _channel.invokeMethod('configContract', data);
    return result;
  }
}
