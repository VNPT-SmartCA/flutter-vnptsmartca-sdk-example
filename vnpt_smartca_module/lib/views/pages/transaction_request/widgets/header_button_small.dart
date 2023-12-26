// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class HeaderButtonSmall extends StatelessWidget {
  const HeaderButtonSmall(
      {Key? key,
      required this.title,
      required this.onCallBack,
      this.enableFeedback = true,
      this.margin,
      this.backgroundColor,
      this.buttonStyle,
      this.textStyle,
      this.borderColor,
      this.paddingBtn,
      this.icon})
      : super(key: key);

  final String title;
  final VoidCallback onCallBack;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final Color? borderColor;
  final bool enableFeedback;
  final double? paddingBtn;
  final Widget? icon;

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
        const EdgeInsets.all(2.0),
      ),
      side: MaterialStateProperty.all(
        BorderSide(
          width: 1,
          color: borderColor ?? const Color.fromRGBO(222, 155, 57, 1.0),
        ),
      ),
    );
    return Container(
      width: 95.0,
      height: 26.0,
      margin: margin ?? const EdgeInsets.all(0.0),
      child: ElevatedButton.icon(
        style: buttonStyle != null ? buttonStyle?.merge(btnStyles) : btnStyles,
        onPressed: onCallBack,
        icon: icon ?? SizedBox.shrink(),
        label: Text(
          title,
          style: textStyle ??
              mainTheme.textTheme.labelSmall?.copyWith(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ), // <-- Text
      ),
    );
  }
}
