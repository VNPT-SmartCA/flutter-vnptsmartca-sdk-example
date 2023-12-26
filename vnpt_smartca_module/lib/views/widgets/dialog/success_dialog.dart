import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/styles.dart';
import '../../theme/theme.dart';
import '../../widgets/button_general.dart';

class SuccessDialog extends StatelessWidget {
  final bool showIcon;
  final String title;
  final String description;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback callback;
  final VoidCallback? iconCallback;
  final bool isAutoHide;
  const SuccessDialog({
    Key? key,
    this.showIcon = true,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.callback,
    required this.buttonColor,
    required this.isAutoHide,
    this.iconCallback,
  }) : super(key: key);

  final _orderSuccessIcon = 'assets/svg/order_success.svg';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: showIcon,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.close_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  onPressed: iconCallback ??
                      () {
                        Navigator.of(context).pop(context);
                      },
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
                        _orderSuccessIcon,
                        width: 60,
                        height: 60,
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                title,
                style: mainTheme.textTheme.headline6!
                    .copyWith(color: Colors.black),
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
                  text: description,
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
            isAutoHide
                ? const SizedBox(
                    height: 20,
                  )
                : ButtonGeneral(
                    title: buttonText,
                    onCallBack: callback,
                  ),
          ],
        )
      ],
    );
  }
}
