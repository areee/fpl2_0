import 'package:flutter/material.dart';
import 'package:fpl2_0/models/runner.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'view/about_page.dart';
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
        '/about': (context) => const AboutPage(),
      },
      // TODO: Add theme to the app (these are just temporary ones for night mode)
      darkTheme: ThemeData(
        textTheme: GoogleFonts.fredokaOneTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.green, brightness: Brightness.dark)
            .copyWith(secondary: Colors.yellowAccent[700]),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.green, brightness: Brightness.light)
            .copyWith(secondary: Colors.yellowAccent[700]),
        textTheme: GoogleFonts.fredokaOneTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
