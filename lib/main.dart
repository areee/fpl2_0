import 'package:flutter/material.dart';
import 'package:fpl2_0/models/runner.dart';
import 'package:provider/provider.dart';

import 'fpl_themes.dart';
import 'routes.dart';

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
      routes: fplRoutes,
      darkTheme: darkFplTheme(context),
      theme: lightFplTheme(context),
    );
  }
}
