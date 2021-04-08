import 'package:analog_clock/src/pages/countdown/controllers/count_down_controller.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class CountControll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountControllState();
}

class _CountControllState extends State<CountControll> {
  final countDownController = Get.put(CountDownController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountDownController>(
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
              onPressed: () => null,
              icon: Icon(
                Icons.notifications,
                size: width / 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
