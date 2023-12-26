class AppLoginModel {
  String clientId;
  String clientSecret;
  String grantType;

  AppLoginModel(
      {this.grantType = 'client_credentials',
      this.clientId = '4cfa-637406049184925437.apps.signserviceapi.com',
      this.clientSecret = 'YTRlNjgwYmU-ZDVkNy00Y2Zh'});

  Map<String, String> toMap() => {
        'grant_type': grantType,
        'client_id': clientId,
        'client_secret': clientSecret,
      };
}

class LoginErrorResponse {
  final int code;
  final String codeDesc;
  final String description;
  final String message;

  LoginErrorResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        codeDesc = json['codeDesc'],
        description = json['message'],
        message = json['message'];
}
