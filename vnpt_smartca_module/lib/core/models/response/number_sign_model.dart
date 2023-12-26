class NumberSignModel {
  String? servicePackName;
  Admin? admin;
  dynamic budgetInfo;
  int? type;
  int? signType;
  int? status;
  int? totalSignLimit;
  int? signedTurn;
  dynamic allowClients;
  bool? allowAllClients;
  String? createdDate;
  String? activatedDate;
  dynamic creatorInfo;
  bool? isDefault;
  String? certificateProfileName;
  dynamic signAppClients;
  String? id;
  String? timestamp;

  NumberSignModel(
      {this.servicePackName,
        this.admin,
        this.budgetInfo,
        this.type,
        this.signType,
        this.status,
        this.totalSignLimit,
        this.signedTurn,
        this.allowClients,
        this.allowAllClients,
        this.createdDate,
        this.activatedDate,
        this.creatorInfo,
        this.isDefault,
        this.certificateProfileName,
        this.signAppClients,
        this.id,
        this.timestamp});

  NumberSignModel.fromJson(Map<String, dynamic> json) {
    servicePackName = json['servicePackName'];
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    budgetInfo = json['budgetInfo'];
    type = json['type'];
    signType = json['signType'];
    status = json['status'];
    totalSignLimit = json['totalSignLimit'];
    signedTurn = json['signedTurn'];
    allowClients = json['allowClients'];
    allowAllClients = json['allowAllClients'];
    createdDate = json['createdDate'];
    activatedDate = json['activatedDate'];
    creatorInfo = json['creatorInfo'];
    isDefault = json['isDefault'];
    certificateProfileName = json['certificateProfileName'];
    signAppClients = json['signAppClients'];
    id = json['id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['servicePackName'] = this.servicePackName;
    if (this.admin != null) {
      data['admin'] = this.admin!.toJson();
    }
    data['budgetInfo'] = this.budgetInfo;
    data['type'] = this.type;
    data['signType'] = this.signType;
    data['status'] = this.status;
    data['totalSignLimit'] = this.totalSignLimit;
    data['signedTurn'] = this.signedTurn;
    data['allowClients'] = this.allowClients;
    data['allowAllClients'] = this.allowAllClients;
    data['createdDate'] = this.createdDate;
    data['activatedDate'] = this.activatedDate;
    data['creatorInfo'] = this.creatorInfo;
    data['isDefault'] = this.isDefault;
    data['certificateProfileName'] = this.certificateProfileName;
    if (this.signAppClients != null) {
      data['signAppClients'] =
          this.signAppClients!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Admin {
  String? credentialId;
  String? id;
  String? uid;
  String? fullName;
  String? email;
  String? phone;

  Admin(
      {this.credentialId,
        this.id,
        this.uid,
        this.fullName,
        this.email,
        this.phone});

  Admin.fromJson(Map<String, dynamic> json) {
    credentialId = json['credentialId'];
    id = json['id'];
    uid = json['uid'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credentialId'] = this.credentialId;
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

