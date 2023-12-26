class CardInfo {
  ItemInfo? IDCardInfo;
  String? Email;
  String? Phone;
  String? LocalityCode;
  ItemAddress? Address;
  ItemPricing? Pricing;
  String? ReferrerCode;

  CardInfo(
      {this.IDCardInfo,
      this.Email,
      this.Phone,
      this.LocalityCode,
      this.Address,
      this.Pricing,
      this.ReferrerCode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (IDCardInfo != null) {
      data['IDCardInfo'] = IDCardInfo?.toJson();
    }
    data['Email'] = this.Email;
    data['Phone'] = this.Phone;
    data['LocalityCode'] = this.LocalityCode;
    if (this.Address != null) {
      data['Address'] = this.Address?.toJson();
    }
    if (this.Pricing != null) {
      data['Pricing'] = this.Pricing?.toJson();
    }
    data['ReferrerCode'] = this.ReferrerCode;

    return data;
  }
}

class ItemInfo {
  String? FullName;
  String? Uid;
  String? UidPrefix;
  String? Country;
  String? IssuedDate;
  String? IssuedPlace;

  ItemInfo(
      {this.FullName,
      this.Uid,
      this.UidPrefix,
      this.Country,
      this.IssuedDate,
      this.IssuedPlace});

  ItemInfo.fromJson(Map<String, dynamic> json) {
    FullName = json['FullName'];
    Uid = json['Uid'];
    UidPrefix = json['UidPrefix'];
    Country = json['Country'];
    IssuedDate = json['IssuedDate'];
    IssuedPlace = json['IssuedPlace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FullName'] = this.FullName;
    data['Uid'] = this.Uid;
    data['UidPrefix'] = this.UidPrefix;
    data['Country'] = this.Country;
    data['IssuedDate'] = this.IssuedDate;
    data['IssuedPlace'] = this.IssuedPlace;
    return data;
  }
}

class ItemAddress {
  String? provinceId;
  String? districtId;
  String? wardId;
  String? streetName;
  String? DiaChi;

  ItemAddress(
      {this.provinceId,
      this.districtId,
      this.wardId,
      this.streetName,
      this.DiaChi});

  ItemAddress.fromJson(Map<String, dynamic> json) {
    provinceId = json['provinceId'];
    districtId = json['districtId'];
    wardId = json['wardId'];
    streetName = json['streetName'];
    DiaChi = json['DiaChi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provinceId'] = this.provinceId;
    data['districtId'] = this.districtId;
    data['wardId'] = this.wardId;
    data['streetName'] = this.streetName;
    data['DiaChi'] = this.DiaChi;
    return data;
  }
}

class ItemPricing {
  String? PricingCode;

  ItemPricing({this.PricingCode});

  ItemPricing.fromJson(Map<String, dynamic> json) {
    PricingCode = json['PricingCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PricingCode'] = this.PricingCode;
    return data;
  }
}
