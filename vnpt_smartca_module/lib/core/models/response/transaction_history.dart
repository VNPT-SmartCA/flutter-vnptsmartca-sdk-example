import 'dart:convert';

import 'transaction_model.dart';

class TransactionHistoryRespModel {
  final int page;
  final int pageSize;
  final int count;
  final int pageCount;
  final int totalItemCount;
  final List<TransactionModel> items;

  TransactionHistoryRespModel(this.page, this.pageSize, this.count,
      this.pageCount, this.totalItemCount, this.items);

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
      'count': count,
      'pageCount': pageCount,
      'totalItemCount': totalItemCount,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory TransactionHistoryRespModel.fromMap(Map<String, dynamic> map) {
    return TransactionHistoryRespModel(
      map['page']?.toInt() ?? 0,
      map['pageSize']?.toInt() ?? 0,
      map['count']?.toInt() ?? 0,
      map['pageCount']?.toInt() ?? 0,
      map['totalItemCount']?.toInt() ?? 0,
      List<TransactionModel>.from(
          map['items']?.map((x) => TransactionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionHistoryRespModel.fromJson(String source) =>
      TransactionHistoryRespModel.fromMap(json.decode(source));
}
