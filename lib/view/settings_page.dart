import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_title_with_style.dart';
import '../models/counter_duration.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context, customTitleWithStyle(context, 'Settings'), null),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: 'Counter duration',
                border: OutlineInputBorder(),
                hintText: 'Enter time in seconds',
              ),
              onChanged: (duration) /*async*/ {
                // final prefs = await SharedPreferences.getInstance();
                // await prefs.setInt('counterDuration', int.parse(duration));
                var counterDuration = context.read<CounterDuration>();
                counterDuration.setDuration(int.parse(duration));
                if (kDebugMode) {
                  print('Output of the number field: $duration');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
