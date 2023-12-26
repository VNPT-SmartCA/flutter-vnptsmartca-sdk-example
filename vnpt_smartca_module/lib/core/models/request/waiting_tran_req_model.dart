import 'dart:convert';

class WaitingTransactionRequest {
  final String tranId;
  WaitingTransactionRequest({
    required this.tranId,
  });

  Map<String, dynamic> toMap() {
    return {
      'tranId': tranId,
    };
  }

  factory WaitingTransactionRequest.fromMap(Map<String, dynamic> map) {
    return WaitingTransactionRequest(
      tranId: map['tranId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WaitingTransactionRequest.fromJson(String source) =>
      WaitingTransactionRequest.fromMap(json.decode(source));
}
