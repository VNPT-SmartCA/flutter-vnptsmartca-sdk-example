import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vnpt_smartca_module/configs/injector/injector.dart';
import 'package:vnpt_smartca_module/method_channel_handler.dart';

import '../../configs/app_config.dart';
import '../../configs/injector/injector.dart';
import '../../method_channel_handler.dart';
import '../models/app/ekyc_method_names.dart';

class EKYCService {
  final MethodChannel _channel = const MethodChannel('com.vnpt.smartca/ekyc');
  final hostMethodChannelHandler = MethodChannelHandler();

  EKYCService() {
    _configeKYC();
  }

  Future _configeKYC() async {

    await hostMethodChannelHandler.send(method: MethodChannelNames.activeEKYC);

    final Map<String, dynamic> data = {
      "languageApplication": AppConfig.language,
      "sdTokenKey":
          "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAIh5XVTGSEMCmP+mclm1xx8J1mbySnIz9WKxaEcqccjH3NJJ9HfcD41xlvwggUzhMf0f7FGFl0y+ZI3aacrrytMCAwEAAQ==",
      "sdTokenId": "c3dacfba-2a50-f5a6-e053-604fc10a04cc",
      "sdAuthorization":
          "bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjZWEwOGQxMi1jNDUzLTExZWItYTg2NC0yMWViMjA5NjBkYjQiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoidHVwdkB2bnB0LnZuIiwic2NvcGUiOlsicmVhZCJdLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdCIsIm5hbWUiOiJ0dXB2QHZucHQudm4iLCJ1dWlkX2FjY291bnQiOiJjZWEwOGQxMi1jNDUzLTExZWItYTg2NC0yMWViMjA5NjBkYjQiLCJhdXRob3JpdGllcyI6WyJVU0VSIl0sImp0aSI6ImJlOGYwYjdjLTgyMDMtNDU4ZS1hNTAzLTllMTA0YmU0OTFkMSIsImNsaWVudF9pZCI6ImFkbWluYXBwIn0.31V1fDPUf5w1z4HPpzcMB-ewVgIYnYoUVPv9uKu__pqAtq7l52ma4XsLXbcwXJRxGOHbdzlglPecqge_taGnHTMd-tmxqXexQx_MMFkXWCDsh8WLbMKJdFuXsTJBHgxOC4PT-b9qSNuoBbYX77t69GUj_oONj9OGqvm5h8pxkAh8_tyjEwkl_DyAODRHbwBN9zYwvAJbe1V4IwhTFPO2YfhT3HGtKVeRyy_a-NsYkXB_u1OJhRA-3VCalpp4g-A8GKr7khmVVV6e03FUaiV9VBz-Bwoi2XJ3MkWTNU4zzH7wo3ku098qOzVlMv73I123hWhLbz2ZklppEVomX_52Ug"
    };
    debugPrint("quannm configeKYC");
    final result = await _channel.invokeMethod(EKYCMethods.configeKYC, data);
    return result;
  }

  Future<dynamic> eKYCFull() async {
    try {
      final Map<String, dynamic> data = {
        "languageApplication": AppConfig.language,
        "sdTokenKey":
            "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAIh5XVTGSEMCmP+mclm1xx8J1mbySnIz9WKxaEcqccjH3NJJ9HfcD41xlvwggUzhMf0f7FGFl0y+ZI3aacrrytMCAwEAAQ==",
        "sdTokenId": "c3dacfba-2a50-f5a6-e053-604fc10a04cc",
        "sdAuthorization":
            "bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjZWEwOGQxMi1jNDUzLTExZWItYTg2NC0yMWViMjA5NjBkYjQiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoidHVwdkB2bnB0LnZuIiwic2NvcGUiOlsicmVhZCJdLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdCIsIm5hbWUiOiJ0dXB2QHZucHQudm4iLCJ1dWlkX2FjY291bnQiOiJjZWEwOGQxMi1jNDUzLTExZWItYTg2NC0yMWViMjA5NjBkYjQiLCJhdXRob3JpdGllcyI6WyJVU0VSIl0sImp0aSI6ImJlOGYwYjdjLTgyMDMtNDU4ZS1hNTAzLTllMTA0YmU0OTFkMSIsImNsaWVudF9pZCI6ImFkbWluYXBwIn0.31V1fDPUf5w1z4HPpzcMB-ewVgIYnYoUVPv9uKu__pqAtq7l52ma4XsLXbcwXJRxGOHbdzlglPecqge_taGnHTMd-tmxqXexQx_MMFkXWCDsh8WLbMKJdFuXsTJBHgxOC4PT-b9qSNuoBbYX77t69GUj_oONj9OGqvm5h8pxkAh8_tyjEwkl_DyAODRHbwBN9zYwvAJbe1V4IwhTFPO2YfhT3HGtKVeRyy_a-NsYkXB_u1OJhRA-3VCalpp4g-A8GKr7khmVVV6e03FUaiV9VBz-Bwoi2XJ3MkWTNU4zzH7wo3ku098qOzVlMv73I123hWhLbz2ZklppEVomX_52Ug",
        "isVersion": "normal",
        "documentType": -1,
      };
      debugPrint("quannm eKYCFull");
      var dataReturn = await _channel.invokeMethod(EKYCMethods.eKYCFull, data);
      return dataReturn;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> ocrFrontAndBack() async {
    try {
      final Map<String, dynamic> data = {
        "languageApplication": AppConfig.language,
        "sdTokenKey":
            "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAIh5XVTGSEMCmP+mclm1xx8J1mbySnIz9WKxaEcqccjH3NJJ9HfcD41xlvwggUzhMf0f7FGFl0y+ZI3aacrrytMCAwEAAQ==",
        "sdTokenId": "c3dacfba-2a50-f5a6-e053-604fc10a04cc",
        "sdAuthorization":
            "bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjZWEwOGQxMi1jNDUzLTExZWItYTg2NC0yMWViMjA5NjBkYjQiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoidHVwdkB2bnB0LnZuIiwic2NvcGUiOlsicmVhZCJdLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdCIsIm5hbWUiOiJ0dXB2QHZucHQudm4iLCJ1dWlkX2FjY291bnQiOiJjZWEwOGQxMi1jNDUzLTExZWItYTg2NC0yMWViMjA5NjBkYjQiLCJhdXRob3JpdGllcyI6WyJVU0VSIl0sImp0aSI6ImJlOGYwYjdjLTgyMDMtNDU4ZS1hNTAzLTllMTA0YmU0OTFkMSIsImNsaWVudF9pZCI6ImFkbWluYXBwIn0.31V1fDPUf5w1z4HPpzcMB-ewVgIYnYoUVPv9uKu__pqAtq7l52ma4XsLXbcwXJRxGOHbdzlglPecqge_taGnHTMd-tmxqXexQx_MMFkXWCDsh8WLbMKJdFuXsTJBHgxOC4PT-b9qSNuoBbYX77t69GUj_oONj9OGqvm5h8pxkAh8_tyjEwkl_DyAODRHbwBN9zYwvAJbe1V4IwhTFPO2YfhT3HGtKVeRyy_a-NsYkXB_u1OJhRA-3VCalpp4g-A8GKr7khmVVV6e03FUaiV9VBz-Bwoi2XJ3MkWTNU4zzH7wo3ku098qOzVlMv73I123hWhLbz2ZklppEVomX_52Ug",
        "isVersion": "normal",
        "documentType": -1,
      };
      var dataReturn = await _channel.invokeMethod(EKYCMethods.ocrFrontAndBack, data);
      return dataReturn;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> compareFace() {
    final Map<String, dynamic> data = {
      "languageApplication": AppConfig.language,
      "isVersion": "normal",
    };
    return _channel.invokeMethod(EKYCMethods.compareFace, data);
  }

  Future<dynamic> verifyFace() {
    final Map<String, dynamic> data = {
      "languageApplication": AppConfig.language,
      "isVersion": "normal",
    };
    return _channel.invokeMethod(EKYCMethods.verifyFace, data);
  }
}
