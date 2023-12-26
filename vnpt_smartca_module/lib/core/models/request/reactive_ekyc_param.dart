class ReactiveAccParam {
  String uid;
  dynamic idFront;
  dynamic idBack;
  dynamic nearPortrait;
  dynamic farPortrait;
  String type;
  dynamic signature;

  ReactiveAccParam(
      {required this.uid,
        this.idFront,
        this.idBack,
        this.farPortrait,
        this.nearPortrait,
        this.signature,
        this.type = ''});

  Map<String, dynamic> toMap() {
    return {
      'NearPortrait': nearPortrait,
      'FarPortrait': farPortrait,
      'IdFront': idFront,
      'IdBack': idBack,
      'Uid': uid,
      'Signature': signature,
      'Type': type
    };
  }
}