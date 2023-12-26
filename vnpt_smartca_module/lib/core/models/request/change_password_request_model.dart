import 'dart:convert';

class ChangePasswordRequestModel {
  String uid;
  String email;
  String password;
  String newpassword;

  ChangePasswordRequestModel({
    required this.uid,
    required this.email,
    required this.password,
    required this.newpassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'newpassword': newpassword,
    };
  }

  String toJson() => json.encode(toMap());
}
