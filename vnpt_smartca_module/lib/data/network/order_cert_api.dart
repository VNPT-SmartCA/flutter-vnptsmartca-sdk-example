import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../configs/app_config.dart';
import '../../core/models/request/ekyc_customer.dart';
import '../../core/models/response/service_response.dart';
import '../../data/network/smartca_api_gateway.dart';

import '../../core/models/response/order_cert_model.dart';
import '../../core/models/response/user_address.dart';

@injectable
class OrderCertApi {
  final SmartCAApiGateway _httpClientService;

  OrderCertApi(this._httpClientService);

  Future<SmartCAApiResponse> createPersonalCertificateOrder(
      dynamic dataItems, String accessToken) async {
    // final url = '/${AppConfig.language}/order/PersonalCertificateOrder/createPersonalCertificateOrder';
    final url = '/${AppConfig.language}/order/certorder/create_cert_new_order';
    final result = await _httpClientService.post(url, dataItems);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getOrderInfo(dynamic dataItems) async {
    // final url = '/${AppConfig.language}/order/PersonalCertificateOrder/createPersonalCertificateOrder';
    final url = '/${AppConfig.language}/order/certorder/cert_order_info';
    final result = await _httpClientService.post(url, dataItems);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getOrderOTP(dynamic dataItems) async {
    // final url = '/${AppConfig.language}/order/PersonalCertificateOrder/createPersonalCertificateOrder';
    // final url = '/${AppConfig.language}/verify/otp/send_otp';
    const url = '/verify/otp/send_otp';
    final result = await _httpClientService.post(url, dataItems);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> verifyOTPAndActiveKeyPair(dynamic dataItems) async {
    // final url = '/${AppConfig.language}/order/PersonalCertificateOrder/createPersonalCertificateOrder';
    final url = '/${AppConfig.language}/ssa/sic/assign-with-otp';
    // final url = '/sic/assign-with-otp';
    final result = await _httpClientService.post(url, dataItems);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> verifyEkycWithOrderId(dynamic dataItems) async {
    // final url = '/${AppConfig.language}/order/PersonalCertificateOrder/createPersonalCertificateOrder';
    final url = '/${AppConfig.language}/order/certorder/verifyEkycCertOrder';
    final result = await _httpClientService.post(url, dataItems);
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getListOrder() async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/order/certorder/listCertOrder',
      {
        "page" : 1,
        "pageSize" : 10,
        "IsDesc" : true,
        "type": "0",
        "Statuses": [
          OrderCertModel.EKYC_WAITING,
          OrderCertModel.OTP_WAITING,
          OrderCertModel.PAYMENT_WATING,
          OrderCertModel.CONTRACT_CREATE_WAITING,
          OrderCertModel.CONTRACT_SIGN_WAITING,
          OrderCertModel.REQUESTCERT_WATING,
          OrderCertModel.ONEBSS_SUBMIT_WAITING,
          OrderCertModel.APPROVE_REQUEST_CERT_WAITING,
          OrderCertModel.KEY_ASSIGN_WATING,
          OrderCertModel.EKYC_ERROR,
          OrderCertModel.OTP_ERROR,
          OrderCertModel.PAYMENT_ERROR,
          OrderCertModel.CONTRACT_CREATE_ERROR,
          OrderCertModel.CONTRACT_SIGN_ERROR,
          OrderCertModel.REQUESTCERT_ERROR,
          OrderCertModel.ONEBSS_SUBMIT_ERROR,
          OrderCertModel.APPROVE_REQUEST_CERT_ERROR,
          OrderCertModel.REJECT_REQUEST_CERT,
          OrderCertModel.KEY_ASSIGN_ERROR,
          // OrderCertModel.CANCELED,
        ],
      },
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> updateMailPhone(Map<String, dynamic> map) async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/identityapi/userinfo/update_user_phone_and_email',
      map,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> getUserAddress() async {
    final result = await _httpClientService.post(
      '/${AppConfig.language}/order/certorder/get_user_address', {}
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> updateUserAddress(UserAddress userAddress) async {
    final result = await _httpClientService.post(
        '/${AppConfig.language}/identityapi/userinfo/update_user_address', {
      "provinceId": userAddress.provinceId,
      "districtId": userAddress.districtId,
      "wardId": userAddress.wardId,
      "streetName": userAddress.streetName,
      "address": userAddress.diaChi
    }
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> updateOrderAddress(String orderId) async {
    final result = await _httpClientService.post(
        '/${AppConfig.language}/order/certorder/updateOrderAddress', {
      "OrderId": orderId,
    }
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> verifyEkyc(EkycCustomerRequest param) async {
    String path =
        '/${AppConfig.language}/verify/ekyc/ekyc_customer';

 
    final formData = FormData.fromMap({
      'Uid': param.uid,
      'FullName': param.fullName,
      'NearPortrait':Platform.isIOS ?MultipartFile.fromBytes(param.nearPortrait,filename: 'nearPortrait.jpg'): await MultipartFile.fromFile(param.nearPortrait, filename: 'nearPortrait.jpg'),
      'FarPortrait': Platform.isIOS ? MultipartFile.fromBytes(param.farPortrait,filename: 'farPortrait.jpg'): await MultipartFile.fromFile(param.farPortrait, filename: 'farPortrait.jpg'),
      'IdFront': Platform.isIOS ? MultipartFile.fromBytes(param.idFront,filename: 'idFront.jpg'): await MultipartFile.fromFile(param.idFront, filename: 'idFront.jpg'),
      'IdBack': Platform.isIOS ? MultipartFile.fromBytes(param.idBack,filename: 'idBack.jpg'):await MultipartFile.fromFile(param.idBack, filename: 'idBack.jpg'),
      'IdFrontFull': Platform.isIOS ? MultipartFile.fromBytes(param.idFrontFull,filename: 'idFrontFull.jpg'):await MultipartFile.fromFile(param.idFrontFull, filename: 'idFrontFull.jpg'),
      'IdBackFull': Platform.isIOS ? MultipartFile.fromBytes(param.idBackFull,filename: 'idBackFull.jpg'):await MultipartFile.fromFile(param.idBackFull, filename: 'idBackFull.jpg'),
      'FaceVideo': await MultipartFile.fromFile(param.faceVideo),
      'OcrIdVideo': await MultipartFile.fromFile(param.ocrIdVideo),
      'DeviceId': param.deviceId
    });


    final result = await _httpClientService.post(
      path,
      formData,
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> createExtendOrder(String certSerial, String pricingCode) async {
    final result = await _httpClientService.post(
        '/${AppConfig.language}/order/certorder/create_cert_extend_order', {
      "serial": certSerial,
      "pricingCode": pricingCode
    }
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<SmartCAApiResponse> cancelOrder(String orderId) async {
    final result = await _httpClientService.post(
        '/${AppConfig.language}/order/certorder/cancel_order', {
        "orderId": orderId,
      }
    );
    return SmartCAApiResponse.fromMap(result);
  }

}