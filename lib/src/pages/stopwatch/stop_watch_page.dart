import 'package:analog_clock/src/pages/stopwatch/controllers/stop_watch_controller.dart';
import 'package:analog_clock/src/pages/stopwatch/widgets/stop_watch_controll.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:get/get.dart';

class StopWatchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  final stopWatchController = Get.put(StopWatchController());

  @override
  void initState() {
    super.initState();
    stopWatchController.updateTime(0, 0, 0);
  }

  @override
  void dispose() {
    stopWatchController.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Spacer(flex: 1),
              StreamBuilder(
                stream: stopWatchController.currentTime.stream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return _buildClock(DateTime(0, 0, 0, 0, 0, 0));
                  }

                  return _buildClock(snapshot.data);
                },
              ),
              Spacer(flex: 10),
              StopWatchControll(),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClock(dateTime) {
    return CircularPercentIndicator(
      radius: width * .825,
      lineWidth: 60.0,
      percent: stopWatchController.percent,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Theme.of(context).accentColor,
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
      center: Container(
        child: Center(
          child: Text(
            '${stopWatchController.formatTime(dateTime.hour)}:${stopWatchController.formatTime(dateTime.minute)}:${stopWatchController.formatTime(dateTime.second)}',
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: width / 10.0,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }
}
