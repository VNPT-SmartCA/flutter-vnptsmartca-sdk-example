class ServicePackModel {
  String? id;
  String name;
  String? code;
  int signTurnNumber;
  String unit;
  String? timestamp;
  int price;
  int quantity;
  bool? isExits;
  String? description;
  int? priceType;
  bool? selected;

  ServicePackModel(
    this.id,
    this.name,
    this.code,
    this.signTurnNumber,
    this.unit,
    this.timestamp,
    this.price,
    this.quantity,
    this.isExits,
    this.description,
    this.priceType,
    this.selected,
  );

  ServicePackModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        code = json['code'],
        signTurnNumber = json['signTurnNumber'] ?? 0,
        unit = json['unit'],
        timestamp = json['timestamp'],
        price = json['price'],
        quantity = 0,
        isExits = false,
        priceType = json['priceType'],
        description = json['description'],
        selected = json['selected'];
}
