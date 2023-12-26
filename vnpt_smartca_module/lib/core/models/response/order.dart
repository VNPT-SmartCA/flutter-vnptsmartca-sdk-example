class Order {
  final List<DataItems>? items;

  Order({this.items});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        items: json["Items"] != null ? List<DataItems>.from(json["categories"].map((x) => DataItems.fromJson(x))) : [],
      );
}

class DataItems {
  String id;
  int quantity;
  int signTurnNumber;

  DataItems({required this.id, required this.quantity, required this.signTurnNumber});

  DataItems.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        quantity = json['Quantity'],
        signTurnNumber = json["SignTurnNumber"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = id;
    data['Quantity'] = quantity;
    data['SignTurnNumber'] = signTurnNumber;
    return data;
  }
}
