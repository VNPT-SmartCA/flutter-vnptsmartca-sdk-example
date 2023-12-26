// To parse this JSON data, do
//
//     final linkSystemResponse = linkSystemResponseFromJson(jsonString);

import 'dart:convert';

LinkSystemResponse linkSystemResponseFromJson(String str) => LinkSystemResponse.fromJson(json.decode(str));

String linkSystemResponseToJson(LinkSystemResponse data) => json.encode(data.toJson());

class LinkSystemResponse {
  double? pageIndex;
  double? pageSize;
  double? total;
  List<LinkSystemModel>? data;

  LinkSystemResponse({
    this.pageIndex,
    this.pageSize,
    this.total,
    this.data,
  });

  factory LinkSystemResponse.fromJson(Map<String, dynamic> json) => LinkSystemResponse(
    pageIndex: json["pageIndex"],
    pageSize: json["pageSize"],
    total: json["total"],
    data: json["data"] == null ? null : List<LinkSystemModel>.from(json["data"].map((x) => LinkSystemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pageIndex": pageIndex,
    "pageSize": pageSize,
    "total": total,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class LinkSystemModel {
  String? clientId;
  String? clientName;
  String? uid;
  String? credentialId;
  bool? linked;
  Status? status;
  String? statusView;
  String? linkTime;
  String? linkTranId;
  bool? permanent;
  String? configMode;
  String? id;
  String? createTime;
  String? updateTime;
  String? validTo;
  bool? isPause;

  LinkSystemModel({
    this.clientId,
    this.clientName,
    this.uid,
    this.credentialId,
    this.linked,
    this.status,
    this.statusView,
    this.linkTime,
    this.linkTranId,
    this.permanent,
    this.configMode,
    this.id,
    this.createTime,
    this.updateTime,
    this.validTo,
    this.isPause,
  });

  factory LinkSystemModel.fromJson(Map<String, dynamic> json) => LinkSystemModel(
    clientId: json["clientId"],
    clientName: json["clientName"],
    uid: json["uid"],
    credentialId: json["credentialId"],
    linked: json["linked"],
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
    statusView: json["statusView"],
    linkTime: json["linkTime"],
    linkTranId: json["linkTranId"],
    permanent: json["permanent"],
    configMode: json["configMode"],
    id: json["id"],
    createTime: json["createTime"],
    updateTime: json["updateTime"],
    validTo: json["validTo"],
    isPause: json["isPause"],
  );

  Map<String, dynamic> toJson() => {
    "clientId": clientId,
    "clientName": clientName,
    "uid": uid,
    "credentialId": credentialId,
    "linked": linked,
    "status": status == null ? null : status!.toJson(),
    "statusView": statusView,
    "linkTime": linkTime,
    "linkTranId": linkTranId,
    "permanent": permanent,
    "configMode": configMode,
    "id": id,
    "createTime": createTime,
    "updateTime": updateTime,
    "validTo": validTo,
    "isPause": isPause,
  };
}

class Status {
  double? code;
  String? desc;

  Status({
    this.code,
    this.desc,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    code: json["code"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "desc": desc,
  };
}
