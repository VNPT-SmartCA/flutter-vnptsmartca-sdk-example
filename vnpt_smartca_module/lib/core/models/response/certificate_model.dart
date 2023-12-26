import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/utils/enums.dart';
import '../../../views/widgets/app_refresh.dart';
import '../../extensions/datetime_format.dart';
import 'number_sign_model.dart';

enum SignType { period, turn }

class CertificateModel extends AppRefreshModel {
  String id;
  String? reqCertId;
  int? status;
  String? statusDescription;
  String? accountEmail;
  int? certType;
  String? subjectDN;
  String? issuer;
  String? validFrom;
  String? validTo;
  String? timeCreateRequest;
  String? timeCreateWorker;
  String? signatureAlg;
  int? keyLength;
  String? serial;
  int? certStatus;
  String? certStatusDesc;
  CertProfile? certProfile;
  Device? device;
  OrderInfo? orderInfo;
  NumberSignModel? servicePack;
  String? refName;

  /// = 1 là loại lượt ký
  int? signType;

  CertificateModel(
      {required this.id,
      this.reqCertId,
      this.status,
      this.statusDescription,
      this.accountEmail,
      this.certType,
      this.subjectDN,
      this.issuer,
      this.validFrom,
      this.validTo,
      this.timeCreateRequest,
      this.timeCreateWorker,
      this.signatureAlg,
      this.keyLength,
      this.serial,
      this.certStatus,
      this.certStatusDesc,
      this.certProfile,
      this.device,
      this.signType,
      this.orderInfo,
      this.servicePack,
      this.refName})
      : super(id);

  // "            [Description(""Chờ sinh cặp khóa"")]
  // WAITING_GENERATE_KEYPAIR = 1,
  // [Description(""Chờ người dùng kích hoạt"")]
  // WAITING_ASSIGNED_TO_SIGNER = 2,
  // [Description(""Chờ cấp chứng thư số"")]
  // WAITING_GENERATE_CERTIFICATE = 3,
  // [Description(""Đang hoạt động"")]
  // VALID = 0,
  //
  // [Description(""Hết hạn"")]
  // EXPIRED = 4,
  // [Description(""Đã thu hồi"")]
  // REVOKED = 5,
  // [Description(""Đang tạm dừng"")]
  // SUSPENDED = 6,
  // [Description(""Chờ ký biên bản nghiệm thu"")]
  // WAITING_SIGN_ACCEPTANCE = 7,
  // [Description(""Ký BBNT lỗi, chữ ký không hợp lệ"")]
  // SIGN_ACCEPTANCE_FAILED = 8,
  // [Description(""Chờ đồng bộ biên bản nghiệm thu"")]
  // WAITING_SYNC_ACCEPTANCE = 9,
  // [Description(""Đồng bộ biên bản nghiệm thu không thành công"")]
  // SYNC_ACCEPTANCE_FAILED = 10,
  // [Description(""Chờ duyệt"")]
  // WAITING_APPROVE = 11,"

  StatusCertEnum? get typeStatus {
    switch (status) {
      case 0:
        return StatusCertEnum.VALID;
      case 1:
        return StatusCertEnum.WAITING_GENERATE_KEYPAIR;
      case 2:
        return StatusCertEnum.WAITING_ASSIGNED_TO_SIGNER;
      case 3:
        return StatusCertEnum.WAITING_GENERATE_CERTIFICATE;
      case 4:
        return StatusCertEnum.EXPIRED;
      case 5:
        return StatusCertEnum.REVOKED;
      case 6:
        return StatusCertEnum.SUSPENDED;
      case 7:
        return StatusCertEnum.WAITING_SIGN_ACCEPTANCE;
      case 8:
        return StatusCertEnum.SIGN_ACCEPTANCE_FAILED;
      case 9:
        return StatusCertEnum.WAITING_SYNC_ACCEPTANCE;
      case 10:
        return StatusCertEnum.SYNC_ACCEPTANCE_FAILED;
      case 11:
        return StatusCertEnum.WAITING_APPROVE;
    }
    return null;
  }

  canShowMaDonHang() {
    return [
      StatusCertEnum.WAITING_GENERATE_KEYPAIR,
      StatusCertEnum.WAITING_ASSIGNED_TO_SIGNER,
      StatusCertEnum.WAITING_GENERATE_CERTIFICATE,
      StatusCertEnum.WAITING_APPROVE
    ].contains(typeStatus);
  }

  bool countCertNotificationInHome() {
    switch (typeStatus) {
      case StatusCertEnum.WAITING_GENERATE_KEYPAIR:
      case StatusCertEnum.WAITING_ASSIGNED_TO_SIGNER:
      case StatusCertEnum.WAITING_GENERATE_CERTIFICATE:
      case StatusCertEnum.WAITING_SIGN_ACCEPTANCE:
        // case StatusCertEnum.WAITING_APPROVE:
        return true;
      default:
        return false;
    }
  }

  isValidOrExpired() {
    return typeStatus == StatusCertEnum.VALID ||
        typeStatus == StatusCertEnum.EXPIRED;
  }

  isValid() {
    return typeStatus == StatusCertEnum.VALID;
  }

  bool get isWaitingActive {
    switch (typeStatus) {
      case StatusCertEnum.WAITING_GENERATE_KEYPAIR:
      case StatusCertEnum.WAITING_ASSIGNED_TO_SIGNER:
      case StatusCertEnum.WAITING_GENERATE_CERTIFICATE:
      case StatusCertEnum.WAITING_SIGN_ACCEPTANCE:
        return true;
      default:
        return false;
    }
  }

  getSignTypeEnum() {
    if (orderInfo?.signType == 1) {
      return SignType.turn;
    } else {
      return SignType.period;
    }
  }

  bool get isNeedAssignKey {
    return typeStatus == StatusCertEnum.WAITING_GENERATE_KEYPAIR ||
        typeStatus == StatusCertEnum.WAITING_ASSIGNED_TO_SIGNER;
  }

  Color get backgroundColor {
    switch (status) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.teal;
      case 4:
        return Colors.red;
      case 5:
        return Colors.redAccent;
      case 6:
        return Colors.orangeAccent;
      case 7:
        return Colors.amber;
      default:
        return Colors.blueAccent;
    }
  }

  String get iconSvg {
    switch (status) {
      case 0:
        return 'assets/svg/activated_state.svg';
      case 1:
        return 'assets/svg/waiting.svg';
      case 2:
        return 'assets/svg/waiting.svg';
      case 3:
        return 'assets/svg/waiting.svg';
      case 4:
        return 'assets/svg/danger.svg';
      case 5:
        return 'assets/svg/close.svg';
      case 6:
        return 'assets/svg/pause.svg';
      case 7:
        return 'assets/svg/waiting.svg';
      default:
        return 'assets/svg/waiting.svg';
    }
  }

  String get icon {
    final issuerCN = prop(issuer!, 'CN').toUpperCase();
    switch (issuerCN) {
      case 'VNPT CERTIFICATION AUTHORITY':
        return 'assets/images/vnpt.png';
      case 'VNPT CERTIFICATION AUTHORITY TEST':
        return 'assets/images/vnpt.png';
    }
    return 'assets/images/unknown_ca.png';
  }

  // "            [Description(""Chờ sinh cặp khóa"")]
  // WAITING_GENERATE_KEYPAIR = 1,
  // [Description(""Chờ người dùng kích hoạt"")]
  // WAITING_ASSIGNED_TO_SIGNER = 2,
  // [Description(""Chờ cấp chứng thư số"")]
  // WAITING_GENERATE_CERTIFICATE = 3,
  // [Description(""Đang hoạt động"")]
  // VALID = 0,
  //
  // [Description(""Hết hạn"")]
  // EXPIRED = 4,
  // [Description(""Đã thu hồi"")]
  // REVOKED = 5,
  // [Description(""Đang tạm dừng"")]
  // SUSPENDED = 6,
  // [Description(""Chờ ký biên bản nghiệm thu"")]
  // WAITING_SIGN_ACCEPTANCE = 7,
  // [Description(""Ký BBNT lỗi, chữ ký không hợp lệ"")]
  // SIGN_ACCEPTANCE_FAILED = 8,
  // [Description(""Chờ đồng bộ biên bản nghiệm thu"")]
  // WAITING_SYNC_ACCEPTANCE = 9,
  // [Description(""Đồng bộ biên bản nghiệm thu không thành công"")]
  // SYNC_ACCEPTANCE_FAILED = 10,
  // [Description(""Chờ duyệt"")]
  // WAITING_APPROVE = 11,"

  String get statusDesc {
    // if (certExpired <= 0) return AppLocalizations.current.expired;
    switch (status) {
      case 0:
        return AppLocalizations.current.activing;
      case 1:
        return AppLocalizations.current.waitingGenerateKeyPair;
      case 2:
        return AppLocalizations.current.waitingUserActive;
      case 3:
        return AppLocalizations.current.waitingGenerateCertificate;
      case 4:
        return AppLocalizations.current.expired;
      case 5:
        return AppLocalizations.current.revoked;
      case 6:
        return AppLocalizations.current.suspended;
      case 7:
        return AppLocalizations.current.waitingSignAcceptanceMinutes;
      case 8:
        return AppLocalizations.current.signErrorInvalid;
      case 9:
        return AppLocalizations.current.waitingSyncBBNT;
      case 10:
        return AppLocalizations.current.syncBBNTFailure;
      case 11:
        return AppLocalizations.current.waitingApprove;
      default:
        return AppLocalizations.current.unknown;
    }
  }

  String get identification {
    return prop(subjectDN!, 'UID');
  }

  String get subjectCN {
    return prop(subjectDN!, 'CN');
  }

  String get issuerCN {
    return prop(issuer!, 'CN');
  }

  String get uIDKey {
    return getUid(subjectDN!, 'UID', 'key');
  }

  String get uIDValue {
    return getUid(subjectDN!, 'UID', 'value');
  }

  String getUid(String value, String key, dynamic type) {
    if (value.contains('$key =')) {
      key = '$key =';
    } else if (value.contains('$key=')) {
      key = '$key=';
    } else {
      return AppLocalizations.current.unknown;
    }
    String cn = value.substring(value.indexOf(key));
    if (cn.contains(',')) {
      cn = cn.substring(0, cn.indexOf(','));
    }
    cn = cn.replaceAll(key, '').replaceAll(',', '').trim();

    if (cn.contains(':')) {
      if (type == 'value') {
        cn = cn.substring(cn.indexOf(':') + 1);
        return cn;
      } else if (type == 'key') {
        cn = cn.substring(0, cn.indexOf(':'));
        return cn;
      } else {
        return AppLocalizations.current.unknown;
      }
    }
    return AppLocalizations.current.unknown;
  }

  String get valid {
    if ([0, 5, 6, 7].contains(status)) {
      String x = DatetimeFormat().formatDate(validFrom!);
      String y = DatetimeFormat().formatDate(validTo!);
      return '$x - $y';
    }
    return AppLocalizations.current.unknown;
  }

  int get certExpired {
    if ([0, 5, 6, 7].contains(status)) {
      DateTime dt1 = DateTime.parse(validFrom!);
      DateTime dt2 = DateTime.parse(validTo!);
      return dt2.difference(dt1).inDays;
    }
    return -1;
  }

  String get certStatusMessage {
    if (certExpired <= 0) return AppLocalizations.current.expired_alter_message;
    switch (status) {
      case 0:
        return AppLocalizations.current.activing;
      case 1:
        return AppLocalizations.current.waitingGenerateKeyPair;
      case 2:
        return AppLocalizations.current.waitingUserActive;
      case 3:
        return AppLocalizations.current.waitingGenerateCertificate;
      case 4:
        return AppLocalizations.current.expired;
      case 5:
        return AppLocalizations.current.revoked;
      case 6:
        return AppLocalizations.current.suspended;
      case 7:
        return AppLocalizations.current.waitingSignAcceptanceMinutes;
      case 8:
        return AppLocalizations.current.signErrorInvalid;
      case 9:
        return AppLocalizations.current.waitingSyncBBNT;
      case 10:
        return AppLocalizations.current.syncBBNTFailure;
      case 11:
        return AppLocalizations.current.waitingApprove;
      default:
        return AppLocalizations.current.unknown;
    }
  }

  String prop(String value, String key) {
    if (value.contains('$key =')) {
      key = '$key =';
    } else if (value.contains('$key=')) {
      key = '$key=';
    } else {
      return AppLocalizations.current.unknown;
    }
    String cn = value.substring(value.indexOf(key));
    if (cn.contains(',')) {
      cn = cn.substring(0, cn.indexOf(','));
    }
    cn = cn.replaceAll(key, '').replaceAll(',', '').trim();
    return cn;
  }

  getSignNumber() {
    try {
      return ((servicePack?.totalSignLimit ?? 0) -
          (servicePack?.signedTurn ?? 0));
    } catch (e) {
      return 0;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'reqCertId': reqCertId,
      'status': status,
      'statusDescription': statusDescription,
      'accountEmail': accountEmail,
      'certType': certType,
      'subjectDN': subjectDN,
      'issuer': issuer,
      'validFrom': validFrom,
      'validTo': validTo,
      'timeCreateRequest': timeCreateRequest,
      'timeCreateWorker': timeCreateWorker,
      'signatureAlg': signatureAlg,
      'keyLength': keyLength,
      'serial': serial,
      'certStatus': certStatus,
      'certStatusDesc': certStatusDesc,
      'certProfile': certProfile,
      'device': device,
      'signType': signType,
      'orderInfo': orderInfo,
      'servicePack': servicePack,
      'refName': refName
    };
  }

  factory CertificateModel.fromMap(Map<String, dynamic> map) {
    CertificateModel certificateModel = CertificateModel(
        id: map['id'] ?? '',
        reqCertId: map['reqCertId'],
        status: map['status']?.toInt(),
        statusDescription: map['statusDescription'],
        accountEmail: map['accountEmail'],
        certType: map['certType']?.toInt(),
        subjectDN: map['subject'],
        issuer: map['issuer'],
        validFrom: map['validFrom'],
        validTo: map['validTo'],
        timeCreateRequest: map['timeCreateRequest'],
        timeCreateWorker: map['timeCreateWorker'],
        signatureAlg: map['signatureAlg'],
        keyLength: map['keyLength']?.toInt(),
        serial: map['serial'],
        certStatus: map['certStatus']?.toInt(),
        certStatusDesc: map['certStatusDesc'],
        certProfile: map['certProfile'] != null
            ? CertProfile.fromJson(map['certProfile'])
            : null,
        device: map['device'] != null ? Device.fromJson(map['device']) : null,
        orderInfo: map['orderInfo'] != null
            ? OrderInfo.fromJson(map['orderInfo'])
            : null,
        servicePack: map['servicePack'] != null
            ? NumberSignModel.fromJson(map['servicePack'])
            : null,
        refName: map["refName"],
        signType: map['signType']?.toInt());

    return certificateModel;
  }

  String toJson() => json.encode(toMap());

  factory CertificateModel.fromJson(String source) =>
      CertificateModel.fromMap(json.decode(source));
}

class CertificateListModel<T> {
  int count;
  int pageNumber;
  int pageCount;
  int totalItemCount;
  List<CertificateModel> items;

  CertificateListModel({
    required this.count,
    required this.pageNumber,
    required this.pageCount,
    required this.totalItemCount,
    required this.items,
  });

  factory CertificateListModel.fromMap(Map<String, dynamic> map) {
    // json.encode(map);
    return CertificateListModel<T>(
      count: map['count']?.toInt() ?? 0,
      pageNumber: map['pageNumber']?.toInt() ?? 0,
      pageCount: map['pageCount']?.toInt() ?? 0,
      totalItemCount: map['totalItemCount']?.toInt() ?? 0,
      items: List<CertificateModel>.from(
          map['items']?.map((x) => CertificateModel.fromMap(x))),
    );
  }

  factory CertificateListModel.fromJson(String source) =>
      CertificateListModel.fromMap(json.decode(source));
}

class SADRequest {
  String authRequestId;
  String challenge;
  int challengeId;
  String sub;
  String audience;
  String data;
  String otp;

  SADRequest.fromJson(Map<String, dynamic> json)
      : authRequestId = json['authRequestId'],
        challenge = json['challenge'],
        challengeId = json['challengeId'],
        sub = json['sub'],
        audience = json['audience'],
        data = json['data'],
        otp = json['otp'];

  Map<String, dynamic> toMap() {
    return {
      'authRequestId': authRequestId,
      'challenge': challenge,
      'challengeId': challengeId,
      'sub': sub,
      'audience': audience,
      'data': data,
      'otp': otp
    };
  }

  String toJson() => json.encode(toMap());
}

class CertProfile {
  String? serviceType;
  String? pricingCode;
  String? pricingName;
  String? endEntityProfileName;
  String? certificateProfileName;

  bool isEseal() {
    return serviceType == "Eseal";
  }

  CertProfile(
      {this.serviceType,
      this.pricingCode,
      this.pricingName,
      this.endEntityProfileName,
      this.certificateProfileName});

  CertProfile.fromJson(Map<String, dynamic> json) {
    serviceType = json['serviceType'];
    pricingCode = json['pricingCode'];
    pricingName = json['pricingName'];
    endEntityProfileName = json['endEntityProfileName'];
    certificateProfileName = json['certificateProfileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceType'] = this.serviceType;
    data['pricingCode'] = this.pricingCode;
    data['pricingName'] = this.pricingName;
    data['endEntityProfileName'] = this.endEntityProfileName;
    data['certificateProfileName'] = this.certificateProfileName;
    return data;
  }
}

class Device {
  String? deviceID;
  String? deviceName;
  String? userId;
  String? osName;
  String? osVersion;
  String? branch;
  String? registerDate;

  Device(
      {this.deviceID,
      this.deviceName,
      this.userId,
      this.osName,
      this.osVersion,
      this.branch,
      this.registerDate});

  Device.fromJson(Map<String, dynamic> json) {
    deviceID = json['deviceID'];
    deviceName = json['deviceName'];
    userId = json['userId'];
    osName = json['osName'];
    osVersion = json['osVersion'];
    branch = json['branch'];
    registerDate = json['registerDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceID'] = this.deviceID;
    data['deviceName'] = this.deviceName;
    data['userId'] = this.userId;
    data['osName'] = this.osName;
    data['osVersion'] = this.osVersion;
    data['branch'] = this.branch;
    data['registerDate'] = this.registerDate;
    return data;
  }
}

class OrderInfo {
  String? paymentId;
  String? createdDate;
  String? certificateProfileName;
  String? pricingName;
  int? signType;

  OrderInfo(
      {this.paymentId,
      this.createdDate,
      this.certificateProfileName,
      this.pricingName,
      this.signType});

  OrderInfo.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    createdDate = json['createdDate'];
    certificateProfileName = json['certificateProfileName'];
    pricingName = json['pricingName'];
    signType = json['signType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentId'] = this.paymentId;
    data['createdDate'] = this.createdDate;
    data['certificateProfileName'] = this.certificateProfileName;
    data['pricingName'] = this.pricingName;
    data['signType'] = this.signType;
    return data;
  }
}
