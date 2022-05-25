import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/about_page.dart';
import 'view/home_page.dart';
import 'view/settings_page.dart';

void main() => runApp(GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const Home(),
        ),
        GetPage(
          name: '/settings',
          page: () => const Settings(),
        ),
        GetPage(
          name: '/about',
          page: () => const About(),
        ),
      ],
      // home: Home(),
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
