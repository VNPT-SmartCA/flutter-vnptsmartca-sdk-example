class AccountActivationModel {
  String uid;
  String activationCode;
  String password;
  String rePassword;

  AccountActivationModel(
      {required this.uid,
      required this.activationCode,
      required this.password,
      required this.rePassword});
}
