import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String title = 'Flutter Participants Lottery v2.0';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        // TODO: Add theme to the app (this is just a temporary one for night mode)
        // brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: title),
    );
  }
}
