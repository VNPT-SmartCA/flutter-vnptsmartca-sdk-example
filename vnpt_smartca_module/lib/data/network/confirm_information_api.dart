import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

import '../../core/models/request/ekyc_result_model.dart';

@injectable
class ConfirmInformationApi {
  final SmartCAApiGateway _httpClientService;

  ConfirmInformationApi(this._httpClientService);

  getAllAddress() async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/thirdpartyapi/category/getAllWards',
      null,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  register(EkycResponseModel ekycModel) async {
    // var deviceInfo = await _deviceInfoService.getDeviceInfo();
    var address = {
      "provinceId": ekycModel.ocrResult.cityId,
      "districtId": ekycModel.ocrResult.districtId,
      "wardId": ekycModel.ocrResult.wardId,
      "streetName": ekycModel.ocrResult.street,
      "address": "",
    };
    var param = {
      "Uid": ekycModel.ocrResult.id,
      "deviceId": ekycModel.deviceId,
      "ekycCode": ekycModel.ekycCode,
      "otp": ekycModel.otp,
      "password": ekycModel.password,
      "email": ekycModel.email,
      "fullName": ekycModel.ocrResult.name,
      "loaiGiayTo": ekycModel.loaiGiayTo,
      "phone": ekycModel.phone,
      "ngayCap": ekycModel.ocrResult.issueDate,
      "noiCap": ekycModel.ocrResult.issuePlace,
      "notAllowReceivedAds": ekycModel.notAllowReceivedAds,
      "address": address,
    };
    final result = await _httpClientService.post(
      '/${AppConfig.language}/thirdpartyapi/register/register',
      param,
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
