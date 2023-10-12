// Package imports:
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:analog_clock/src/pages/stopwatch/controllers/stop_watch_controller.dart';
import 'package:analog_clock/src/public/constants.dart';

class StopWatchControll extends StatefulWidget {
  const StopWatchControll({super.key});

  @override
  State<StatefulWidget> createState() => _StopWatchControllState();
}

class _StopWatchControllState extends State<StopWatchControll> {
  final stopWatchController = Get.put(StopWatchController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StopWatchController>(
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.all(width / 22.5),
              style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: const NeumorphicBoxShape.circle(),
                depth: 10.0,
                intensity: .18,
                surfaceIntensity: .5,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Icon(
                _.isRunning ? Icons.pause : Icons.play_arrow,
                size: width / 12.0,
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
