import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

@injectable
class CertApi {
  final SmartCAApiGateway httpClientService;
  CertApi(this.httpClientService);

  Future<SmartCAApiResponse> getCertificate() async {
    // final result = await httpClientService.post(
    //   '/${AppConfig.language}/ssa/sic/list',
    //   {},
    // );
    final result = await httpClientService.post(
      '/${AppConfig.language}/certcms/cert/list',
      {"FieldName": "createdDate", "IsDesc": true},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> initializeKey(dynamic dataItems) async {
    // var req = {'credentialId': credentialId, 'sad': sad};

    final result = await httpClientService.post(
      '/${AppConfig.language}/ssa/sic/assign-with-otp',
      dataItems,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> generateCSRConfirm(
      String credentialId, String sad) async {
    var req = {'credentialId': credentialId, 'sad': sad};
    final result = await httpClientService.post(
      '/${AppConfig.language}/ssa/sic/csr',
      req,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getCertStatus(
      String uid, String identityId) async {
    final path = '/${AppConfig.language}/ssa/requestcert/getStatus';
    var p = {'Uid': uid, 'identityId': identityId};

    var result = await httpClientService.post(
      path,
      p,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getJoinedServicePacks(
      String accessToken, String serial) async {
    final result = await httpClientService.post(
      '/${AppConfig.language}/csc/servicepack/getPersonalServicePack',
      {'accessToken': accessToken, "SerialNumber": serial},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> requestChangeDevice(String serial) async {
    final result = await httpClientService.post(
      '/${AppConfig.language}/order/certorder/create_cert_change_device_order',
      {'serial': serial},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getDetailOrder(String idCert) async {
    final result = await httpClientService.post(
      '/${AppConfig.language}/order/certorder/cert_order_by_credential',
      {'CredentialId': idCert},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> changeName(String idCert, String newName) async {
    final result = await httpClientService.post(
      '/${AppConfig.language}/certcms/cert/updateRefName',
      {"refName": newName, "credentialId": idCert},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getNumberSign(String idCert) async {
    final result = await httpClientService.post(
      '/${AppConfig.language}/certcms/servicePack/getCredentialServicePack',
      {'CredentialId': idCert},
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> updateFCMToken(dynamic dataItems) async {
    final result = await httpClientService.post(
      '/${AppConfig.language}/certcms/cert/update_fcmToken',
      dataItems,
    );
    return SmartCAApiResponse.fromMap(result);
  }
}
