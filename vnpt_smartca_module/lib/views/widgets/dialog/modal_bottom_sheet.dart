import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../theme/styles/app_colors.dart';
import '../../widgets/widget.dart';

class CustomBottomSheetDialog {
  static Future show(
      {bool? isScrollControlled,
      required WidgetBuilder childBuilder,
      String? title}) {
    return showModalBottomSheet(
      isScrollControlled: isScrollControlled ?? false,
      context: Get.context!,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: BaseText(
                          title,
                          color: const Color(0xff08285C),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Assets.images.icQrClose.image(
                                  width: 20, color: const Color(0xff6D6D6D)))),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: const Color(0xffE0E0E0),
                ),
                childBuilder.call(context)
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<DateTime?> showDatePicker(
    context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    CupertinoDatePickerMode? mode,
  }) {
    firstDate = firstDate ?? DateTime(1900);
    lastDate = lastDate ?? DateTime(2100);
    initialDate = initialDate ?? DateTime.now();

    if (initialDate.isAfter(lastDate)) {
      initialDate = lastDate;
    }
    if (initialDate.isBefore(firstDate)) {
      initialDate = firstDate;
    }
    var valueSelect = initialDate;
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) => Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10))),
              height: 500,
              child: Column(
                children: [
                  Container(
                    height: 400,
                    color: AppColors.white,
                    child: CupertinoDatePicker(
                        mode: mode ?? CupertinoDatePickerMode.date,
                        minimumDate: firstDate,
                        maximumDate: lastDate,
                        initialDateTime: initialDate,
                        onDateTimeChanged: (value) {
                          valueSelect = value;
                        }),
                  ),
                  CupertinoButton(
                    child: BaseText(
                      AppLocalizations.current.confirm,
                      fontSize: 16,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(valueSelect);
                    },
                  )
                ],
              ),
            ));
  }
}
