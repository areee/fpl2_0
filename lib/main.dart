import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/home_page.dart';

void main() => runApp(const GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Participants Lottery',
    ));

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Participants Lottery',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const HomePage(),
//         '/settings': (context) => const SettingsPage(),
//         '/about': (context) => const AboutPage(),
//       },
//       darkTheme: darkFplTheme(context),
//       theme: lightFplTheme(context),
//     );
//   }
// }
