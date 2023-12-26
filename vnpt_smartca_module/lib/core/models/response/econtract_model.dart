import 'dart:convert';

class ContractResponse<T> {
   int? code;
   String? codeDesc;
   String? message;
   int? expires_in;
   String? access_token;
   String? refresh_token;
   String? idUser;
   String? domain;
   String? createDate;
   T? content;

   ContractResponse({
     this.code,
      this.message,
      this.codeDesc,
      this.content,
      this.expires_in,
      this.refresh_token,
      this.access_token,
      this.createDate,
      this.domain,
      this.idUser
   });

   Map<String, dynamic> toMap() {
      return {
         'code': code,
         'codeDesc': codeDesc,
         'message': message,
         'content': content,
         'access_token':access_token,
         'refresh_token':refresh_token,
         'expires_in':expires_in,
         'domain':domain,
         'idUser':idUser,
         'createDate':createDate
      };
   }
   String toJson() => json.encode(toMap());

  ContractResponse.fromJsonError(Map<String, dynamic> json)
      : code = json['status'],
        message = (json['errors'] as Map).values.join(", ");

  ContractResponse.fromJson(Map<String, dynamic> json)
     :  expires_in = json['expires_in'],
        access_token =  json['access_token'],
        refresh_token = json['refresh_token'],
        idUser = json['idUser'],
        domain = json['domain'],
        createDate = json['createDate'],
        content = json['content'];
}
