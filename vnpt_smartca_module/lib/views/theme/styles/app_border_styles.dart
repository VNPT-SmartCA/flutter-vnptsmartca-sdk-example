import 'package:flutter/material.dart';

class AppBorderStyles {
  static border({double width = 1}) {
    return Border.all(color: Colors.grey.shade300, width: width);
  }

  static borderRadius(double border) {
    return BorderRadius.all(
      Radius.circular(border),
    );
  }
}
