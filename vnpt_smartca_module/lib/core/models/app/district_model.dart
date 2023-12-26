import 'category_model.dart';

class DistrictModel extends CategoryModel {
  final int districtId;
  final String districtName;
  final String? districtCode;
  final int? provinceId;
  final String? provinceName;
  final String? provinceCode;

  DistrictModel({
    this.districtId = 0,
    this.districtName = "",
    this.districtCode = "",
    this.provinceId = 0,
    this.provinceName = "",
    this.provinceCode = "",
  });

  DistrictModel.fromJson(Map<String, dynamic> json)
      : districtId = json['districtId'],
        districtName = json['districtName'],
        districtCode = json['districtCode'],
        provinceId = json['provinceId'],
        provinceName = json['provinceName'],
        provinceCode = json['provinceCode'];

  @override
  String get name {
    return districtName;
  }

  int get id {
    return districtId;
  }
}
