import 'dart:convert';

class TransactionInfoRequest {
  final String tranId;
  TransactionInfoRequest({
    required this.tranId,
  });

  Map<String, dynamic> toMap() {
    return {
      'tranId': tranId,
    };
  }

  factory TransactionInfoRequest.fromMap(Map<String, dynamic> map) {
    return TransactionInfoRequest(
      tranId: map['tranId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionInfoRequest.fromJson(String source) =>
      TransactionInfoRequest.fromMap(json.decode(source));
}
