import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../theme/theme.dart';
import '../button_general.dart';

class SuccessChangeDialog extends StatefulWidget {
  final bool showIcon;
  final String title;
  final String description;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback callback;

  SuccessChangeDialog({
    this.showIcon = true,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.callback,
    required this.buttonColor,
  });

  @override
  _SuccessChangeDialogState createState() => _SuccessChangeDialogState();
}

class _SuccessChangeDialogState extends State<SuccessChangeDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //List<String> listFile = [];
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: widget.showIcon,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close_outlined,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
                  onPressed: onExit,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                widget.title != null ? widget.title : '',
                style: mainTheme.textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 8,
              ),
              child: RichText(
                text: TextSpan(
                  text: widget.description != null
                      ? widget.description
                      : AppLocalizations.current.serviceSomethingWentWrong,
                  children: [
                    TextSpan(
                      text: '',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          ),
                    ),
                  ],
                  //style: MainTheme.theme.textTheme.bodyText2,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5, top: 5)),
            ButtonGeneral(title: widget.buttonText, onCallBack: onExit)
          ],
        ),
      ],
    );
  }

  void onExit() {}
}
