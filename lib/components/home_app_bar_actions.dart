import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../static.dart';

/// Actions for the app bar of the home page.
List<Widget> actions = [
  PopupMenuButton<AppBarValues>(
    onSelected: (AppBarValues value) {
      switch (value) {
        case AppBarValues.settings:
          Get.toNamed('/settings');
          break;
        case AppBarValues.about:
          Get.toNamed('/about');
          break;
      }
    },
    tooltip: 'More options',
    icon: const Icon(Icons.more_vert),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<AppBarValues>>[
      const PopupMenuItem<AppBarValues>(
        value: AppBarValues.settings,
        child: ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ),
      const PopupMenuItem<AppBarValues>(
        value: AppBarValues.about,
        child: ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
        ),
      ),
    ],
  ),
];
