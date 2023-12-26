import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/color.dart';

class EmptyData extends StatefulWidget {
  final String message;
  const EmptyData({Key? key, required this.message}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EmptyDataState createState() => _EmptyDataState();
}

class _EmptyDataState extends State<EmptyData> {
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
            widget.message != '' ? widget.message : AppLocalizations.of(context).emptyData,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: HexColor("#5E6476")),
            textAlign: TextAlign.center,
          ),
          Text(
            AppLocalizations.of(context).empty_description,
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
