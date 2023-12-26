import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../views/controller/order_item_controller.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/widgets/app_refresh.dart';

class OrderCertListModel {
  int count;
  int pageNumber;
  int pageCount;
  int totalItemCount;
  List<OrderCertModel> items;

  OrderCertListModel({
    required this.count,
    required this.pageNumber,
    required this.pageCount,
    required this.totalItemCount,
    required this.items,
  });

  factory OrderCertListModel.fromMap(Map<String, dynamic> map) {
    return OrderCertListModel(
      count: map['count']?.toInt() ?? 0,
      pageNumber: map['pageNumber']?.toInt() ?? 0,
      pageCount: map['pageCount']?.toInt() ?? 0,
      totalItemCount: map['totalItemCount']?.toInt() ?? 0,
      items: List<OrderCertModel>.from(
          map['items']?.map((x) => OrderCertModel.fromJson(x))),
    );
  }

  factory OrderCertListModel.fromJson(String source) =>
      OrderCertListModel.fromMap(json.decode(source));
}

enum OrderType { unknown, newCert, renewCert, changeDevice, changeInfo }

class OrderCertModel extends AppRefreshModel {
  OrderCertModel({
    required this.statusDesc,
    required this.status,
    required this.requireEkyc,
    required this.requireOTP,
    required this.requirePayment,
    required this.requireContract,
    required this.createdDate,
    required this.typeDesc,
    required this.type,
    this.previousSerial,
    required this.identityId,
    required this.uid,
    this.credentialId,
    this.requestCertId,
    required this.pricing,
    required this.dhsxkdCustomerInfo,
    required this.localityCode,
    this.ekycTranId,
    required this.logs,
    required this.id,
    required this.timestamp,
    this.statusIsDone = false,
  }) : super(id);

  late final String statusDesc;
  late final int status;
  late final bool requireEkyc;
  late final bool requireOTP;
  late final bool requirePayment;
  late final bool requireContract;
  late final String createdDate;
  late final String typeDesc;
  late final int type;
  late final dynamic previousSerial;
  late final String? identityId;
  late final String uid;
  late final String? credentialId;
  late final dynamic requestCertId;
  late final Pricing pricing;
  late final DhsxkdCustomerInfo dhsxkdCustomerInfo;
  late final String localityCode;
  late final dynamic ekycTranId;
  late final List<dynamic> logs;
  late final String id;
  late final String timestamp;
  late final bool statusIsDone;

  int? code;

  OrderItemController? orderItemController;

  factory OrderCertModel.fromJson(Map<String, dynamic> json) {
    OrderCertModel orderCertModel = OrderCertModel(
      statusDesc: json['statusDesc'],
      status: json['status'],
      requireEkyc: json['requireEkyc'],
      requireOTP: json['requireOTP'],
      requirePayment: json['requirePayment'],
      requireContract: json['requireContract'],
      createdDate: json['createdDate'],
      typeDesc: json['typeDesc'],
      type: json['type'],
      previousSerial: json['previousSerial'],
      identityId: json['identityId'],
      uid: json['uid'],
      credentialId: json['credentialId'],
      requestCertId: null,
      pricing: json['pricing'] == null
          ? Pricing.emptyPricing()
          : Pricing.fromJson(json['pricing']),
      dhsxkdCustomerInfo:
          DhsxkdCustomerInfo.fromJson(json['dhsxkdCustomerInfo']),
      localityCode: json['localityCode'],
      ekycTranId: null,
      logs: List.castFrom<dynamic, dynamic>(json['logs']),
      id: json['id'],
      timestamp: json['timestamp'],
      statusIsDone: json['status'] == DONE,
    );
    orderCertModel.orderItemController =
        Get.put(OrderItemController(orderCertModel), tag: orderCertModel.id);
    return orderCertModel;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statusDesc'] = statusDesc;
    _data['status'] = status;
    _data['requireEkyc'] = requireEkyc;
    _data['requireOTP'] = requireOTP;
    _data['requirePayment'] = requirePayment;
    _data['requireContract'] = requireContract;
    _data['createdDate'] = createdDate;
    _data['typeDesc'] = typeDesc;
    _data['type'] = type;
    _data['previousSerial'] = previousSerial;
    _data['identityId'] = identityId;
    _data['uid'] = uid;
    _data['credentialId'] = credentialId;
    _data['requestCertId'] = requestCertId;
    _data['pricing'] = pricing?.toJson();
    _data['dhsxkdCustomerInfo'] = dhsxkdCustomerInfo.toJson();
    _data['localityCode'] = localityCode;
    _data['ekycTranId'] = ekycTranId;
    _data['logs'] = logs;
    _data['id'] = id;
    _data['timestamp'] = timestamp;
    return _data;
  }

  getTypeLabel() {
    switch (type) {
      case 0:
        return AppLocalizations.current.newCertOrder;
      case 1:
        return AppLocalizations.current.renewCertOrder;
      case 2:
        return AppLocalizations.current.changeDeviceOrder;
      case 3:
        return AppLocalizations.current.change_info;
      default:
        return "";
    }
  }

  getTypeEnum() {
    switch (type) {
      case 0:
        return OrderType.newCert;
      case 1:
        return OrderType.renewCert;
      case 2:
        return OrderType.changeDevice;
      case 3:
        return OrderType.changeInfo;
      default:
        return OrderType.unknown;
    }
  }

  canContinue() {
    return [
      EKYC_WAITING,
      OTP_WAITING,
      PAYMENT_WATING,
      PAYMENT_ERROR,
      CONTRACT_SIGN_WAITING
    ].contains(status);
  }

  canCancel() {
    return status != CANCELED && status != DONE;
  }

  showWaitingApproveScreen() {
    // REQUESTCERT_ERROR = 55,
    // ONEBSS_SUBMIT_ERROR = 56,
    // APPROVE_REQUEST_CERT_ERROR = 57
    // APPROVE_REQUEST_CERT_WAITING = 7
    return [
      REQUESTCERT_ERROR,
      ONEBSS_SUBMIT_ERROR,
      APPROVE_REQUEST_CERT_ERROR,
      APPROVE_REQUEST_CERT_WAITING,
      DONE
    ].contains(status);
  }

  static const EKYC_WAITING = 0;
  static const OTP_WAITING = 1;
  static const PAYMENT_WATING = 2;
  static const CONTRACT_CREATE_WAITING = 3;
  static const CONTRACT_SIGN_WAITING = 4;
  static const REQUESTCERT_WATING = 5;
  static const ONEBSS_SUBMIT_WAITING = 6;
  static const APPROVE_REQUEST_CERT_WAITING = 7;
  static const KEY_ASSIGN_WATING = 8;
  // error
  static const EKYC_ERROR = 50;
  static const OTP_ERROR = 51;
  static const PAYMENT_ERROR = 52;
  static const CONTRACT_CREATE_ERROR = 53;
  static const CONTRACT_SIGN_ERROR = 54;
  static const REQUESTCERT_ERROR = 55;
  static const ONEBSS_SUBMIT_ERROR = 56;
  static const APPROVE_REQUEST_CERT_ERROR = 57;
  static const REJECT_REQUEST_CERT = 58;
  static const KEY_ASSIGN_ERROR = 59;

  static const CANCELED = 99;
  // done
  static const DONE = 100;

  // EKYC_WAITING = 0,
  // OTP_WAITING = 1,
  // PAYMENT_WATING = 2,
  // CONTRACT_CREATE_WAITING  = 3,
  // CONTRACT_SIGN_WAITING  = 4,
  // REQUESTCERT_WATING = 5,
  // ONEBSS_SUBMIT_WAITING = 6,
  // APPROVE_REQUEST_CERT_WAITING = 7,
  //
  // EKYC_ERROR = 50,
  // OTP_ERROR = 51,
  // PAYMENT_ERROR = 52,
  // CONTRACT_CREATE_ERROR = 53,
  // CONTRACT_SIGN_ERROR = 54,
  // REQUESTCERT_ERROR = 55,
  // ONEBSS_SUBMIT_ERROR = 56,
  // APPROVE_REQUEST_CERT_ERROR = 57,
  // REJECT_REQUEST_CERT = 58,
  //
  // DONE = 100,
  getStateText() {
    switch (status) {
      case 0:
        return AppLocalizations.current.orderEKYC_WAITING;
      case 1:
        return AppLocalizations.current.orderOTP_WAITING;
      case 2:
        return AppLocalizations.current.orderPAYMENT_WAITING;
      case 3:
        return AppLocalizations.current.orderCONTRACT_CREATE_WAITING;
      case 4:
        return AppLocalizations.current.orderCONTRACT_SIGN_WAITING;
      case 5:
        return AppLocalizations.current.orderREQUESTCERT_WATING;
      case 6:
        return AppLocalizations.current.orderONEBSS_SUBMIT_WAITING;
      case 7:
        return AppLocalizations.current.orderAPPROVE_REQUEST_CERT_WAITING;
      case 8:
        return AppLocalizations.current.orderKEY_ASSIGN_WATING;
      case 50:
        return AppLocalizations.current.orderEKYC_ERROR;
      case 51:
        return AppLocalizations.current.orderOTP_ERROR;
      case 52:
        return AppLocalizations.current.orderPAYMENT_ERROR;
      case 53:
        return AppLocalizations.current.orderCONTRACT_CREATE_ERROR;
      case 54:
        return AppLocalizations.current.orderCONTRACT_SIGN_ERROR;
      case 55:
        // if (getTypeEnum() == OrderType.newCert) {
        return AppLocalizations.current.orderAPPROVE_REQUEST_CERT_WAITING;
        // } else {
        return AppLocalizations.current.orderREQUESTCERT_ERROR;
      // }
      case 56:
        // if (getTypeEnum() == OrderType.newCert) {
        return AppLocalizations.current.orderAPPROVE_REQUEST_CERT_WAITING;
      // } else {
      //   return AppLocalizations.current.orderONEBSS_SUBMIT_ERROR;
      // }
      case 57:
        // if (getTypeEnum() == OrderType.newCert) {
        return AppLocalizations.current.orderAPPROVE_REQUEST_CERT_WAITING;
      // } else {
      //   return AppLocalizations.current.orderAPPROVE_REQUEST_CERT_ERROR;
      // }
      case 58:
        return AppLocalizations.current.orderREJECT_REQUEST_CERT;
      case 59:
        return AppLocalizations.current.orderKEY_ASSIGN_ERROR;
      case 99:
        return AppLocalizations.current.orderCANCELED;
      case 100:
        return AppLocalizations.current.orderDONE;
      default:
        return "";
    }
  }
}

class Pricing {
  Pricing({
    required this.pricingCode,
    required this.pricingName,
    required this.timeValidity,
    required this.price,
    required this.certificateProfileName,
    required this.signType,
    required this.signTypeDesc,
  });
  late final String pricingCode;
  late final String pricingName;
  late final int timeValidity;
  late final int price;
  late final String certificateProfileName;
  late final int signType;
  late final String signTypeDesc;

  static emptyPricing() {
    return Pricing(
        pricingCode: "",
        pricingName: "",
        timeValidity: 0,
        price: 0,
        certificateProfileName: "",
        signType: 0,
        signTypeDesc: "");
    // return Pricing(pricingCode: "", pricingName: "", 0, 0, "", 0, "");
  }

  Pricing.fromJson(Map<String, dynamic> json) {
    pricingCode = json['pricingCode'];
    pricingName = json['pricingName'];
    timeValidity = json['timeValidity'];
    price = json['price'];
    certificateProfileName = json['certificateProfileName'];
    signType = json['signType'];
    signTypeDesc = json['signTypeDesc'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pricingCode'] = pricingCode;
    _data['pricingName'] = pricingName;
    _data['timeValidity'] = timeValidity;
    _data['price'] = price;
    _data['certificateProfileName'] = certificateProfileName;
    _data['signType'] = signType;
    _data['signTypeDesc'] = signTypeDesc;
    return _data;
  }

  String get timeValidityStr {
    if (timeValidity == null || timeValidity! <= 0) return 'N/A';
    return '$timeValidity ${AppLocalizations.current.month_text}';
  }

  String get priceStr {
    if (price == null || price! <= 0)
      return AppLocalizations.current.order_free;
    return NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
        .format(price);
  }

  String get amountStr {
    if (price == 0) return '0 đ';
    return NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
        .format(price);
  }

  String get amountStrVND {
    if (price == 0) return AppLocalizations.current.vnd(0);
    return NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
        .format(price)
        .replaceAll("₫", "VNĐ");
  }
}

class DhsxkdCustomerInfo {
  DhsxkdCustomerInfo({
    required this.maGd,
    required this.maKh,
    required this.maHd,
    required this.maHrm,
    required this.maTb,
  });
  late final String maGd;
  late final String maKh;
  late final String maHd;
  late final String maHrm;
  late final String maTb;

  DhsxkdCustomerInfo.fromJson(Map<String, dynamic> json) {
    maGd = json['ma_gd'];
    maKh = json['ma_kh'];
    maHd = json['ma_hd'];
    maHrm = json['ma_hrm'];
    maTb = json['ma_tb'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ma_gd'] = maGd;
    _data['ma_kh'] = maKh;
    _data['ma_hd'] = maHd;
    _data['ma_hrm'] = maHrm;
    _data['ma_tb'] = maTb;
    return _data;
  }
}
