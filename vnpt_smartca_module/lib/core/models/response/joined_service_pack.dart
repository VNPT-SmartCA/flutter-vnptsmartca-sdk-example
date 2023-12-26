import 'dart:convert';

class JoinedServicePack {
  String servicePackName;
  int totalSignLimit;
  int signedTurn;
  int status;

  JoinedServicePack(
      {required this.servicePackName,
      required this.totalSignLimit,
      required this.signedTurn,
      required this.status});

  // JoinedServicePack.fromJson(Map<String, dynamic> json)
  //     : servicePackName = json['servicePackName'],
  //       totalSignLimit = json['totalSignLimit'],
  //       signedTurn = json['signedTurn'],
  //       status = json['status'],
  //       remainingSign = json['remainingSign'];

  int get remainingSign{
    return (totalSignLimit - signedTurn);
  }

  Map<String, dynamic> toMap() {
    return {
      'servicePackName': servicePackName,
      'totalSignLimit': totalSignLimit,
      'signedTurn': signedTurn,
      'status': status,
    };
  }

  factory JoinedServicePack.fromMap(Map<String, dynamic> map) {
    return JoinedServicePack(
      servicePackName: map['servicePackName'] ?? '',
      totalSignLimit: map['totalSignLimit'] ?? 0,
      signedTurn: map['signedTurn'] ?? 0,
      status: map['status'] ?? '',
    );
  }

  factory JoinedServicePack.fromJson(String source) =>
      JoinedServicePack.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
