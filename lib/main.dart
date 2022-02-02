import 'package:flutter/material.dart';
import 'package:fpl2_0/models/runner.dart';
import 'package:provider/provider.dart';

import 'view/home_page.dart';
import 'view/settings_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Runner(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Participants Lottery',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/settings': (context) => const SettingsPage(),
      },
      // TODO: Add theme to the app (these are just temporary ones for night mode)
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
