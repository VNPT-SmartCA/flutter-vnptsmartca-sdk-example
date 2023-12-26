import 'package:flutter/material.dart';

class SignatureSetting {
  Map<int, PageSetting> pageSetting;
  String? signatureImg;
  String filename;

  SignatureSetting({
    this.signatureImg,
    required this.filename,
    required this.pageSetting,
  });
}

class PageSetting {
  int pageIndex;
  Size pageSize;
  double height;
  double width;
  double viewPortWidth;
  double viewPortHeight;
  double ptop;
  double pleft;
  PageSetting({
    required this.pageIndex,
    required this.pageSize,
    required this.height,
    required this.width,
    required this.viewPortWidth,
    required this.viewPortHeight,
    required this.ptop,
    required this.pleft,
  });
}
