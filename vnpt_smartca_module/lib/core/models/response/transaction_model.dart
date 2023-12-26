// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/widgets/app_refresh.dart';
import '../../extensions/datetime_format.dart';

class TransactionModel extends AppRefreshModel {
  final String tranId;
  final String credentialId;
  final DateTime reqTime;
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
  final int verifyStatus;
  final String sub;
  final String signReqId;
  final String tranDesc;
  final List<dynamic> docs;
  DateTime startTime;
  String refTransactionId;

  TransactionModel(
    this.tranId,
    this.credentialId,
    this.reqTime,
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
    this.verifyStatus,
    this.sub,
    this.signReqId,
    this.tranDesc,
    this.docs,
    this.startTime,
    this.refTransactionId,
  ) : super('');

  // - Phân loại giao dịch TranTypes
  // INITIAL = 1
  // SIGN = 2
  // SIGNHASH = 3
  // VERIFY = 4
  // ACCEPTATNCE = 5
  // SIGNHASH_769 = 6
  // SIGNHASH_ESEAL = 7
  // SIGNHASH_ESEAL_AUTO = 8
  bool isSignHash() {
    return [1, 3, 6, 7, 8].contains(tranType);
  }

  int getDuration() {
    var now = DateTime.now();
    var endTime = startTime.add(Duration(seconds: expiredIn));

    var diffTime = endTime.difference(now).inSeconds;
    return diffTime;
  }

  Map<String, dynamic> toMap() {
    return {
      'tranId': tranId,
      'credentialId': credentialId,
      'reqTime': reqTime.millisecondsSinceEpoch,
      'expiredIn': expiredIn,
      'challengeId': challengeId,
      'challenge': challenge,
      'fileType': fileType,
      'contentType': contentType,
      'fileName': fileName,
      'fileSize': fileSize,
      'appName': appName,
      'relyPartyId': relyPartyId,
      'tranStatus': tranStatus,
      'tranStatusDesc': tranStatusDesc,
      'tranType': tranType,
      'tranTypeDesc': tranTypeDesc,
      'content': content,
      'verifyStatus': verifyStatus,
      'sub': sub,
      'signReqId': signReqId,
      'tranDesc': tranDesc,
      'docs': docs,
      'refTransactionId': refTransactionId,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      map['tranId'] ?? '',
      map['credentialId'] ?? '',
      DateTime.parse(map['reqTime']).toLocal(),
      map['expiredIn']?.toInt() ?? 0,
      map['challengeId']?.toInt() ?? 0,
      map['challenge'] ?? '',
      map['fileType'] ?? '',
      map['contentType'] ?? '',
      map['fileName'] ?? '',
      map['fileSize'] ?? '',
      map['appName'] ?? '',
      map['relyPartyId'] ?? '',
      map['tranStatus']?.toInt() ?? 0,
      map['tranStatusDesc'] ?? '',
      map['tranType']?.toInt() ?? 0,
      map['tranTypeDesc'] ?? '',
      map['content'] ?? '',
      map['verifyStatus']?.toInt() ?? 0,
      map['sub'] ?? '',
      map['signReqId'] ?? '',
      map['tranDesc'] ?? '',
      map['docs'] != null
          ? List<dynamic>.from(map['docs'])
          : map['documents'] != null
              ? List<dynamic>.from(map['documents'])
              : [],
      DateTime.now(),
      map['refTransactionId'] ?? '',
    );
  }

// docs = json['documents'];

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  static TransactionModel initModel = TransactionModel(
      '',
      '',
      DateTime.now(),
      0,
      0,
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      0,
      '',
      0,
      '',
      '',
      0,
      '',
      '',
      '',
      [],
      DateTime.now(),
      '');

  String get tranTypeDescription {
    switch (tranType) {
      case 1:
        return AppLocalizations.current.signerTranTypeDesc;
      case 2:
        return AppLocalizations.current.signTranTypeDesc;
      case 3:
      case 7:
      case 8:
        return AppLocalizations.current.hashSign;
      case 5:
        return AppLocalizations.current.acceptanceTranTypeDesc;
      case 6:
        return AppLocalizations.current.sign769TranTypeDesc;
      default:
        return '';
    }
  }

  Color get colorStatus {
    switch (tranStatus) {
      case 1:
        return const Color.fromRGBO(23, 165, 20, 0.7);
      case 4001:
        return const Color.fromRGBO(222, 155, 57, 0.7);
      case 4002:
        return const Color.fromRGBO(175, 9, 9, 0.7);
      default:
        return const Color.fromRGBO(222, 155, 57, 0.7);
    }
  }

  String get transTypeString {
    switch (tranType) {
      case 1:
        return AppLocalizations.current.signer;
      case 2:
        return AppLocalizations.current.sign;
      case 3:
        return AppLocalizations.current.hashSign;
      case 4:
        return AppLocalizations.current.authentication;
      case 5:
        return AppLocalizations.current.acceptance;
      default:
        return AppLocalizations.current.unknown;
    }
  }

  String get textStatus {
    switch (tranStatus) {
      case 1:
        return AppLocalizations.current.signedSuccess;
      case 4000:
        if (tranType != 5 && isExpired) {
          return AppLocalizations.current.expired;
        }
        return AppLocalizations.current.waitingForSignerConfirm;
      case 4001:
        return AppLocalizations.current.expired;
      case 4002:
        return AppLocalizations.current.canceled;
      default:
        return AppLocalizations.current.signFailed;
    }
  }

  String get transTypeIcon {
    switch (tranType) {
      case 1:
        return 'assets/svg/pen.svg';
      case 2:
        return 'assets/svg/chu_ky_active.svg';
      case 3:
        return 'assets/svg/file_hash.svg';
      case 4:
        return 'assets/svg/tick.svg';
      case 5:
        return 'assets/svg/note.svg';
      default:
        return 'assets/svg/tick.svg';
    }
  }

  String get reqTimeFormatted {
    // return DatetimeFormat().formatDateTime(reqTime.toString());
    return DatetimeFormat()
        .formatDateTime(DateFormat("yyyy-MM-dd HH:mm:ss").format(reqTime));
  }

  bool get isExpired {
    return reqTime
            .add(Duration(minutes: 5))
            .difference(DateTime.now())
            .inSeconds <
        0;
  }

  String getFormattedDate(String date) {
    /// Convert into local date format.
    var localDate = DateTime.parse(date).toLocal();

    /// inputFormat - format getting from api or other func.
    /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
    /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(localDate.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}
