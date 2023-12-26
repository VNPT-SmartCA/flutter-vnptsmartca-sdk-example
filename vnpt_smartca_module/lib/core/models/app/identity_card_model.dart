class IdentityCardModel {
  final String id;
  final String name;
  final String code;

  IdentityCardModel({required this.id, required this.name, required this.code});

  IdentityCardModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        code = json['code'];
}

List<IdentityCardModel> identityCards = [
  IdentityCardModel(id: 'CCCD', name: 'Căn cước công dân', code: 'CCCD'),
  IdentityCardModel(id: 'CMND', name: 'Chứng minh thư nhân dân', code: 'CMND'),
  // IdentityCardModel(id: 'HC',name: 'Hộ chiếu', code: 'HC'),
];
