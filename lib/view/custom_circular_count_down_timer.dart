import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/runner.dart';

class CustomCircularCountDownTimer extends StatelessWidget {
  const CustomCircularCountDownTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      duration: 90,
      initialDuration: 0,
      fillColor: Theme.of(context).colorScheme.secondary,
      ringColor: Colors.grey[300]!,
      controller: context.watch<Runner>().countDownController,
      ringGradient: null,
      fillGradient: null,
      backgroundColor: Theme.of(context).colorScheme.primary,
      backgroundGradient: null,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: const TextStyle(
        fontSize: 33.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: false,
      onStart: () {
        if (kDebugMode) {
          print('Countdown Started');
        }
      },
      onComplete: () {
        if (kDebugMode) {
          print('Countdown Completed');
        }
      },
    );
  }
}
