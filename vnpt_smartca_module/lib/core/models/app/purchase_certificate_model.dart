import 'package:intl/intl.dart';

import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/widgets/app_refresh.dart';

class CertPackFilterModel {
  int code = -1;
  String name = "";
  bool isSelected = false;
  int month = -1;

  CertPackFilterModel(this.code, this.name, this.isSelected, {this.month = -1});
}

class PurchaseCertificateModel extends AppRefreshModel {
  int? pricingCode;
  String? pricingName;
  int? certificateProfileId;
  int? requestConfigId;
  String? code;
  String? endEntityProfileName;
  String? certificateProfileName;
  int? keylength;
  String? description;
  String? serviceType;
  int? caid;
  int? signType;
  int? userSignLimit;
  int? customerType;
  bool? onSale;
  int? purposeType;
  String? pricePlan;
  int? price;
  int? timeValidity;
  bool? selected;

  PurchaseCertificateModel(
      {this.pricingCode,
      this.pricingName,
      this.certificateProfileId,
      this.requestConfigId,
      this.code,
      this.endEntityProfileName,
      this.certificateProfileName,
      this.keylength,
      this.caid,
      this.signType,
      this.userSignLimit,
      this.customerType,
      this.onSale,
      this.purposeType,
      this.pricePlan,
      this.price,
      this.timeValidity,
      this.selected}) : super("");

  factory PurchaseCertificateModel.fromJson(Map<String, dynamic> json) {
    return PurchaseCertificateModel(
        pricingCode: json['pricingCode'],
        pricingName: json['pricingName'],
        certificateProfileId: json['certificateProfileId'],
        requestConfigId: json['requestConfigId'],
        code: json['code'],
        endEntityProfileName: json['endEntityProfileName'],
        certificateProfileName: json['certificateProfileName'],
        keylength: json['keylength'],
        caid: json['caid'],
        signType: json['signType'],
        customerType: json['customerType'],
        onSale: json['onSale'],
        purposeType: json['purposeType'],
        pricePlan: json['pricePlan'],
        price: json['price'],
        timeValidity: json['timeValidity'],
        selected: json['selected'],
    );
  }

  // PurchaseCertificateModel.fromJson(Map<String, dynamic> json)
  //     : pricingCode = json['pricingCode'],
  //       pricingName = json['pricingName'],
  //       certificateProfileId = json['certificateProfileId'],
  //       requestConfigId = json['requestConfigId'],
  //       code = json['code'],
  //       endEntityProfileName = json['endEntityProfileName'],
  //       certificateProfileName = json['certificateProfileName'],
  //       keylength = json['keylength'],
  //       caid = json['caid'],
  //       signType = json['signType'],
  //       customerType = json['customerType'],
  //       onSale = json['onSale'],
  //       purposeType = json['purposeType'],
  //       pricePlan = json['pricePlan'],
  //       price = json['price'],
  //       timeValidity = json['timeValidity'],
  //       selected = json['selected'];

  String get priceStr {
    if (price == null || price! <= 0) return AppLocalizations.current.order_free;
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
        .format(price).replaceAll("₫", "VNĐ");
  }

  String get timeValidityStr {
    if (timeValidity == null || timeValidity! <= 0) return 'N/A';
    return '$timeValidity ${AppLocalizations.current.month_text}';
  }
}
