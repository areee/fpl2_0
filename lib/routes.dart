import 'package:flutter/material.dart';

import 'view/about_page.dart';
import 'view/home_page.dart';
import 'view/settings_page.dart';

Map<String, WidgetBuilder> fplRoutes = {
  '/': (context) => const HomePage(),
  '/settings': (context) => const SettingsPage(),
  '/about': (context) => const AboutPage(),
};
