class ReactiveAccByEmailParam {
  String uid;
  String code;
  dynamic idFront;
  dynamic idBack;
  dynamic signature;

  ReactiveAccByEmailParam({
    required this.uid,
    required this.code,
    this.idFront,
    this.idBack,
    this.signature,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'reactivationCode': code,
      'idFront': idFront,
      'idBack': idBack,
      'phieuYeuCauThayDoiThongTin': signature,
    };
  }
}
