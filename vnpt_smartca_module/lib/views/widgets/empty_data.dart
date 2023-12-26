import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/utils/color.dart';

class EmptyData extends StatelessWidget {
  final String? title;
  final String? description;
  final Function? callback;
  const EmptyData({Key? key, this.title, this.description, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Get.mediaQuery.size.height * 0.85,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 150.0),
          Assets.images.icCloudUpload.image(
              width: 32,
              height: 32,
              fit: BoxFit.fill,
              color: HexColor("#0D75D6")),
          const SizedBox(height: 10.0),
          Text(
            (title ?? AppLocalizations.of(context).emptyData),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: HexColor("#5E6476")),
            textAlign: TextAlign.center,
          ),
          Text(
            (description ?? ''),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: HexColor("#5E6476")),
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
