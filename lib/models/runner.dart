import 'package:flutter/material.dart';

import '../static.dart';

class Runner with ChangeNotifier {
  Status status = Status.stopped;

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
}
