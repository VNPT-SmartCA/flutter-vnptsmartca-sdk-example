import 'package:injectable/injectable.dart';

import '../core/models/app/smartca_api_config.dart';

@dev
@Singleton(as: SmartCAApiConfig)
class SmartCAApiGWConfigDemo extends SmartCAApiConfig {
  SmartCAApiGWConfigDemo() {
    clientSecret = 'NGNhMzdmOGE-OGM2Mi00MTg0';
    gatewayUrl = 'https://rmgateway-mobile.vnptit.vn';
    clientId = '4185-637127995547330633.apps.signserviceapi.com';
  }
}

@prod
@Singleton(as: SmartCAApiConfig)
class SmartCAApiGWConfigPro extends SmartCAApiConfig {
  SmartCAApiGWConfigPro() {
    clientSecret = 'OTk1NjZlYWY-ZWVhMC00YzZh';
    gatewayUrl = 'https://gwsca-mobile.vnpt.vn';
    clientId = '4c6a-637932338278807354.apps.smartcaapi.com';
  }
}
