import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../components/custom_app_bar.dart';
import '../models/controller.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final Controller c = Get.find();
    // final box = GetStorage();

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
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Counter duration',
                  border: OutlineInputBorder(),
                  hintText: 'Enter time in seconds',
                ),
                onChanged: (value) {
                  if (kDebugMode) {
                    print('Output of the number field: $value');
                  }
                  if (value.isNotEmpty) {
                    c.setTimerDuration(int.parse(value));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
