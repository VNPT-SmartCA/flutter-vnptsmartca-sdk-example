class ServicePackOrderHistoryRequest {
  int page;
  int pageSize;
  bool isDesc;

  ServicePackOrderHistoryRequest({required this.page, required this.pageSize, required this.isDesc});

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'pageSize': pageSize,
      'isDesc': isDesc
    };
  }
}
