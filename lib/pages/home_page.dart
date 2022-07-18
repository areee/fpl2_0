import 'package:flutter/material.dart';
import 'package:fpl2_0/components/avatar_widget.dart';
import 'package:get/get.dart';

import '../components/custom_app_bar.dart';
import '../components/home_app_bar_actions.dart' as home_app_bar_actions;
import '../controllers/controller.dart';
import '../components/custom_bottom_app_bar.dart';
import '../static.dart';
import '../components/custom_circular_count_down_timer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());

    var axisCount = (MediaQuery.of(context).size.width / 140).round();

    return Scaffold(
      appBar: customAppBar(context, const Text('Flutter Participants Lottery'),
          home_app_bar_actions.actions),
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWiderBody2();
          } else {
            return _buildMobileBody(axisCount);
          }
        },
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

  Widget _buildMobileBody(int axisCount) {
    return SingleChildScrollView(
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
              crossAxisCount: axisCount,
              children: testParticipantNamesInList
                  .map((name) => AvatarWidget(name: name))
                  .toList(),
            ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildWiderBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CustomCircularCountDownTimer(),
          SizedBox(
            height: 70,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: testParticipantNamesInList
                  .map((name) => AvatarWidget(name: name))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWiderBody2() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CustomCircularCountDownTimer(),
          Wrap(
            direction: Axis.vertical,
            children: List.generate(
              testParticipantNamesInList.length,
              (index) => Container(
                margin: const EdgeInsets.all(10),
                color: Colors.green,
                height: 100,
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
