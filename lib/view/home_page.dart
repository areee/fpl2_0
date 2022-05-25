import 'package:flutter/material.dart';
import 'package:fpl2_0/components/custom_app_bar.dart';
import 'package:fpl2_0/models/controller.dart';
import 'package:get/get.dart';

import 'about_page.dart';
import 'custom_bottom_app_bar.dart';
import '../static.dart';
import 'custom_circular_count_down_timer.dart';
import 'settings_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());

    List<Widget> actions = [
      PopupMenuButton<AppBarValues>(
        onSelected: (AppBarValues value) {
          switch (value) {
            case AppBarValues.settings:
              Get.to(() => const Settings());
              break;
            case AppBarValues.about:
              Get.to(() => const About());
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

    return Scaffold(
      appBar: customAppBar(
          context, const Text('Flutter Participants Lottery'), actions),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 2.0),
              child: CustomCircularCountDownTimer(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          c.status.value == Status.running ? c.setPaused() : c.setRunning();
        },
        tooltip: c.status.value == Status.running ? 'Pause' : 'Start',
        child: Icon(
          c.status.value == Status.running ? Icons.pause : Icons.play_arrow,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
