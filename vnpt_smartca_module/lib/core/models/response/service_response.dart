import 'dart:convert';

class SmartCAApiResponse<T> {
  int code;
  String? codeDesc;
  String message;
  T? content;

  SmartCAApiResponse({
    required this.code,
    this.codeDesc,
    required this.message,
    this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'codeDesc': codeDesc,
      'message': message,
      'content': content,
    };
  }

  factory SmartCAApiResponse.fromMap(Map<String, dynamic> map) {
    return SmartCAApiResponse<T>(
      code: map['code']?.toInt() ?? 0,
      codeDesc: map['codeDesc'] ?? '',
      message: map['message'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SmartCAApiResponse.fromJson(String source) =>
      SmartCAApiResponse.fromMap(json.decode(source));
}
