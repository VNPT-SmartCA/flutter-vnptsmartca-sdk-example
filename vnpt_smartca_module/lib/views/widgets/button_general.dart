import 'package:flutter/material.dart';
import '../theme/theme.dart';

class ButtonGeneral extends StatelessWidget {
  const ButtonGeneral({
    Key? key,
    required this.title,
    required this.onCallBack,
    this.enableFeedback = true,
    this.margin,
    this.backgroundColor,
    this.buttonStyle,
    this.textStyle,
    this.borderColor,
    this.paddingBtn
  }) : super(key: key);

  final String title;
  final VoidCallback onCallBack;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final Color? borderColor;
  final bool enableFeedback;
  final double? paddingBtn;

  @override
  Widget build(BuildContext context) {
    ButtonStyle btnStyles = ButtonStyle(
      splashFactory:
          enableFeedback ? InkRipple.splashFactory : NoSplash.splashFactory,
      backgroundColor: MaterialStateProperty.all(
        backgroundColor ?? const Color.fromRGBO(222, 155, 57, 1.0),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 8.0),
      ),
      side: MaterialStateProperty.all(
        BorderSide(
          width: 1,
          color: borderColor ?? const Color.fromRGBO(222, 155, 57, 1.0),
        ),
      ),
    );
    return Container(
      margin: margin ?? const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: onCallBack,
        style: buttonStyle != null ? buttonStyle?.merge(btnStyles) : btnStyles,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle ??
                  mainTheme.textTheme.bodyText2?.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                   ),
            ),
          ],
        ),
      ),
    );
  }
}
