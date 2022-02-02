import 'package:flutter/material.dart';

import '../static.dart';

class Runner with ChangeNotifier {
  Status status = Status.stopped;
  int timerDuration = 90;

  void setRunning() {
    status = Status.running;
    notifyListeners();
  }

  void setPaused() {
    status = Status.paused;
    notifyListeners();
  }

  void setStopped() {
    status = Status.stopped;
    notifyListeners();
  }

  void setTimerDuration(int duration) {
    timerDuration = duration;
    notifyListeners();
  }
}
