import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../static.dart';

class Runner with ChangeNotifier {
  var status = Status.stopped;
  var countDownController = CountDownController();

  void setRunning() {
    if (status == Status.stopped) {
      countDownController.restart(duration: 90);
    } else {
      countDownController.resume();
    }
    status = Status.running;
    notifyListeners();
  }

  void setPaused() {
    status = Status.paused;
    countDownController.pause();
    notifyListeners();
  }

  void setStopped() {
    status = Status.stopped;
    countDownController.restart(duration: 0);
    countDownController.pause();
    notifyListeners();
  }
}
