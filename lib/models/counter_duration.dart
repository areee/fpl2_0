import 'package:flutter/material.dart';

class CounterDuration with ChangeNotifier {
  int _duration = 90;

  int get duration => _duration;

  void setDuration(int duration) {
    _duration = duration;
    notifyListeners();
  }
}
