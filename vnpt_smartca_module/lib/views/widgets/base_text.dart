// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../gen/fonts.gen.dart';

class BaseText extends StatelessWidget {
  final dynamic text;
  final bool isRequired;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final String fontFamily;
  final int? maxLines;
  final double? height;
  final FontStyle? fontStyle;
  final TextOverflow? textOverflow;

  const BaseText(this.text,
      {Key? key,
      this.isRequired = false,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w400,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.fontFamily = FontFamily.inter,
      this.maxLines,
      this.height,
      this.fontStyle,
      this.textOverflow = TextOverflow.visible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isRequired
        ? RichText(
            textAlign: textAlign,
            maxLines: maxLines,
            text: TextSpan(
              text: text?.toString() ?? "",
              style: TextStyle(
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                fontSize: fontSize,
                fontStyle: fontStyle,
                color: color,
                height: height ?? 1.35,
                overflow: TextOverflow.visible,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    fontStyle: fontStyle,
                    color: Color(0xffE51F1F),
                    height: height,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          )
        : Text(
            text?.toString() ?? "",
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              color: color,
              height: height ?? 1.35,
            ),
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: textOverflow ?? TextOverflow.ellipsis,
            softWrap: true,
          );
  }
}
