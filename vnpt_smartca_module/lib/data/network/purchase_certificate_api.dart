
import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

@injectable
class PurchaseCertificateApi  {
  final SmartCAApiGateway _httpClientService;

  PurchaseCertificateApi(this._httpClientService);

  getCertificatePacks(String accessToken) async {
    final url = '/${AppConfig.language}/identityapi/pricing/list_onsale';
    final result = await _httpClientService.post(url, {'accessToken': accessToken},);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> createPersonalCertificateOrder(
      dynamic dataItems, String accessToken) async {
    // final url = '/${AppConfig.language}/order/PersonalCertificateOrder/createPersonalCertificateOrder';
    final url = '/${AppConfig.language}/order/certorder/create_cert_new_order';
    final result = await _httpClientService.post(url, dataItems);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> initPersonalCertificateOrderTransaction(
      String id, String accessToken) async {
    final url = '/${AppConfig.language}/order/PersonalCertificateOrder/initPersonalCertificateOrderTransaction';
    final result = await _httpClientService.post(url, {"id": id});
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> initPersonalCertificateOrderTransactionV2(
      String id, String maGt) async {
    final url = '/${AppConfig.language}/order/certorder/initCertOrderPayment';
    final result = await _httpClientService.post(url, {"id": id, "MaGt": maGt});
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> checkOrderPaymentResult(
      String accessToken,
      String id,
      String responseCode,
      String secureCode, String localityCode) async {

    final url = '/${AppConfig.language}/order/payment/checkOrderPaymentResultAnonymous';
    final result = await _httpClientService.post(url, {"id": id, "ResponseCode": responseCode, "SecureCode": secureCode, 'localityCode': localityCode});
    return SmartCAApiResponse.fromMap(result);
  }

  getProvinces(String accessToken) async {
    final url = '/${AppConfig.language}/thirdpartyapi/category/getProvince';
    final result = await _httpClientService.post(url, {'accessToken': accessToken},);
    return SmartCAApiResponse.fromMap(result);
  }

  getDistricts(String provinceId, String accessToken) async {
    final url = '/${AppConfig.language}/thirdpartyapi/category/getDistrict';
    final result = await _httpClientService.post(url, {'provinceId': provinceId},);
    return SmartCAApiResponse.fromMap(result);
  }

  getWards(String provinceId, String districtId, String accessToken) async {
    final url = '/${AppConfig.language}/thirdpartyapi/category/getWards';
    final result = await _httpClientService.post(url, {'provinceId': provinceId, 'districtId': districtId},);
    return SmartCAApiResponse.fromMap(result);
  }
}
