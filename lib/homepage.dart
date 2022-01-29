import 'package:flutter/material.dart';

import 'customBottomAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isRunning = false;

  void _changeRunning() {
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            Text(
              'Running: $_isRunning',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:
            _isRunning ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
        onPressed: _changeRunning,
        tooltip: _isRunning ? 'Pause' : 'Start',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
