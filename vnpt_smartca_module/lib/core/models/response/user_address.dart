class UserAddress {
  UserAddress({
    required this.provinceId,
    required this.provinceName,
    required this.districtId,
    required this.districtName,
    required this.wardId,
    required this.wardName,
    required this.streetName,
    required this.diaChi,
  });
  late final String provinceId;
  late final String provinceName;
  late final String districtId;
  late final String districtName;
  late final String wardId;
  late final String wardName;
  String? streetName;
  String? diaChi;

  UserAddress.fromJson(Map<String, dynamic> json) {
    provinceId = json['provinceId'] ?? "";
    provinceName = json['provinceName'] ?? "";
    districtId = json['districtId'] ?? "";
    districtName = json['districtName'] ?? "";
    wardId = json['wardId'] ?? "";
    wardName = json['wardName'] ?? "";
    streetName = json['streetName'] ?? "";
    diaChi = json['diaChi'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['provinceId'] = provinceId;
    _data['provinceName'] = provinceName;
    _data['districtId'] = districtId;
    _data['districtName'] = districtName;
    _data['wardId'] = wardId;
    _data['wardName'] = wardName;
    _data['streetName'] = streetName;
    _data['diaChi'] = diaChi;
    return _data;
  }
}
