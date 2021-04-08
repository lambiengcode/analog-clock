import 'package:analog_clock/src/pages/stopwatch/controllers/stop_watch_controller.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class StopWatchControll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StopWatchControllState();
}

class _StopWatchControllState extends State<StopWatchControll> {
  final stopWatchController = Get.put(StopWatchController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StopWatchController>(
      builder: (_) => Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _.resetTime(),
              icon: Icon(
                Icons.refresh,
                size: width / 12.0,
              ),
            ),
            NeumorphicButton(
              onPressed: () => _.play(),
              duration: Duration(milliseconds: 200),
              child: Icon(
                _.isRunning ? Icons.pause : Icons.play_arrow,
                size: width / 12.0,
              ),
              padding: EdgeInsets.all(width / 22.5),
              style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.circle(),
                depth: 10.0,
                intensity: .18,
                surfaceIntensity: .5,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            IconButton(
              onPressed: () => _.saveCurrentTime(),
              icon: Icon(
                Icons.add_alarm_rounded,
                size: width / 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
