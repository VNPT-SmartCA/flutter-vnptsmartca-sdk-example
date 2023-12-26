
import 'user_address.dart';

class ProfileModel {
  int? accType;
  String? accTypeDesc;
  String? uidPre;
  String? uid;
  String? username;
  String? email;
  String? phone;
  String? fullName;
  dynamic gender;
  String? address;
  dynamic dateOfBirth;
  int? status;
  String? statusDesc;
  Device? device;
  Contract? contract;
  dynamic adminLocalityCode;
  String? serviceType;
  int? signType;
  UserAddress? userAddress;

  ProfileModel(
      {accType,
      accTypeDesc,
      uidPre,
      uid,
      username,
      email,
      phone,
      fullName,
      gender,
      address,
      dateOfBirth,
      status,
      statusDesc,
      device,
      contract,
      adminLocalityCode,
      serviceType,
      signType,
      this.userAddress});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    accType = json['accType'];
    accTypeDesc = json['accTypeDesc'];
    uidPre = json['uidPre'];
    uid = json['uid'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    fullName = json['fullName'];
    gender = json['gender'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    status = json['status'];
    statusDesc = json['statusDesc'];
    device = json['device'] != null ? Device.fromJson(json['device']) : null;
    contract = json['contract'] != null ? Contract.fromJson(json['contract']) : null;
    adminLocalityCode = json['adminLocalityCode'];
    serviceType = json['serviceType'];
    signType = json['signType'];
    userAddress = json['detailAddress'] != null ? UserAddress.fromJson(json['detailAddress']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accType'] = accType;
    data['accTypeDesc'] = accTypeDesc;
    data['uidPre'] = uidPre;
    data['uid'] = uid;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['address'] = address;
    data['dateOfBirth'] = dateOfBirth;
    data['status'] = status;
    data['statusDesc'] = statusDesc;
    if (device != null) {
      data['device'] = device!.toJson();
    }
    if (contract != null) {
      data['contract'] = contract!.toJson();
    }
    data['adminLocalityCode'] = adminLocalityCode;
    data['serviceType'] = serviceType;
    data['signType'] = signType;
    if (userAddress != null) {
      data['detailAddress'] = userAddress!.toJson();
    }
    return data;
  }

  isIndividual() {
    return accType == 0;
  }
}

class Device {
  String? deviceID;
  String? deviceModel;
  String? deviceName;
  String? osName;
  String? osVersion;
  String? branch;
  String? registerDate;
  String? fcmDeviceToken;
  String? kakPublicKey;
  bool? useBiometrics;
  String? id;
  String? timestamp;

  Device(
      {deviceID,
      deviceModel,
      deviceName,
      osName,
      osVersion,
      branch,
      registerDate,
      fcmDeviceToken,
      kakPublicKey,
      useBiometrics,
      id,
      timestamp});

  Device.fromJson(Map<String, dynamic> json) {
    deviceID = json['deviceID'];
    deviceModel = json['deviceModel'];
    deviceName = json['deviceName'];
    osName = json['osName'];
    osVersion = json['osVersion'];
    branch = json['branch'];
    registerDate = json['registerDate'];
    fcmDeviceToken = json['fcmDeviceToken'];
    kakPublicKey = json['kakPublicKey'];
    useBiometrics = json['useBiometrics'];
    id = json['id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceID'] = deviceID;
    data['deviceModel'] = deviceModel;
    data['deviceName'] = deviceName;
    data['osName'] = osName;
    data['osVersion'] = osVersion;
    data['branch'] = branch;
    data['registerDate'] = registerDate;
    data['fcmDeviceToken'] = fcmDeviceToken;
    data['kakPublicKey'] = kakPublicKey;
    data['useBiometrics'] = useBiometrics;
    data['id'] = id;
    data['timestamp'] = timestamp;
    return data;
  }
}

class Contract {
  String? number;
  String? servicePack;
  int? validity;
  int? unitPrice;
  dynamic pricingCode;
  dynamic serviceType;

  Contract({number, servicePack, validity, unitPrice, pricingCode, serviceType});

  Contract.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    servicePack = json['servicePack'];
    validity = json['validity'];
    unitPrice = json['unitPrice'];
    pricingCode = json['pricingCode'];
    serviceType = json['serviceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['servicePack'] = servicePack;
    data['validity'] = validity;
    data['unitPrice'] = unitPrice;
    data['pricingCode'] = pricingCode;
    data['serviceType'] = serviceType;
    return data;
  }
}
