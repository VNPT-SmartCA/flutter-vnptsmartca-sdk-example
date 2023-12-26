// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../configs/app_config.dart';
import '../../../gen/assets.gen.dart';

class BottomLogo extends StatelessWidget {
  const BottomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child:
          Assets.images.vnptEidas.svg(height: 20, package: AppConfig.package),
    );
  }
}
