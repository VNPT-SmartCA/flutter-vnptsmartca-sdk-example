import 'dart:convert';

class LoginRequestModel {
  late String clientId;
  late String clientSecret;
  String grantType = 'password';
  final String username;
  final String password;
  late String culturename;

  LoginRequestModel(this.username, this.password);

  Map<String, dynamic> toMap() {
    return {
      'client_id': clientId,
      'client_secret': clientSecret,
      'grant_type': grantType,
      'username': username,
      'password': password,
      'culturename': culturename,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      map['username'] ?? '',
      map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) =>
      LoginRequestModel.fromMap(json.decode(source));
}
