import 'package:analog_clock/src/pages/alarm/controllers/alarm_controller.dart';
import 'package:analog_clock/src/pages/alarm/widgets/list_alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../public/constants.dart';

class AlarmPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  final alarmController = Get.put(AlarmController());

  @override
  void initState() {
    alarmController.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    alarmController.stopTimer();
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
              SizedBox(height: 25.0),
              StreamBuilder(
                stream: alarmController.currentTime.stream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return _buildClock(DateTime.now());
                  }

                  return _buildClock(snapshot.data);
                },
              ),
              SizedBox(height: 25.0),
              Expanded(
                child: ListAlarm(),
              ),
              SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClock(DateTime dateTime) {
    return CircularPercentIndicator(
      radius: width * .825,
      lineWidth: 60.0,
      percent: alarmController.percent,
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
            Text(
              '${alarmController.formatTime(dateTime.hour)}:${alarmController.formatTime(dateTime.minute)}:${alarmController.formatTime(dateTime.second)}',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: width / 10.0,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
            ),
            SizedBox(height: 2.0),
            Text(
              'The alarm will continue\nin 3 hours',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: width / 26.0,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).iconTheme.color,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
