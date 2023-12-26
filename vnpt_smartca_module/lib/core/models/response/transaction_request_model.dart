import 'package:vnpt_smartca_module/views/utils/datetime_format.dart';

import '../../../views/i18n/generated_locales/l10n.dart';

class TransactionRequestModel {
  final String refTransactionId;
  final String tranId;
  final String credentialId;
  final DateTime reqTime;
  final String reqTimeString;
  final int expiredIn;
  final int challengeId;
  final String challenge;
  final String fileType;
  final String contentType;
  final String fileName;
  final String fileSize;
  final String appName;
  final String relyPartyId;
  final int tranStatus;
  final String tranStatusDesc;
  final int tranType;
  final String tranTypeDesc;
  final String content;
  // final int verifyStatus;
  final String sub;
  final String signReqId;
  final String tranDesc;
  final List<dynamic> docs;
  final DateTime startTime;

  TransactionRequestModel(
      this.refTransactionId,
      this.tranId,
      this.credentialId,
      this.reqTime,
      this.reqTimeString,
      this.expiredIn,
      this.challengeId,
      this.challenge,
      this.fileType,
      this.contentType,
      this.fileName,
      this.fileSize,
      this.appName,
      this.relyPartyId,
      this.tranStatus,
      this.tranStatusDesc,
      this.tranType,
      this.tranTypeDesc,
      this.content,
      //this.verifyStatus,
      this.sub,
      this.signReqId,
      this.tranDesc,
      this.docs,
      this.startTime);

  TransactionRequestModel.fromMap(Map<String, dynamic> json)
      : refTransactionId = json['refTransactionId'] ?? '',
        tranId = json['tranId'] ?? '',
        credentialId = json['credentialId'] ?? '',
        challengeId = json['challengeId'] ?? 0,
        challenge = json['challenge'] ?? '',
        fileType = json['fileType'] ?? '',
        contentType = json['contentType'] ?? '',
        fileName = json['fileName'] ?? '',
        fileSize = json['fileSize'] ?? '',
        appName = json['appName'] ?? '',
        relyPartyId = json['relyPartyId'] ?? '',
        tranStatus = json['tranStatus'] ?? 0,
        tranStatusDesc = json['tranStatusDesc'] ?? '',
        tranType = json['tranType'] ?? 0,
        tranTypeDesc = json['tranTypeDesc'] ?? '',
        content = json['content'] ?? '',
        sub = json['sub'] ?? '',
        signReqId = json['signReqId'] ?? '',
        tranDesc = json['tranDesc'] ?? '',
        reqTime = DateTime.parse(json['reqTime']).toLocal(),
        startTime = DateTime.now(),
        reqTimeString = json['reqTime'],
        expiredIn = json['expiredIn'],
        docs = json['docs'] ?? [];

  int getDuration() {
    var now = DateTime.now();
    var endTime = startTime.add(Duration(seconds: expiredIn));

    var diffTime = endTime.difference(now).inSeconds;
    return diffTime;
  }

  String reqTimeStr() {
    return DatetimeFormat().formatDateTime(reqTimeString);
  }

  String get tranTypeDescription {
    switch (tranType) {
      case 1:
        return AppLocalizations.current.signer;
      case 2:
        return AppLocalizations.current.sign;
      case 3:
        return AppLocalizations.current.hashSign;
      case 4:
        return AppLocalizations.current.pinDialogButton;
      case 5:
        return AppLocalizations.current.activateButton;
      default:
        return '';
    }
  }
}

class CallBackParams {
  bool isComplete;
  TransactionRequestModel model;
  CallBackParams({this.isComplete = false, required this.model});
}
