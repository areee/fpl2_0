import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/controller.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            const Spacer(
              flex: 3,
            ),
            IconButton(
              tooltip: 'Randomize',
              icon: const Icon(Icons.shuffle),
              onPressed: () {
                if (kDebugMode) {
                  print('Randomize clicked');
                }
              },
            ),
            const Spacer(
              flex: 1,
            ),
            IconButton(
              tooltip: 'Stop',
              icon: const Icon(Icons.stop),
              onPressed: () {
                c.setStopped();
              },
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
