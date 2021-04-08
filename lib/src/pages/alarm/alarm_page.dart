import 'package:analog_clock/src/pages/alarm/controllers/alarm_controller.dart';
import 'package:analog_clock/src/pages/alarm/widgets/list_alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:analog_clock/src/public/constants.dart';

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
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 24.0),
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
                  SizedBox(height: 12.0),
                ],
              ),
            ),
            Positioned(
              bottom: height * .045,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeumorphicButton(
                    onPressed: () => null,
                    duration: Duration(milliseconds: 200),
                    child: Icon(
                      Icons.add,
                      size: width / 12.0,
                    ),
                    padding: EdgeInsets.all(width / 22.5),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 10.0,
                      intensity: .15,
                      surfaceIntensity: .75,
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(.8),
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
