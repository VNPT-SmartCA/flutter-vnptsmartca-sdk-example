class CheckReactiveCodeRequest {
  String uid;
  String code;

  CheckReactiveCodeRequest({required this.uid, required this.code});

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'reactivationCode': code};
  }
}
