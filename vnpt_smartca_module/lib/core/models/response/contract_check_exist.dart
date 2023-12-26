class ContractCheckExistModel {
  int code;
  String? message;
  ContractData? contractData;

  ContractCheckExistModel(
      {required this.code, required this.message, required this.contractData});

  ContractCheckExistModel.fromJson(Map<String, dynamic> json)
      : code = json['statusCode'] ?? 200,
        message = json['message'],
        contractData = ContractData.fromJson(json['object']);

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'contractData': contractData?.toJson(),
    };
  }
}

class ContractData {
  bool contractExist;
  String? contractId;
  String? contractStatus;
  bool isSigned;
  late String validDate;
  late String signerId;
  String? urlPath;
  // List<Signer> signer;
  // List<Party> party;

  ContractData({
    required this.contractExist,
    this.contractId,
    this.contractStatus,
    required this.isSigned,
    this.urlPath,
  });

  ContractData.fromJson(
    Map<String, dynamic> json,
  )   : contractExist = json['contractExist'],
        contractId = json['contractId'],
        contractStatus = json['contractStatus'],
        isSigned = json['isSigned'],
        urlPath = json['url'];
  // party = List<Party>.from(
  //     json['party']?.map((data) => ContractData.fromJson(data))),
  // signer = List<Signer>.from(
  //     json['Signer']?.map((data) => ContractData.fromJson(data)));

  Map<String, dynamic> toJson() => {
        'contractExist': contractExist,
        'contractId': contractId,
        'contractStatus': contractStatus,
        'isSigned': isSigned,
        'urlPath': urlPath
      };
}

class Signer {
  String userId;
  String fullname;
  String authorizationLetter;
  String position; //chức vụ

  Signer(
      {required this.userId,
      required this.fullname,
      required this.authorizationLetter,
      required this.position});

  Signer.fromJson(Map<String, dynamic> json)
      : userId = json['contractExist'],
        fullname = json['ten'],
        authorizationLetter = json['giayUyQuyenSo'],
        position = json['chucVu'];
}

class Party {
  String partyId;
  String OrgarizationName;
  String registrationNumber;

  Party(
      {required this.partyId,
      required this.OrgarizationName,
      required this.registrationNumber});

  Party.fromJson(Map<String, dynamic> json)
      : partyId = json['partyId'],
        OrgarizationName = json['tenToChuc'],
        registrationNumber = json['soDkdn'];
}
