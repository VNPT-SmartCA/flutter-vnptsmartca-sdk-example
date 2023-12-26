import 'dart:convert';

class TransactionRequestApiModel {
  int pageIndex;
  int pageSize;
  TransactionRequestApiModel({
    required this.pageIndex,
    required this.pageSize
  });

  Map<String, dynamic> toMap() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize
    };
  }

  String toJson() => json.encode(toMap());
}
