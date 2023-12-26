import 'dart:convert';

import '../response/transaction_model.dart';


class RejectWTRequest {
  final String tranId;
  final String credentialId;
  final String sad;
  RejectWTRequest({
    required this.tranId,
    required this.credentialId,
    required this.sad,
  });

  Map<String, dynamic> toMap() {
    return {
      'tranId': tranId,
      'credentialId': credentialId,
      'sad': sad,
    };
  }

  factory RejectWTRequest.fromMap(Map<String, dynamic> map) {
    return RejectWTRequest(
      tranId: map['tranId'] ?? '',
      credentialId: map['credentialId'] ?? '',
      sad: map['sad'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RejectWTRequest.fromJson(String source) =>
      RejectWTRequest.fromMap(json.decode(source));
}

class RejectWTUsecaseRequest {
  final TransactionModel model;
  final String userPIN;
  RejectWTUsecaseRequest({
    required this.model,
    required this.userPIN,
  });

  Map<String, dynamic> toMap() {
    return {
      'model': model.toMap(),
      'userPIN': userPIN,
    };
  }

  factory RejectWTUsecaseRequest.fromMap(Map<String, dynamic> map) {
    return RejectWTUsecaseRequest(
      model: TransactionModel.fromMap(map['model']),
      userPIN: map['userPIN'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RejectWTUsecaseRequest.fromJson(String source) =>
      RejectWTUsecaseRequest.fromMap(json.decode(source));
}
