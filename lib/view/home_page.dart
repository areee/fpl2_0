import 'package:flutter/material.dart';
import 'package:fpl2_0/components/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../components/custom_title_with_style.dart';
import 'custom_bottom_app_bar.dart';
import '../models/runner.dart';
import '../static.dart';
import 'custom_circular_count_down_timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [
      PopupMenuButton<AppBarValues>(
        onSelected: (AppBarValues value) {
          switch (value) {
            case AppBarValues.settings:
              Navigator.pushNamed(context, '/settings');
              break;
            case AppBarValues.about:
              Navigator.pushNamed(context, '/about');
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
          context,
          customTitleWithStyle(context, 'Flutter Participants Lottery'),
          actions),
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
        child: Consumer<Runner>(
          builder: (context, runner, child) {
            return Icon(
              runner.status == Status.running ? Icons.pause : Icons.play_arrow,
            );
          },
        ),
        onPressed: () {
          var runner = context.read<Runner>();
          runner.status == Status.running
              ? runner.setPaused()
              : runner.setRunning();
        },
        tooltip: context.watch<Runner>().status == Status.running
            ? 'Pause'
            : 'Start',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
