import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../theme/styles.dart';
import '../../theme/theme.dart';
import '../../widgets/button_general.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? popupTitle;
  final String? description;
  final String buttonText;
  final bool showIcon;
  final bool showCloseIcon;
  final VoidCallback callback;

  const CustomAlertDialog({
    Key? key,
    this.popupTitle,
    required this.buttonText,
    required this.callback,
    this.description,
    this.showIcon = true,
    this.showCloseIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showCloseIcon
                ? Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close_outlined,
                        color: Colors.grey,
                        size: 30,
                      ),
                      onPressed: () =>Get.back(canPop: true, closeOverlays: true),
                    ),
                  )
                : const SizedBox(
                    height: 30,
                  ),
            showIcon
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 30,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/alert_icon.svg',
                              width: 60,
                              height: 60,
                            ),
                          ]),
                    ),
                  )
                : const SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppGap.g8),
              child: Text(
                AppLocalizations.current.Notice,
                style: mainTheme.textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppGap.g16,
                right: AppGap.g16,
                top: AppGap.g8,
              ),
              child: RichText(
                text: TextSpan(
                  text: description ?? '',
                  children: [
                    TextSpan(
                      text: '',
                      style: mainTheme.textTheme.bodyText2,
                    ),
                  ],
                  style: mainTheme.textTheme.bodyText2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ButtonGeneral(
              title: buttonText,
              onCallBack: callback,
              backgroundColor: Color(0xff0D75D6),
              borderColor: Color(0xff0D75D6),
            ),
          ],
        )
      ],
    );
  }
}
