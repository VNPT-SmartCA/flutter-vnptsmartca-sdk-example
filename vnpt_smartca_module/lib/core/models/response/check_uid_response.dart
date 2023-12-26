// To parse this JSON data, do
//
//     final checkUidResponse = checkUidResponseFromJson(jsonString);

import 'dart:convert';

CheckUidResponse checkUidResponseFromJson(String str) => CheckUidResponse.fromJson(json.decode(str));

String checkUidResponseToJson(CheckUidResponse data) => json.encode(data.toJson());

class CheckUidResponse {
  int? code;
  String? codeDesc;
  String? message;
  CheckUidModel? content;

  CheckUidResponse({
    this.code,
    this.codeDesc,
    this.message,
    this.content,
  });

  factory CheckUidResponse.fromJson(Map<String, dynamic> json) => CheckUidResponse(
        code: json["code"],
        codeDesc: json["codeDesc"],
        message: json["message"],
        content: json["content"] == null ? null : CheckUidModel.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "codeDesc": codeDesc,
        "message": message,
        "content": content == null ? null : content!.toJson(),
      };
}

class CheckUidModel {
  int? status;
  String? statusDesc;
  bool? requiredEkyc;
  bool? requiredCheckInfo;
  bool? requiredOtp;
  bool? requiredOrder;
  String? ekycCode;
  String? birthday;
  String? uid;
  String? fullName;
  dynamic passwordHash;
  dynamic passwordSalt;
  String? uidPrefix;
  String? ngayCap;
  String? noiCap;
  Address? address;
  String? id;
  String? timestamp;
  String? email;
  String? provinceName;
  String? districtName;
  String? wardName;

  CheckUidModel({
    this.status,
    this.statusDesc,
    this.requiredEkyc,
    this.requiredCheckInfo,
    this.requiredOtp,
    this.requiredOrder,
    this.ekycCode,
    this.birthday,
    this.uid,
    this.fullName,
    this.passwordHash,
    this.passwordSalt,
    this.uidPrefix,
    this.ngayCap,
    this.noiCap,
    this.address,
    this.id,
    this.timestamp,
    this.email,
    this.provinceName,
    this.districtName,
    this.wardName,
  });

  factory CheckUidModel.fromJson(Map<String, dynamic> json) => CheckUidModel(
        status: json["status"],
        statusDesc: json["statusDesc"],
        requiredEkyc: json["requiredEKYC"],
        requiredCheckInfo: json["requiredCheckInfo"],
        requiredOtp: json["requiredOTP"],
        requiredOrder: json["requiredOrder"],
        ekycCode: json["ekycCode"],
        birthday: json["birthday"],
        uid: json["uid"],
        fullName: json["fullName"],
        passwordHash: json["passwordHash"],
        passwordSalt: json["passwordSalt"],
        uidPrefix: json["uidPrefix"],
        ngayCap: json["ngayCap"],
        noiCap: json["noiCap"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        id: json["id"],
        timestamp: json["timestamp"],
        email: json["email"],
        provinceName: json["provinceName"],
        districtName: json["districtName"],
        wardName: json["wardName"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusDesc": statusDesc,
        "requiredEKYC": requiredEkyc,
        "requiredCheckInfo": requiredCheckInfo,
        "requiredOTP": requiredOtp,
        "requiredOrder": requiredOrder,
        "ekycCode": ekycCode,
        "birthday": birthday,
        "uid": uid,
        "fullName": fullName,
        "passwordHash": passwordHash,
        "passwordSalt": passwordSalt,
        "uidPrefix": uidPrefix,
        "ngayCap": ngayCap,
        "noiCap": noiCap,
        "address": address == null ? null : address!.toJson(),
        "id": id,
        "timestamp": timestamp,
        "email": email,
        "provinceName": provinceName,
        "districtName": districtName,
        "wardName": wardName,
      };
}

class Address {
  String? provinceId;
  String? districtId;
  String? wardId;

  // String? provinceName;
  // String? districtName;
  // String? wardName;
  String? streetName;
  String? address;

  Address({
    this.provinceId,
    this.districtId,
    this.wardId,
    // this.provinceName,
    // this.districtName,
    // this.wardName,
    this.streetName,
    this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        provinceId: json["provinceId"],
        districtId: json["districtId"],
        wardId: json["wardId"],
        // provinceName: json["provinceName"],
        // districtName: json["districtName"],
        // wardName: json["wardName"],
        streetName: json["streetName"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "provinceId": provinceId,
        "districtId": districtId,
        "wardId": wardId,
        // "provinceName": provinceName,
        // "districtName": districtName,
        // "wardName": wardName,
        "streetName": streetName,
        "address": address,
      };
}

class WardInformationModel {
  int? wardId;
  int? wardIdMyVnpt;
  String? wardName;
  int? districtId;
  int? districtIdMyVnpt;
  String? districtCode;
  String? districtName;
  int? provinceId;
  String? provinceName;
  String? provinceCode;

  WardInformationModel({
    this.wardId,
    this.wardIdMyVnpt,
    this.wardName,
    this.districtId,
    this.districtIdMyVnpt,
    this.districtCode,
    this.districtName,
    this.provinceId,
    this.provinceName,
    this.provinceCode,
  });

  factory WardInformationModel.fromJson(Map<String, dynamic> json) => WardInformationModel(
        wardId: json["wardId"],
        wardIdMyVnpt: json["wardIdMyVNPT"],
        wardName: json["wardName"],
        districtId: json["districtId"],
        districtIdMyVnpt: json["districtIdMyVNPT"],
        districtCode: json["districtCode"],
        districtName: json["districtName"],
        provinceId: json["provinceId"],
        provinceName: json["provinceName"],
        provinceCode: json["provinceCode"],
      );

  Map<String, dynamic> toJson() => {
        "wardId": wardId,
        "wardIdMyVNPT": wardIdMyVnpt,
        "wardName": wardName,
        "districtId": districtId,
        "districtIdMyVNPT": districtIdMyVnpt,
        "districtCode": districtCode,
        "districtName": districtName,
        "provinceId": provinceId,
        "provinceName": provinceName,
        "provinceCode": provinceCode,
      };
}
