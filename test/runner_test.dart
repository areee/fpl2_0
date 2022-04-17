import 'package:flutter_test/flutter_test.dart';
import 'package:fpl2_0/models/count_down_runner.dart';

void main() {
  test('starting runner starts it', () {
    final runner = CountDownRunner();
    final startingStatus = runner.status;
    runner.addListener(() {
      expect(runner.status, startingStatus);
    });
    runner.setRunning();
  });
}
