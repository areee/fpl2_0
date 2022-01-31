import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_bottom_app_bar.dart';
import 'models/runner.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Participants Lottery v2.0'),
        actions: [
          IconButton(
            tooltip: 'More options',
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              print('More options clicked');
            }, // TODO: Add menu (Settings, About, etc)
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current status'),
            Consumer<Runner>(
              builder: (context, runner, child) {
                return Text(
                  '${runner.status}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
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
