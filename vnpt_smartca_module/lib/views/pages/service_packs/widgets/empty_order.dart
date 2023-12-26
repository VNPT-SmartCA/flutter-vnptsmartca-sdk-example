import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/color.dart';

class EmptyOrder extends StatefulWidget {
 const EmptyOrder({Key? key}) : super(key: key);
 
  @override
  // ignore: library_private_types_in_public_api
  _EmptyOrderState createState() => _EmptyOrderState();
}

class _EmptyOrderState extends State<EmptyOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/order_empty.svg",
            height: 96,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            AppLocalizations.of(context).emptyData,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: HexColor("#5E6476")),
            textAlign: TextAlign.center,
          ),
          Text(
            '',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: HexColor("#5E6476")),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
