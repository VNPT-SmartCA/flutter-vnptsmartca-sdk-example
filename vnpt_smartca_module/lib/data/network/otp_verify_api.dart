import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

import '../../core/models/request/ekyc_result_model.dart';

@injectable
class OTPVerifyApi {
  final SmartCAApiGateway _httpClientService;

  OTPVerifyApi(this._httpClientService);

  verifyOTP(EkycResponseModel ekycModel) async {
    var param = {
      "Uid": ekycModel.ocrResult.id,
      "deviceId": ekycModel.deviceId,
      "otp": ekycModel.otp,
      "phone": ekycModel.phone,
    };
    final result = await _httpClientService.post(
      '/${AppConfig.language}/thirdpartyapi/register/verifyOTP',
      param,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  resendOTP(EkycResponseModel ekycModel) async {
    var param = {
      "uid": ekycModel.ocrResult.id,
      "deviceId": ekycModel.deviceId,
      "phone": ekycModel.phone,
    };
    final result = await _httpClientService.post(
      '/${AppConfig.language}/thirdpartyapi/register/sendOTP',
      param,
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
