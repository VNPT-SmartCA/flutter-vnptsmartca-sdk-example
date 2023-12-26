class PersonalSignTurnPricingInfo {
  String name;
        final String code;
        final int signTurnNumber;
        final int price;
        final String unit;
        final int quantity;

  PersonalSignTurnPricingInfo(
      this.name,
      this.code,
      this.signTurnNumber,
      this.price,
      this.unit,
      this.quantity);

  PersonalSignTurnPricingInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        code = json['code'],
        signTurnNumber = json['signTurnNumber'],
        price = json['price'],
        unit = json['unit'],
        quantity = json['quantity'];
}