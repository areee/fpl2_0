import 'package:flutter/material.dart';
import 'package:fpl2_0/components/avatar_widget.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../controllers/controller.dart';
import '../components/custom_bottom_app_bar.dart';
import '../static.dart';
import '../components/custom_circular_count_down_timer.dart';

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

    return Scaffold(
      appBar: customAppBar(
          context, const Text('Flutter Participants Lottery'), actions),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CustomCircularCountDownTimer(),
              const SizedBox(height: 20),
              GridView.count(
                // mainAxisSpacing: 20,
                // crossAxisSpacing: 20,
                shrinkWrap: true,
                crossAxisCount: 10,
                children: testParticipantNamesInList
                    .map((name) => AvatarWidget(name: name))
                    .toList(),
              ),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() => FloatingActionButton(
            onPressed: () {
              c.timerStatus.value == TimerStatus.running
                  ? c.setPaused()
                  : c.setRunning();
            },
            tooltip:
                c.timerStatus.value == TimerStatus.running ? 'Pause' : 'Start',
            child: Icon(
              c.timerStatus.value == TimerStatus.running
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
