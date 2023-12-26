class SignDataParam {
  String name;
  String dataBase64;
  String options;

  SignDataParam({required this.name,required  this.dataBase64,required  this.options});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dataBase64': dataBase64,
      'options': options
    };
  }
}

// ignore: prefer_collection_literals
Map<int, SignDataParam> signDataParam = Map();