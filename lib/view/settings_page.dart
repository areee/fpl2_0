import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../models/controller.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final Controller c = Get.find();
    final timerDurationController =
        TextEditingController(text: c.timerDuration.value.toString());
    // final box = GetStorage();

    _timerDurationListener() {
      final timerDurationText = timerDurationController.text;

      if (kDebugMode) {
        print('Output of the number field: $timerDurationText');
      }

      if (timerDurationText.isNotEmpty) {
        c.setTimerDuration(int.parse(timerDurationText));
      }
    }

    timerDurationController.addListener(_timerDurationListener);

    return Scaffold(
      appBar: customAppBar(context, const Text('Settings'), null),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('Change theme button clicked.');
                  }
                  // if (Get.isDarkMode) {
                  //   Get.changeTheme(ThemeData.light());
                  // } else {
                  //   Get.changeTheme(ThemeData.dark());
                  // }
                  // box.write('theme', value);
                },
                child: const Text('Change theme')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: timerDurationController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Counter duration',
                  border: OutlineInputBorder(),
                  hintText: 'Enter time in seconds',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
