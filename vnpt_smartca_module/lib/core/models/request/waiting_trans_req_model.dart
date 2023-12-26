class WaitingTransactionListRequest {
  final int pageIndex;
  final int pageSize;

  WaitingTransactionListRequest({
    required this.pageIndex,
    required this.pageSize,
  });

  Map<String, dynamic> toMap() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
    };
  }
}
