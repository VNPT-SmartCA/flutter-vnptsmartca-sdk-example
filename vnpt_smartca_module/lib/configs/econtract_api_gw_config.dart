import 'package:injectable/injectable.dart';

import '../core/models/app/econtract_api_config.dart';

@dev
@Singleton(as: EContractApiGWConfig)
class EContractApiGWConfigDemo extends EContractApiGWConfig {
  EContractApiGWConfigDemo() {
    tokenKey =
        "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCY/AeDrgdONvTOucWbnGGX5ZqgCQI/GHxXaGyNk93/QxdzTU1xJqcM0qpE5oJ+brVyYTG+vnjqr4SqfxNky+ze2ck0q5NHn4cOJHNkeqqW7TQf8ctGuWBbUWHsjJdXfV7/Z20RE2A4QUqP6EKL/fdf8ZPOT4g8ey8JdksJe/f8WQIDAQAB";
    tokenId = "893eb5c0-2653-463b-b23b-795163af7446";
    domain = "https://econtract-api-demo.vnptit3.vn";
    clientId = "smart-ca.client@econtract.vnpt.vn";
    clientSecret = "Abc@12345";
  }
}

@prod
@Singleton(as: EContractApiGWConfig)
class EContractApiGWConfigPro extends EContractApiGWConfig {
  EContractApiGWConfigPro() {
    tokenKey =
        "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCY/AeDrgdONvTOucWbnGGX5ZqgCQI/GHxXaGyNk93/QxdzTU1xJqcM0qpE5oJ+brVyYTG+vnjqr4SqfxNky+ze2ck0q5NHn4cOJHNkeqqW7TQf8ctGuWBbUWHsjJdXfV7/Z20RE2A4QUqP6EKL/fdf8ZPOT4g8ey8JdksJe/f8WQIDAQAB";
    tokenId = "893eb5c0-2653-463b-b23b-795163af7446";
    domain = "https://api-hopdong.vnpt.vn";
    clientId = "smart-ca.client@econtract.vnpt.vn";
    clientSecret = "WZGK9h6kN6V0l42ytcJ6f73UQhjegVyy";
  }
}
