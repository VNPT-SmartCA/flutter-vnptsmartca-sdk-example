import 'sign_document_comment.dart';
import 'sign_document_signatures.dart';

class SignatureOptions {
  List<Comment>? comment;
  String? fontColor;
  String? fontName;
  int? fontSize;
  int? fontStyle;
  String? imageSrc;
  List<Signatures>? signatures;
  int? visibleType;

  SignatureOptions(
      {this.comment,
      this.fontColor,
      this.fontName,
      this.fontSize,
      this.fontStyle,
      this.imageSrc,
      this.signatures,
      this.visibleType}) {
    fontColor = "000000";
    fontName = "Roboto";
    fontSize = 10;
    fontStyle = 0;
    visibleType = 3;
  }

  Map<String, dynamic> toJson() {
    return {
      "comment": comment,
      'fontColor': fontColor,
      'fontName': fontName,
      'fontSize': fontSize,
      'fontStyle': fontStyle,
      'imageSrc': imageSrc,
      "signatures": signatures,
      'visibleType': visibleType,
    };
  }
}
