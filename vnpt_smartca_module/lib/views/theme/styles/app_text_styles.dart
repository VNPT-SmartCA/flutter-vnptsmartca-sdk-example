import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle title = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle body = const TextStyle(
    fontSize: 13,
    color: Colors.grey,
  );

  static const TextStyle fontWeight500 = TextStyle(fontWeight: FontWeight.w500);

  static TextStyle text400(
      {double fontSize = 22, Color color = Colors.black87}) {
    return TextStyle(
        fontWeight: FontWeight.w400, fontSize: fontSize, color: color);
  }

  static TextStyle text500(
      {double fontSize = 22, Color color = Colors.black87}) {
    return TextStyle(
        fontWeight: FontWeight.w500, fontSize: fontSize, color: color);
  }
}
