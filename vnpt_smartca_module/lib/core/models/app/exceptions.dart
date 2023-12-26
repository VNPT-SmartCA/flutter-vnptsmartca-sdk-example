import 'dart:convert';

class GenericException implements Exception, Error {
  Object error;
  StackTrace? stack;
  GenericException({
    required this.error,
    this.stack,
  });
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ServerException {
  ServerException({
    required this.message,
    required this.code,
    this.codeDesc,
  });

  final String? codeDesc;
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

class CacheException {
  CacheException({this.message});
  dynamic message;
}

class NoInternetException {}

class NotFoundException {}
