import 'package:get/get_connect/http/src/response/response.dart';

import '../../configs/app_config.dart';
import '../../core/models/request/error_handler_param.dart';
import 'smartca_api_gateway.dart';

class SendLogAPI {
  final SmartCAApiGateway _smartCAApiGateway;

  SendLogAPI(this._smartCAApiGateway);

  Future<dynamic> sendErrorLog(SendLogRequest req) async {
    final result = await _smartCAApiGateway.post(
      '/${AppConfig.language}/cmsapi/devicelog/create_log',
      req,
    );
    return result;
  }
}
