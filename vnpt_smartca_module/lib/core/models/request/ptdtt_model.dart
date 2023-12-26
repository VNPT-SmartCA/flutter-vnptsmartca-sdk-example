class GetPtdttParam {
  String uid;

  dynamic portraitImg;
  String type;
  dynamic signature;

  GetPtdttParam({required this.uid, this.portraitImg, this.signature, required this.type});

  Map<String, dynamic> toMap() {
    return {
      'NearPortrait': portraitImg,
      'Uid': uid,
      'Signature': signature,
      'Type': type
    };
  }
}