import 'dart:ui';

import '../../../views/i18n/generated_locales/l10n.dart';
import 'personal_sign_turn_pricing_info.dart';

class ServicePackOrderHistoryItem {
  String? id;
  int? paymentStatus;
  String? paymentStatuDesc;
  int? totalMonney;
  int? totalSignTurn;
  int? status;
  PersonalSignTurnPricingInfo? pricings;

  ServicePackOrderHistoryItem(
      {this.id,
      this.paymentStatus,
      this.paymentStatuDesc,
      this.totalMonney,
      this.totalSignTurn,
      this.pricings});

  ServicePackOrderHistoryItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
      paymentStatus = json['paymentStatus'],
        paymentStatuDesc = json['paymentStatuDesc'],
        totalMonney = json['totalMonney'],
        totalSignTurn = json['totalSignTurn'],
        status = json["status"],
        pricings = json['pricings'] != null
            ? PersonalSignTurnPricingInfo.fromJson(json['pricings'])
            : null;

  String get textStatus {
    switch (status) {
      case 100:
        return AppLocalizations.current.order_success;
      case 99:
        return AppLocalizations.current.order_canceled;
      case 1:
        return AppLocalizations.current.order_paid;
      case 0:
        return AppLocalizations.current.order_new;
      default:
        return AppLocalizations.current.order_new;
    }
  }

  Color get colorStatus {
    switch (status) {
      case 100:
        return const Color.fromRGBO(23, 165, 20, 0.7);
      case 99:
        return const Color.fromRGBO(222, 155, 57, 0.7);
      case 1:
        return const Color.fromRGBO(175, 9, 9, 0.7);
      case 0:
        return const Color.fromRGBO(175, 9, 9, 0.7);
      default:
        return const Color.fromRGBO(222, 155, 57, 0.7);
    }
  }
}
