class ChangePasswordRequest {
  String uid;
  String email;
  String password;
  String newpassword;

  ChangePasswordRequest({
    required this.uid,
    required this.email,
    required this.password,
    required this.newpassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "password": password,
      "newpassword": newpassword
    };
  }
}
