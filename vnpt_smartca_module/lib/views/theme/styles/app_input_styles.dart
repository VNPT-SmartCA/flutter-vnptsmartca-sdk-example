import 'package:flutter/material.dart';

class AppInputStyles {
  static InputDecoration inputDecoration(
      {String? hintText, IconData? prefixIcon}) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.all(2),
      border: const OutlineInputBorder(),
      hintText: hintText,
      counterText: "",
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(
              color: Color.fromRGBO(202, 209, 215, 1.0),
              style: BorderStyle.solid)),
    );
  }
}
