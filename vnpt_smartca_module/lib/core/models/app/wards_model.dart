import 'category_model.dart';

class WardsModel extends CategoryModel {
  final int wardId;
  final String wardName;
  final int? districtId;
  final String? districtCode;
  final String? districtName;
  final int? provinceId;
  final String? provinceName;
  final String? provinceCode;

  WardsModel({
    this.wardId = 0,
    this.wardName = "",
    this.districtId = 0,
    this.districtCode = "",
    this.districtName = "",
    this.provinceId = 0,
    this.provinceName = "",
    this.provinceCode = "",
  });

  WardsModel.fromJson(Map<String, dynamic> json)
      : wardId = json['wardId'],
        wardName = json['wardName'],
        districtId = json['districtId'],
        districtCode = json['districtCode'],
        districtName = json['districtName'],
        provinceId = json['provinceId'],
        provinceName = json['provinceName'],
        provinceCode = json['provinceCode'];

  @override
  String get name {
    return wardName;
  }
}
