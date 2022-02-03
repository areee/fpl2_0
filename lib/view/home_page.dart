import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_bottom_app_bar.dart';
import '../models/runner.dart';
import '../static.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Participants Lottery'),
        actions: [
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
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<AppBarValues>>[
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
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: CircularCountDownTimer(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                duration: 90,
                initialDuration: 0,
                fillColor: Colors.greenAccent[700]!,
                ringColor: Colors.grey[300]!,
                controller: context.watch<Runner>().countDownController,
                ringGradient: null,
                fillGradient: null,
                backgroundColor: Colors.green[700],
                backgroundGradient: null,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                autoStart: false,
                onStart: () {
                  print('Countdown Started');
                },
                onComplete: () {
                  print('Time\'s up');
                },
              ),
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
