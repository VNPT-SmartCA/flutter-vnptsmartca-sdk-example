import 'package:flutter/material.dart';

class AppBoxShadows {
  static boxShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.12),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    );
  }
}
