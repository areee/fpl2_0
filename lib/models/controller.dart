import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';

import '../static.dart';

class Controller extends GetxController {
  var status = Status.stopped.obs;
  var countDownController = CountDownController().obs;

  setRunning() {
    if (status.value == Status.stopped) {
      countDownController.value.restart(duration: 90);
    } else {
      countDownController.value.resume();
    }
    status.value = Status.running;
  }

  setPaused() {
    status.value = Status.paused;
    countDownController.value.pause();
  }

  setStopped() {
    status.value = Status.stopped;
    countDownController.value.restart(duration: 0);
    countDownController.value.pause();
  }
}
