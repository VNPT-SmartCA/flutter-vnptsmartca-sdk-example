class Signatures {
  String rectangle;
  int page;

  Signatures({required this.rectangle, required this.page});

  Map<String, dynamic> toJson() {
    return {'rectangle': rectangle, 'page': page};
  }
}
