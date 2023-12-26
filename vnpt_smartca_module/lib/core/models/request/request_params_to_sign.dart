import 'package:uuid/uuid.dart';

import 'sign_data_param.dart';

class RequestSignParams {
  String credentialId;
  String refTranId;
  String description;
  List<SignDataParam> datas;

  RequestSignParams({required this.credentialId,required  this.refTranId,required  this.description,required  this.datas}){
    refTranId = const Uuid().v4();
    description ="Document Signing";
  }

  Map<String, dynamic> toMap() {
    return {
      'credentialId': credentialId,
      'refTranId': refTranId,
      'description': description,
      'datas': datas
    };
  }
}
