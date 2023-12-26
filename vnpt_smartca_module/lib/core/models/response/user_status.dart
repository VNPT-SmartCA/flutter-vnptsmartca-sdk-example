class UserStatus {
  int code;
  String statusDesc;
  String username;
  String fullName;
  String accountTypeDesc;
  int accountType;

  UserStatus({
    required this.code,
    required this.statusDesc,
    required this.username,
    required this.fullName,
    required this.accountTypeDesc,
    required this.accountType,
  });
  UserStatus.fromJson(Map<String, dynamic> json)
      : code = json['status'],
        statusDesc = json['statusDesc'],
        fullName = json['fullName'],
        accountTypeDesc = json['accountTypeDesc'],
        accountType = json['accountType'],
        username = json['username'];
}
