class Comment {
  String? text;
  String? rectangle;
  int? page;
  String? fontName;
  int? fontStyle;
  int? fontSize;
  String? fontColor;
  int? type;

  Comment({this.text, this.rectangle, this.page, this.fontName, this.fontStyle, this.fontSize, this.fontColor, this.type}){
    fontColor = "000000";
    fontName = "Roboto";
    fontSize = 10;
    fontStyle = 2;
    type = 2;
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'rectangle': rectangle,
      'page': page,
      'fontName': fontName,
      'fontStyle': fontStyle,
      'fontSize': fontSize,
      'fontColor': fontColor,
      'type': type
    };
  }
}