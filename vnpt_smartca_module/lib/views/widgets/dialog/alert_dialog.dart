import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../i18n/generated_locales/l10n.dart';
import '../button_general.dart';

class YesNoDialog extends StatefulWidget {
  final String description;
  final String buttonText;
  final VoidCallback callback;

  YesNoDialog({required this.description, required this.buttonText, required this.callback});
  @override
  _YesNoDialogState createState() => _YesNoDialogState();
}
class _YesNoDialogState extends State<YesNoDialog> {
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                AppLocalizations.current.Notice,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
              ),
              child: RichText(
                text: TextSpan(
                  text: widget.description != null
                      ? widget.description
                      : AppLocalizations.current.serviceSomethingWentWrong,
                  children: [
                    const TextSpan(
                      text: '',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ButtonGeneral(
                      margin: const EdgeInsets.all(0),
                      title: AppLocalizations.current.canceled,
                      onCallBack: () {
                        Navigator.pop(context);
                      }),
                  flex: 1,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ButtonGeneral(
                    margin: const EdgeInsets.all(0),
                    title: AppLocalizations.current.agree,
                    backgroundColor: Colors.white,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: const Color.fromRGBO(222, 155, 57, 1.0)),
                    onCallBack: widget.callback,
                  ),
                  flex: 1,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}

class AlertSuccessDialog extends StatefulWidget {
  final String popupTitle;
  final String description;
  final String buttonText;
  final bool showIcon;
  final bool showCloseIcon;
  final VoidCallback callback;
  AlertSuccessDialog({
    required this.popupTitle,
    required this.description,
    required this.buttonText,
    required this.callback,
    this.showIcon = true,
    this.showCloseIcon = true,
  });

  @override
  _AlertSuccessDialogState createState() => _AlertSuccessDialogState();
}

class _AlertSuccessDialogState extends State<AlertSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.showCloseIcon
                ? Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.close_outlined,
                  color: Colors.grey,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
                : const SizedBox(
              height: 30,
            ),
            widget.showIcon
                ? Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 0, horizontal: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/order_success.svg',
                        width: 80,
                        height: 80,
                      ),
                    ]),
              ),
            )
                : const SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                widget.popupTitle == ''
                    ? AppLocalizations.current.Notice
                    : widget.popupTitle,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
              ),
              child: RichText(
                text: TextSpan(
                  text: widget.description != null
                      ? widget.description
                      : AppLocalizations.current.serviceSomethingWentWrong,
                  children: [
                    const TextSpan(
                      text: '',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ButtonGeneral(
                title: widget.buttonText, onCallBack: widget.callback),
          ],
        )
      ],
    );
  }
}