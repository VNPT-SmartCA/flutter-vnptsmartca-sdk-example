class OTPResponse<T> {
  int? code;
  String? codeDesc;
  String? message;
  T? content;
  OTPResponse({this.code, this.message,});
  OTPResponse.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        codeDesc = json["codeDesc"],
        message = json["message"],
        content = json['content'];
}