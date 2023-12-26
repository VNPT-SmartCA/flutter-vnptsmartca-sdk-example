import 'category_model.dart';

class ProvinceModel extends CategoryModel {
  final int provinceId;
  final String provinceName;
  final String? provinceCode;
  final int? provinceRegionId;
  final int? provinceOrder;

  ProvinceModel({
    this.provinceId = 0,
    this.provinceName = "",
    this.provinceCode = "",
    this.provinceRegionId = 0,
    this.provinceOrder = 0,
  });

  ProvinceModel.fromJson(Map<String, dynamic> json)
      : provinceId = json['provinceId'],
        provinceName = json['provinceName'],
        provinceCode = json['provinceCode'],
        provinceRegionId = json['provinceRegionId'],
        provinceOrder = json['provinceOrder'];

  @override
  String get name {
    return provinceName;
  }

  int get id {
    return provinceId;
  }
}
