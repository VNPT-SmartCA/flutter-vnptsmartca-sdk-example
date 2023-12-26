import 'package:injectable/injectable.dart';

import '../core/models/app/eseal_api_config.dart';
import '../core/models/app/smartca_api_config.dart';

@dev
@Singleton(as: EsealApiConfig)
class EsealApiGWConfigDemo extends EsealApiConfig {
  final SmartCAApiConfig smartCAApiConfig;
  EsealApiGWConfigDemo(this.smartCAApiConfig) {
    clientId = smartCAApiConfig.clientId;
    clientSecret = smartCAApiConfig.clientSecret;
    gatewayUrl = "https://eseal-api.vnpt.vn/eseal/cms";
    signhashEsealUrl = 'https://eseal-api.vnpt.vn/csc/signature/signhash';
  }
}

@prod
@Singleton(as: EsealApiConfig)
class EsealApiGWConfigPro extends EsealApiConfig {
  final SmartCAApiConfig smartCAApiConfig;

  EsealApiGWConfigPro(this.smartCAApiConfig) {
    clientId = smartCAApiConfig.clientId;
    clientSecret = smartCAApiConfig.clientSecret;
    gatewayUrl = 'https://igwsca.vnpt.vn/eseal/cms';
    signhashEsealUrl = 'https://gwsca.vnpt.vn/esca/csc/signature/signhash';
  }
}
