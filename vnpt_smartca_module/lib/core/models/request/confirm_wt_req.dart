import 'dart:convert';

import '../response/transaction_model.dart';

class ConfirmWTRequest {
  final String tranId;
  final String credentialId;
  final String sad;
  ConfirmWTRequest({
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

  factory ConfirmWTRequest.fromMap(Map<String, dynamic> map) {
    return ConfirmWTRequest(
      tranId: map['tranId'] ?? '',
      credentialId: map['credentialId'] ?? '',
      sad: map['sad'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirmWTRequest.fromJson(String source) =>
      ConfirmWTRequest.fromMap(json.decode(source));
}

class ConfirmWTUsecasRequest {
  final TransactionModel model;
  final String userPIN;
  ConfirmWTUsecasRequest({
    required this.model,
    required this.userPIN,
  });

  Map<String, dynamic> toMap() {
    return {
      'model': model.toMap(),
      'userPIN': userPIN,
    };
  }

  factory ConfirmWTUsecasRequest.fromMap(Map<String, dynamic> map) {
    return ConfirmWTUsecasRequest(
      model: TransactionModel.fromMap(map['model']),
      userPIN: map['userPIN'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirmWTUsecasRequest.fromJson(String source) =>
      ConfirmWTUsecasRequest.fromMap(json.decode(source));
}

class ActionWTUsecaseRequest {
  final TransactionModel model;
  final String userPIN;

  ActionWTUsecaseRequest({
    required this.model,
    required this.userPIN,
  });

  Map<String, dynamic> toMap() {
    return {
      'model': model.toMap(),
      'userPIN': userPIN,
    };
  }

  factory ActionWTUsecaseRequest.fromMap(Map<String, dynamic> map) {
    return ActionWTUsecaseRequest(
      model: TransactionModel.fromMap(map['model']),
      userPIN: map['userPIN'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ActionWTUsecaseRequest.fromJson(String source) =>
      ActionWTUsecaseRequest.fromMap(json.decode(source));
}
