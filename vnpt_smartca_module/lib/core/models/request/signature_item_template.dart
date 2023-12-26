class SignatureItemTemplateModel {
  String? fontColor;
  String? fontName;
  String? img;
  String? key;
  int? type;

  SignatureItemTemplateModel({this.fontColor, this.fontName, this.img, this.key, this.type});

  factory SignatureItemTemplateModel.fromJson(Map<String, dynamic> json) => SignatureItemTemplateModel(
      fontColor: json["fontColor"],
      fontName: json["fontName"],
      img: json["img"],
      key: json["key"],
      type: json["type"]);

  Map<String, dynamic> toMapn() {
    return {
      'fontColor': fontColor,
      'fontName': fontName,
      'img': img,
      'key': key
    };
  }
}

class SignatureItemTemplateList {
  List<SignatureItemTemplateModel>? items;

  SignatureItemTemplateList({this.items});
  SignatureItemTemplateList.fromJson(Map<String, dynamic> json)
      : items = json['items'] != null
            ? List<SignatureItemTemplateModel>.from(
                json['items'].map((x) => SignatureItemTemplateModel.fromJson(x)))
            : [];
}
