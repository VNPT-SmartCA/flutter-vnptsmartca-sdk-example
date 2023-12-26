import 'dart:convert';

class ServerException {
  ServerException({
    required this.message,
    required this.code,
    required this.codeDesc,
  });

  final String codeDesc;
  final String message;
  final int code;

  factory ServerException.fromMap(Map<String, dynamic> map) {
    return ServerException(
      codeDesc: map['codeDesc'] ?? '',
      message: map['message'] ?? '',
      code: map['code']?.toInt() ?? 0,
    );
  }

  factory ServerException.fromJson(String source) =>
      ServerException.fromMap(json.decode(source));
}
