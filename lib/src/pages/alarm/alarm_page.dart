// Package imports:
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

// Project imports:
import 'package:analog_clock/src/pages/alarm/controllers/alarm_controller.dart';
import 'package:analog_clock/src/pages/alarm/widgets/list_alarm.dart';
import 'package:analog_clock/src/public/constants.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

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
      body: SizedBox(
        width: width,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  StreamBuilder(
                    stream: alarmController.currentTime.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return _buildClock(DateTime.now());
                      }

                      return _buildClock(snapshot.data!);
                    },
                  ),
                  const Expanded(
                    child: ListAlarm(),
                  ),
                  const SizedBox(height: 12.0),
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
                    onPressed: () {},
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.all(width / 22.5),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      boxShape: const NeumorphicBoxShape.circle(),
                      depth: 10.0,
                      intensity: .15,
                      surfaceIntensity: .75,
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(.8),
                    ),
                    child: Icon(
                      Icons.add,
                      size: width / 12.0,
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
      radius: width * .45,
      lineWidth: 60.0,
      percent: alarmController.percent,
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
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${alarmController.formatTime(dateTime.hour)}:${alarmController.formatTime(dateTime.minute)}:${alarmController.formatTime(dateTime.second)}',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: width / 10.0,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
          ),
          const SizedBox(height: 2.0),
          Text(
            'The alarm will continue\nin 3 hours',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: width / 26.0,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).iconTheme.color,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
