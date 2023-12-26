// To parse this JSON data, do
//
//     final userStatusModel = userStatusModelFromJson(jsonString);

import 'dart:convert';

UserStatusModel userStatusModelFromJson(String str) => UserStatusModel.fromJson(json.decode(str));

String userStatusModelToJson(UserStatusModel data) => json.encode(data.toJson());

class UserStatusModel {
  int? status;
  String? statusDesc;
  int? accountType;
  String? accountTypeDesc;
  String? uidPrefix;
  bool? isEkycLocked;

  UserStatusModel({
    this.status,
    this.statusDesc,
    this.accountType,
    this.accountTypeDesc,
    this.uidPrefix,
    this.isEkycLocked,
  });

  factory UserStatusModel.fromJson(Map<String, dynamic> json) => UserStatusModel(
    status: json["status"],
    statusDesc: json["statusDesc"],
    accountType: json["accountType"],
    accountTypeDesc: json["accountTypeDesc"],
    uidPrefix: json["uidPrefix"],
    isEkycLocked: json["isEkycLocked"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusDesc": statusDesc,
    "accountType": accountType,
    "accountTypeDesc": accountTypeDesc,
    "uidPrefix": uidPrefix,
    "isEkycLocked": isEkycLocked,
  };
}
