class EkycResultModel {
  String ekycCode;
  String ekycExpiredTime;
  EkycResultModel({required this.ekycCode, required this.ekycExpiredTime});

  EkycResultModel.fromJson(Map<String, dynamic> json)
      : ekycCode = json['ekycCode'],
        ekycExpiredTime = json['ekycExpiredTime'];
}

class EkycResponseModel {
  EkycResponseModel({
    required this.ekycCode,
    required this.ekycExpiredTime,
    required this.ocrResult,
    this.loaiGiayTo,
    this.password,
    this.phone,
    this.deviceId,
    this.otp,
    this.email,
    this.notAllowReceivedAds,
    this.registered3rd = false,
  });
  late final String ekycCode;
  late final String ekycExpiredTime;
  late final OcrResult ocrResult;
  String? loaiGiayTo;
  String? password;
  String? phone;
  String? deviceId;
  String? otp;
  String? email;
  bool? notAllowReceivedAds;
  bool? registered3rd;

  EkycResponseModel.fromJson(Map<String, dynamic> json) {
    ekycCode = json['ekycCode'];
    ekycExpiredTime = json['ekycExpiredTime'];
    ocrResult = OcrResult.fromJson(json['ocrResult']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ekycCode'] = ekycCode;
    _data['ekycExpiredTime'] = ekycExpiredTime;
    _data['ocrResult'] = ocrResult.toJson();
    return _data;
  }
}

class OcrResult {
  OcrResult({
    required this.id,
    required this.name,
    required this.originLocation,
    this.recentlyLocation,
    required this.issuePlace,
    this.birthDay,
    required this.issueDate,
    required this.gender,
    required this.validDate,
    this.city,
    required this.district,
    required this.ward,
    required this.cardType,
    this.street = "",
    this.cityId = "",
    this.districtId = "",
    this.wardId = "",
  });
  late final String id;
  late final String name;
  late final String originLocation;
  String? recentlyLocation;
  late final String issuePlace;
  late final Null birthDay;
  late final String issueDate;
  late final String gender;
  late final String validDate;
  String? city;
  String? district;
  String? ward;
  late final String cardType;
  String? street;
  String? cityId;
  String? districtId;
  String? wardId;

  OcrResult.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    originLocation = json['originLocation'];
    recentlyLocation = null;
    issuePlace = json['issuePlace'];
    birthDay = null;
    issueDate = json['issueDate'];
    gender = json['gender'];
    validDate = json['valid_date'];
    city = json['city'];
    district = json['district'];
    ward = json['ward'];
    cardType = json['cardType'];
    street = "";
    cityId = json['provinceId'].toString();
    districtId = json['districtId'].toString();
    wardId = json['wardId'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['originLocation'] = originLocation;
    data['recentlyLocation'] = recentlyLocation;
    data['issuePlace'] = issuePlace;
    data['birthDay'] = birthDay;
    data['issueDate'] = issueDate;
    data['gender'] = gender;
    data['valid_date'] = validDate;
    data['city'] = city;
    data['district'] = district;
    data['ward'] = ward;
    data['cardType'] = cardType;
    return data;
  }
}
