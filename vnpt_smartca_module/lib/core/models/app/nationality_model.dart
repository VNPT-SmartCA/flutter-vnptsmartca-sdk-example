class NationalityModel {
  final String id;
  final String name;
  final String code;

  NationalityModel({required this.id, required this.name, required this.code});

  NationalityModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        code = json['code'];
}

List<NationalityModel> nationalities = [
  NationalityModel(id: 'VN',name: 'Việt Nam', code: 'VN'),
  NationalityModel(id: 'KHAC',name: 'Khác', code: 'KHAC')
];
