import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../static.dart';

class Controller extends GetxController {
  var timerStatus = TimerStatus.stopped.obs;
  var countDownController = CountDownController().obs;

  setRunning() {
    if (kDebugMode) {
      print('setRunning');
    }
    if (timerStatus.value == TimerStatus.stopped) {
      countDownController.value.restart(duration: 90);
    } else {
      countDownController.value.resume();
    }
    timerStatus.value = TimerStatus.running;
  }

  setPaused() {
    if (kDebugMode) {
      print('setPaused');
    }
    timerStatus.value = TimerStatus.paused;
    countDownController.value.pause();
  }

  setStopped() {
    if (kDebugMode) {
      print('setStopped');
    }
    timerStatus.value = TimerStatus.stopped;
    countDownController.value.restart(duration: 0);
    countDownController.value.pause();
  }
}
