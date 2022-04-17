import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_title_with_style.dart';

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
              onChanged: (text) {
                if (kDebugMode) {
                  print('Output of the number field: $text');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
