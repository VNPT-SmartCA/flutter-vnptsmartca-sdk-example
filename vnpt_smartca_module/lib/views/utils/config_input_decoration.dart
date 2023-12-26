// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_function_declarations_over_variables

import 'package:flutter/material.dart';

class ConfigInputDecoration {
  InputDecoration config(String hintText, {Widget? suffixIcon, Color? fillColor, Color? borderColor}) {
    return InputDecoration(
        isDense: true,
        labelText: hintText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: borderColor == null ? BorderSide(
              width: 0,
              style: BorderStyle.none) : BorderSide(
              width: 0.5, color: borderColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: borderColor == null ? BorderSide(
              width: 0,
              style: BorderStyle.none) : BorderSide(
              width: 0.5, color: borderColor),
        ),
        filled: true,
        counterText: "",
        errorMaxLines: 3,
        contentPadding: EdgeInsets.all(12),
        labelStyle: TextStyle(color: Color(0xffA5B0C2), fontSize: 14),
        hintStyle: TextStyle(color: Color(0xffA5B0C2), fontSize: 14),
        fillColor: fillColor ?? Color(0xffF2F6FA),
        suffixIcon: suffixIcon);
  }
}
