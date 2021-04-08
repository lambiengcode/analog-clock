import 'package:analog_clock/src/pages/stopwatch/controllers/stop_watch_controller.dart';
import 'package:analog_clock/src/pages/stopwatch/widgets/list_stop_watch.dart';
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
    stopWatchController.dateTimes.add(DateTime(0, 0, 0));
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
                    return _buildClock(
                        DateTime(0, 0, 0, 0, 0, 0), DateTime(0, 0, 0, 0, 0, 0));
                  }

                  return _buildClock(
                      snapshot.data, stopWatchController.dateTimes[0]);
                },
              ),
              Spacer(flex: 1),
              Container(
                height: height * .3,
                child: ListStopWatch(),
              ),
              Spacer(flex: 1),
              StopWatchControll(),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClock(DateTime dateTime, DateTime dateTimePrevious) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        '${stopWatchController.formatTime(dateTime.hour)}:${stopWatchController.formatTime(dateTime.minute)}:${stopWatchController.formatTime(dateTime.second)}',
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: width / 12.0,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  TextSpan(
                    text:
                        ':${stopWatchController.formatTime((dateTime.millisecond / 17).round())}',
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: width / 18.0,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        '${stopWatchController.formatTime(dateTimePrevious.hour)}:${stopWatchController.formatTime(dateTimePrevious.minute)}:${stopWatchController.formatTime(dateTimePrevious.second)}',
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: width / 18.0,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  TextSpan(
                    text:
                        ':${stopWatchController.formatTime((dateTimePrevious.millisecond / 17).round())}',
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: width / 26.0,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
