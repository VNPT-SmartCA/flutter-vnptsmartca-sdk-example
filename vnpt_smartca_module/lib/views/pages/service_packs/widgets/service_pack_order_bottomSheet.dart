import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/color.dart';
import '../../../widgets/button_general.dart';

class ServicePackOrderBottomSheetItem extends StatelessWidget {
  final double subtotalPrice;
  final int subtotalSignturn;
  final Function onCreatePersonalSignTurnOrder;

  const ServicePackOrderBottomSheetItem(
      {Key? key,
      required this.subtotalPrice,
      required this.subtotalSignturn, required this.onCreatePersonalSignTurnOrder})
      : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 6,
                child: Text(
                  AppLocalizations.of(context).service_pack_total_amount,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#5E6476")),
                )),
            Expanded(
                flex: 3,
                child: Text(
                  AppLocalizations.of(context).service_pack_total_signature,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#5E6476")),
                )),
            Text(
              // ignore: unnecessary_string_interpolations
              "${subtotalSignturn.toString().padLeft(2, "0")}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: HexColor("#0C5CA8")),
            )
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
                  .format(subtotalPrice),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: HexColor("#0C5CA8")),
            ),
            Text(
              AppLocalizations.of(context).service_pack_vat_included,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#5E6476")),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ButtonGeneral(
                margin: EdgeInsets.all(0),
                title: AppLocalizations.of(context).back,
                backgroundColor: Colors.white,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: const Color.fromRGBO(222, 155, 57, 1.0)),
                onCallBack: () => Get.back(),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: ButtonGeneral(
                margin: EdgeInsets.all(0),
                backgroundColor: HexColor("#DE9B39"),
                borderColor: HexColor("#DE9B39"),
                title: AppLocalizations.of(context).btnPayment,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
                onCallBack: () => onCreatePersonalSignTurnOrder(),
              ),
            )
          ],
        )
      ],
    );
  }
}