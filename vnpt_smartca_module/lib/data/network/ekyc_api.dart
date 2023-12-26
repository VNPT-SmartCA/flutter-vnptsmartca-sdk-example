import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../data/network/smartca_api_gateway.dart';
import '../../configs/app_config.dart';
import '../../core/models/app/smartca_api_config.dart';
import '../../core/models/request/app_login_model.dart';
import '../../core/models/request/ekyc_customer.dart';
import '../../core/models/request/network_service_response.dart';
import '../../core/models/request/ptdtt_model.dart';
import '../../core/models/request/reactive_acc_by_email.dart';
import '../../core/models/request/reactive_ekyc_param.dart';
import '../../core/models/response/service_response.dart';
import 'package:http/http.dart' as http;

import '../../views/i18n/generated_locales/l10n.dart';
import '../../views/routes/app_pages.dart';
import '../../views/utils/global_key.dart';

@Injectable()
class EKycRemoteApi {
  late final SmartCAApiConfig _apiConfig;
  late final SmartCAApiGateway _httpClientService;

  EKycRemoteApi(
    this._apiConfig,
    this._httpClientService,
  );
  Future<SmartCAApiResponse> reactivateByCode(
      ReactiveAccByEmailParam param, String resourcePath) async {
    final formData = FormData.fromMap({
      'uid': param.uid,
      'reactivationCode': param.code,
      'idFront':
          MultipartFile.fromFileSync(param.idFront, filename: 'idFront.png'),
      'idBack':
          MultipartFile.fromFileSync(param.idBack, filename: 'idBack.png'),
      'phieuYeuCauThayDoiThongTin': MultipartFile.fromBytes(param.signature,
          filename: 'phieuYeuCauThayDoiThongTin.pdf'),
    });
    final result = await _httpClientService.post(
      resourcePath,
      formData,
      // options: Options(contentType: 'multipart/form-data'),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  @override
  Future<MappedNetworkServiceResponse<T>> eKycUserOnlineTT<T>(
      String resourcePath, EkycCustomerRequest param, int userType) async {
    Uri myUri = Uri.parse(resourcePath);

    var request = http.MultipartRequest("POST", myUri);
    request.fields["Uid"] = param.uid;

    if (Platform.isIOS) {
      if (param.idFront != null) {
        request.files.add(http.MultipartFile.fromBytes("IdFront", param.idFront,
            filename: 'idFront.jpg'));
      }

      if (param.idBack != null) {
        request.files.add(http.MultipartFile.fromBytes("IdBack", param.idBack,
            filename: 'idBack.jpg'));
      }

      if (param.idFrontFull != null) {
        request.files.add(await http.MultipartFile.fromBytes(
            "IdFrontFull", param.idFrontFull,
            filename: 'idFrontFull.jpg'));
      }

      if (param.idBackFull != null) {
        request.files.add(await http.MultipartFile.fromBytes(
            "IdBackFull", param.idBackFull,
            filename: 'idBackFull.jpg'));
      }

      request.files.add(await http.MultipartFile.fromBytes(
          "NearPortrait", param.nearPortrait,
          filename: 'nearPortrait.jpg'));

      request.files.add(await http.MultipartFile.fromBytes(
          'FarPortrait', param.farPortrait,
          filename: 'farPortrait.jpg'));

      request.files
          .add(await http.MultipartFile.fromPath('FaceVideo', param.faceVideo));

      request.files.add(
          await http.MultipartFile.fromPath('OcrIdVideo', param.ocrIdVideo));
    } else {
      if (param.idFront != null) {
        request.files
            .add(await http.MultipartFile.fromPath('IdFront', param.idFront));
      }

      if (param.idBack != null) {
        request.files
            .add(await http.MultipartFile.fromPath('IdBack', param.idBack));
      }

      if (param.idFrontFull != null) {
        request.files.add(await http.MultipartFile.fromPath(
            "IdFrontFull", param.idFrontFull,
            filename: 'idFrontFull.jpg'));
      }

      if (param.idBackFull != null) {
        request.files.add(await http.MultipartFile.fromPath(
            "IdBackFull", param.idBackFull,
            filename: 'idBackFull.jpg'));
      }

      request.files.add(await http.MultipartFile.fromPath(
          'NearPortrait', param.nearPortrait));

      request.files.add(
          await http.MultipartFile.fromPath('FarPortrait', param.farPortrait));

      request.files
          .add(await http.MultipartFile.fromPath('FaceVideo', param.faceVideo));

      request.files.add(
          await http.MultipartFile.fromPath('OcrIdVideo', param.ocrIdVideo));
    }
    //ENTERPRISE
    if (userType == 1) {
      for (var image in param.dkkdImages) {
        request.files
            .add(await http.MultipartFile.fromPath('DkkdImages', image.path));
      }
      request.files.add(await http.MultipartFile.fromPath(
          'DkkdVideo', param.dkkdVideo!.path));
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return processResponse<T>(response);
  }

  MappedNetworkServiceResponse<T> processResponse<T>(http.Response response) {
    if (!((response.statusCode != 200) || (response.body == null))) {
      var jsonResult = response.body;
      dynamic resultClass = jsonDecode(jsonResult);

      return MappedNetworkServiceResponse<T>(
        mappedResult: resultClass,
        networkServiceResponse: NetworkServiceResponse<T>(
          success: true,
          message: '',
        ),
      );
    } else if (response.statusCode == 401) {
      // timestamp = DateTime.now().microsecondsSinceEpoch;
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        AppRoutes.LOGIN,
        (route) => false,
      );
      return MappedNetworkServiceResponse<T>(
        mappedResult: null,
        networkServiceResponse: NetworkServiceResponse<T>(
          success: false,
          message: AppLocalizations.current.serviceExpireToken,
        ),
      );
    } else {
      String error = '';
      if (response.body != null) {
        var jsonResult = response.body;
        dynamic errorResponse = jsonDecode(jsonResult);
        var x = LoginErrorResponse.fromJson(errorResponse);
        error = x.message;
        if (error == null || error.isEmpty) {
          error = x.description;
        }

        if (error != null && error.isNotEmpty) {
          error = error.trim();
        }
        return MappedNetworkServiceResponse<T>(
          mappedResult: errorResponse,
          networkServiceResponse: NetworkServiceResponse<T>(
            success: true,
            message: '',
          ),
        );
      }
      return MappedNetworkServiceResponse<T>(
        networkServiceResponse: NetworkServiceResponse<T>(
          success: false,
          message: '''[${response.statusCode}] $error''',
        ),
      );
    }
  }

  @override
  Future<MappedNetworkServiceResponse<T>> postFileViaMedilaPath<T>(
    String resourcePath,
    ReactiveAccParam param,
  ) async {
    Uri myUri = Uri.parse(resourcePath);

    var request = http.MultipartRequest("POST", myUri);
    request.fields["uid"] = param.uid;
    if (param.type != null) {
      request.fields["type"] = param.type;
    }
    if (param.signature != null) {
      request.files.add(await http.MultipartFile.fromBytes(
          "signatureImage", param.signature,
          filename: 'file.png'));
    }

    if (Platform.isIOS) {
      request.files
          .add(await http.MultipartFile.fromBytes('idFront', param.idFront));
      request.files
          .add(await http.MultipartFile.fromBytes('idBack', param.idBack));
      if (param.nearPortrait != null) {
        request.files.add(await http.MultipartFile.fromBytes(
            'nearPortrait', param.nearPortrait));
      }
    } else {
      request.files.add(await http.MultipartFile.fromPath(
        'idFront',
        param.idFront,
      ));

      request.files.add(await http.MultipartFile.fromPath(
        'idBack',
        param.idBack,
      ));
      if (param.nearPortrait != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'nearPortrait',
          param.nearPortrait,
        ));
      }
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print(response);

    return processResponse<T>(response);
  }

  Future<SmartCAApiResponse> getPhieuThayDoiTT(
    GetPtdttParam param,
  ) async {
    var _path =
        '/${AppConfig.language}/identityapi/reactivation/getPhieuYeuCauThayDoiThongTin';

    final formData = FormData.fromMap({
      'uid': param.uid,
      'signatureImage':
          MultipartFile.fromBytes(param.signature, filename: 'file.png'),
    });

    final result = await _httpClientService.post(
      _path,
      formData,
      // options: Options(contentType: 'multipart/form-data'),
    );
    return SmartCAApiResponse.fromMap(result);
  }

  Future<NetworkServiceResponse<SmartCAApiResponse>> ekycReactive(
      ReactiveAccParam param) async {
    var _url =
        '${_apiConfig.gatewayUrl}/${AppConfig.language}/identityapi/user/ekyc_customer';
    var result = await postFileViaMedilaPath<SmartCAApiResponse>(_url, param);
    if (result == null) {
      return NetworkServiceResponse(
        success: false,
        message: result.networkServiceResponse.message,
      );
    }
    if (result.mappedResult != null) {
      if (result.mappedResult['code'] != 0) {
        return NetworkServiceResponse(
          success: false,
          message: result.mappedResult['message'],
        );
      } else {
        return NetworkServiceResponse(
          content: result.networkServiceResponse.content,
          success: result.networkServiceResponse.success,
          message: result.mappedResult['message'],
        );
      }
    }
    return NetworkServiceResponse(
        success: result.networkServiceResponse.success,
        message: result.networkServiceResponse.message);
  }
}
