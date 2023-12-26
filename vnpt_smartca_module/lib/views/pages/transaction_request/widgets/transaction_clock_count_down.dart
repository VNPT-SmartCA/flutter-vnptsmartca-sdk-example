// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../core/models/response/transaction_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../utils/color.dart';
import '../../../widgets/circular_count_down_timer.dart';

class TransactionClockCountDown extends StatelessWidget {
  const TransactionClockCountDown(
      {Key? key,
      required this.model,
      required this.onComplete,
      required this.countDownController,
      required this.isShowResult})
      : super(key: key);

  final TransactionModel model;
  final Function onComplete;
  final CountDownController countDownController;
  final bool isShowResult;

  final double _iconSize = 60.0;

  @override
  Widget build(BuildContext context) {
    if (!isShowResult || model.tranType == 5) {
      return SizedBox(
          height: 26,
          child:
              Assets.images.appIcon.image(height: _iconSize, width: _iconSize));
    }

    if (model.getDuration() < 1) return SizedBox();

    return CircularCountDownTimer(
      duration: model.getDuration(),

      // Countdown initial elapsed Duration in Seconds.
      initialDuration: 0,

      // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
      controller: countDownController,

      // Text Style for Countdown Text.
      textStyle: TextStyle(
          fontSize: 14.0,
          color: HexColor("#FF9843"),
          fontWeight: FontWeight.w500),

      // Format for the Countdown Text.
      textFormat: CountdownTextFormat.MM_SS,

      // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
      isReverse: true,

      // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
      isReverseAnimation: false,

      // Handles visibility of the Countdown Text.
      isTimerTextShown: true,

      // Handles the timer start.
      autoStart: true,

      // This Callback will execute when the Countdown Starts.
      // ignore: prefer-extracting-callbacks
      onStart: () {
        // Here, do whatever you want
        debugPrint('Countdown Started');
      },

      // This Callback will execute when the Countdown Ends.
      // ignore: prefer-extracting-callbacks
      onComplete: () => onComplete(model),
    );
  }
}
