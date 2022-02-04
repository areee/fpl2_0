import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/runner.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
            ),
            const Spacer(
              flex: 1,
            ),
            IconButton(
              tooltip: 'Stop',
              icon: const Icon(Icons.stop),
              onPressed: () {
                var runner = context.read<Runner>();
                runner.setStopped();
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
