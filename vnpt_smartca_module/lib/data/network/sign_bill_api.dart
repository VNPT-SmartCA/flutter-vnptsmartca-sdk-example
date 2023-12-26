import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

@injectable
class SignBillApi {
  final SmartCAApiGateway _httpClientService;

  SignBillApi(this._httpClientService);

  getBill(String serial) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/order/certorder/getPhieuYeuCauThayDoiThongTin',
      {"Serial": serial, "Type": "html", "SignatureString": ""},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  saveSignatureImage(String serial, String base64Signature) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/order/certorder/getPhieuYeuCauThayDoiThongTin',
      {"Serial": serial, "Type": "pdf", "SignatureString": base64Signature},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  uploadOrderContract(String orderId, String base64Contract) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/order/certorder/upload_order_contract',
      {"OrderId": orderId, "Contract": base64Contract},
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
