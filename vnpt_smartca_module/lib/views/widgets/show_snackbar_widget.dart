import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBarWidget(
    {required String message,
    int? duration,
    Widget? icon,
    Color? backgroundColor,
    SnackPosition? snackPosition}) {
  if (Get.isSnackbarOpen) Get.back(closeOverlays: true);

  final snackBar = GetSnackBar(
    backgroundColor: backgroundColor ?? Theme.of(Get.context!).errorColor,
    duration: duration == null ? null : Duration(seconds: duration),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 65),
    padding: const EdgeInsets.all(15),
    borderRadius: 6,
    icon: icon,
    messageText: Text(
      message,
      style: const TextStyle(fontSize: 15, color: Colors.white),
    ),
    snackStyle: SnackStyle.FLOATING,
    isDismissible: true,
    shouldIconPulse: true,
    snackPosition: snackPosition ?? SnackPosition.BOTTOM,
    mainButton: IconButton(
      onPressed: () {
        if (Get.isSnackbarOpen) Get.closeCurrentSnackbar();
      },
      icon: const Icon(Icons.close),
      color: Colors.white,
    ),
  );

  Get.showSnackbar(snackBar);
}
