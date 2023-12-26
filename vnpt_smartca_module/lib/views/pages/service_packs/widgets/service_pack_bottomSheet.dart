import 'package:flutter/material.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/color.dart';
import 'package:intl/intl.dart';
import '../../../widgets/button_general.dart';

class ServicePackBottomSheetItem extends StatelessWidget {
  final double subtotalPrice;
  final int subtotalSignturn;
  final String accountSignType;
  final Function onRedirectToServicePackPorder;

  const ServicePackBottomSheetItem(
      {Key? key,
      required this.subtotalPrice,
      required this.subtotalSignturn,
      required this.accountSignType, required this.onRedirectToServicePackPorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        const SizedBox(
          height: 10,
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
        (accountSignType != '0')
            ? Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ButtonGeneral(
                  margin: const EdgeInsets.all(0),
                  title: AppLocalizations.of(context).Continue,
                  backgroundColor: HexColor("#DE9B39"),
                  borderColor: HexColor("#DE9B39"),
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                  onCallBack: () => onRedirectToServicePackPorder(),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
