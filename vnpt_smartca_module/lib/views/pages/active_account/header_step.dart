// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class HeaderStep extends StatelessWidget {
  final int step;
  final AssetGenImage? customImageStep;

  const HeaderStep({Key? key, required this.step, this.customImageStep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetGenImage imgStep = Assets.images.stepOne;
    switch (step) {
      case 2:
        imgStep = Assets.images.stepTwo;
        break;
      case 3:
        imgStep = Assets.images.stepThree;
        break;
      case 4:
        imgStep = Assets.images.stepFour;
        break;
      default:
        imgStep = Assets.images.stepOne;
        break;
    }
    if (customImageStep != null) {
      imgStep = customImageStep!;
    }
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xffFAFBFF),
        boxShadow: [
          BoxShadow(
            color: Color(0xff1A3478).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: imgStep.image(
          width: 276,
          height: 26,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
