import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../controllers/controller.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final Controller c = Get.find();
    final timerDurationController =
        TextEditingController(text: c.timerDuration.value.toString());

    timerDurationListener() {
      final timerDurationText = timerDurationController.text;

      if (kDebugMode) {
        print('Output of the number field: $timerDurationText');
      }

      if (timerDurationText.isNotEmpty) {
        c.setTimerDuration(int.parse(timerDurationText));
      }
    }

    timerDurationController.addListener(timerDurationListener);

    return Scaffold(
      appBar: customAppBar(
          context,
          Text(
            'Settings',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          null),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    controller: timerDurationController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: Theme.of(context).textTheme.bodyLarge,
                    decoration: const InputDecoration(
                      labelText: 'Counter duration',
                      border: OutlineInputBorder(),
                      hintText: 'Enter time in seconds',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
