// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// Project imports:
import 'package:analog_clock/src/pages/countdown/controllers/count_down_controller.dart';
import 'package:analog_clock/src/pages/countdown/widgets/count_controll.dart';
import 'package:analog_clock/src/pages/countdown/widgets/pick_time.dart';
import 'package:analog_clock/src/public/constants.dart';

class CountDownPage extends StatefulWidget {
  const CountDownPage({super.key});

  @override
  State<StatefulWidget> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  final countDownController = Get.put(CountDownController());

  @override
  void initState() {
    super.initState();
    countDownController.updateTime(0, 0, 0);
  }

  @override
  void dispose() {
    countDownController.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            const Spacer(flex: 4),
            StreamBuilder(
              stream: countDownController.currentTime.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return _buildClock(DateTime(0, 0, 0));
                }

                return _buildClock(snapshot.data);
              },
            ),
            const Spacer(flex: 3),
            const PickTime(),
            const Spacer(flex: 2),
            const CountControll(),
            const Spacer(flex: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildClock(dateTime) {
    return CircularPercentIndicator(
      radius: width * .45,
      lineWidth: 60.0,
      percent: countDownController.percent,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).secondaryHeaderColor,
        ],
        tileMode: TileMode.mirror,
      ),
      animationDuration: 1000,
      animateFromLastPercent: true,
      rotateLinearGradient: true,
      center: Center(
        child: Text(
          '${countDownController.formatTime(dateTime.hour)}:${countDownController.formatTime(dateTime.minute)}:${countDownController.formatTime(dateTime.second)}',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: width / 10.0,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
