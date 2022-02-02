import 'package:about/about.dart';
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
                  showAboutPage(
                    context: context,
                    values: {
                      'version': '2.0.0-alpha.1',
                      'year': DateTime.now().year.toString(),
                    },
                    applicationLegalese:
                        'Copyright © Arttu Ylhävuori, {{ year }}',
                    applicationDescription: const Text(
                      'A participants lottery and a timer for devs\' daily scrum meetings.',
                      textAlign: TextAlign.justify,
                    ),
                    children: const <Widget>[
                      MarkdownPageListTile(
                        filename: 'README.md',
                        title: Text('View Readme'),
                        icon: Icon(Icons.all_inclusive),
                      ),
                      MarkdownPageListTile(
                        filename: 'LICENSE.md',
                        title: Text('View License'),
                        icon: Icon(Icons.description),
                      ),
                      LicensesPageListTile(
                        title: Text('Open source Licenses'),
                        icon: Icon(Icons.favorite),
                      ),
                    ],
                    // applicationIcon: const SizedBox(
                    //   width: 100,
                    //   height: 100,
                    //   child: Image(
                    //     image: AssetImage('assets/icon.webp'),
                    //   ),
                    // ),
                  );
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
