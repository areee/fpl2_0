import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'fpl_themes.dart';
import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return GetMaterialApp(
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Participants Lottery',
      darkTheme: darkFplTheme(context),
      theme: lightFplTheme(context),
    );
  }
}
