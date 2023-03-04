import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:emoji_alert/arrays.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';
import '../static.dart';

class CustomCircularCountDownTimer extends StatelessWidget {
  const CustomCircularCountDownTimer({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final Controller c = Get.find();

    return CircularCountDownTimer(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      duration: c.timerDuration.value,
      initialDuration: 0,
      fillColor: Theme.of(context).colorScheme.secondary,
      ringColor: Colors.grey[300]!,
      controller: c.countDownController.value,
      ringGradient: null,
      fillGradient: null,
      backgroundColor: Theme.of(context).colorScheme.primary,
      backgroundGradient: null,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: Theme.of(context).textTheme.displaySmall,
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

        if (c.timerStatus.value == TimerStatus.running) {
          c.timerStatus.value = TimerStatus.stopped;

          EmojiAlert(
              emojiType: EMOJI_TYPE.WINK,
              background: Theme.of(context).colorScheme.background,
              enableMainButton: true,
              mainButtonText: Text(
                'Close',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              mainButtonColor: Theme.of(context).colorScheme.primary,
              onMainButtonPressed: () {
                Get.back();
              },
              description: Column(
                children: [
                  Text(
                    'Time\'s up',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              )).displayAlert(context);
        }
      },
    );
  }
}
