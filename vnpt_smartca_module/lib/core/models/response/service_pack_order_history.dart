import 'service_pack_order_history_item.dart';

class ServicePackOrderHistoryList {
  int? page;
  int? pageSize;
  int? count;
  int? pageCount;
  int? totalItemCount;
  List<ServicePackOrderHistoryItem>? items;

  ServicePackOrderHistoryList(
      {this.page,
      this.pageSize,
      this.count,
      this.pageCount,
      this.totalItemCount,
      this.items});
  ServicePackOrderHistoryList.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        count = json['count'],
        pageCount = json['pageCount'],
        totalItemCount = json['totalItemCount'],
        items = json['items'] != null
            ? List<ServicePackOrderHistoryItem>.from(
                json['items'].map((x) => ServicePackOrderHistoryItem.fromJson(x)))
            : [];
}
