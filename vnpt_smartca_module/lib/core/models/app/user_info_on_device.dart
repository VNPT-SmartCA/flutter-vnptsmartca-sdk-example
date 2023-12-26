import 'dart:convert';

class UserInfoOnDeviceModel {
  String uid;
  String password;
  String? displayName;
  bool? useBiometric;
  List<CertModel>? certs;
  String? phone;
  String? email;
  int? accType;

  UserInfoOnDeviceModel({
    required this.uid,
    required this.password,
    this.displayName = "",
    this.certs,
    this.useBiometric,
    this.phone,
    this.email,
    this.accType,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'password': password,
      'displayName': displayName,
      'useBiometric': useBiometric,
      'phone': phone,
      'email': email,
      'accType': accType,
      'certs': certs?.map((x) => x.toMap()).toList(),
    };
  }

  factory UserInfoOnDeviceModel.fromMap(Map<String, dynamic> map) {
    return UserInfoOnDeviceModel(
      uid: map['uid'] ?? '',
      password: map['password'] ?? '',
      displayName: map['displayName'],
      useBiometric: map['useBiometric'],
      phone: map['phone'],
      email: map['email'],
      accType: map['accType'],
      certs: map['certs'] != null
          ? List<CertModel>.from(map['certs']?.map((x) => CertModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoOnDeviceModel.fromJson(String source) =>
      UserInfoOnDeviceModel.fromMap(json.decode(source));
}

class CertModel {
  String? id;
  final String pin;
  final String publicKey;
  final String privateKey;
  String? otpSecret;
  final String? otpSecretAdvanced;
  final String? serviceType;

  CertModel(
      {this.id,
      required this.pin,
      required this.publicKey,
      required this.privateKey,
      this.otpSecret,
      this.otpSecretAdvanced,
      this.serviceType});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pin': pin,
      'publicKey': publicKey,
      'privateKey': privateKey,
      'otpSecret': otpSecret,
      'otpSecretAdvanced': otpSecretAdvanced,
      'serviceType': serviceType,
    };
  }

  factory CertModel.fromMap(Map<String, dynamic> map) {
    return CertModel(
      id: map['id'],
      pin: map['pin'] ?? '',
      publicKey: map['publicKey'] ?? '',
      privateKey: map['privateKey'] ?? '',
      otpSecretAdvanced: map['otpSecretAdvanced'] ?? '',
      otpSecret: map['otpSecret'] ?? '',
      serviceType: map['serviceType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CertModel.fromJson(String source) =>
      CertModel.fromMap(json.decode(source));
}
