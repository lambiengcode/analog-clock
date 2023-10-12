// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:analog_clock/src/pages/global/controllers/clock_controller.dart';
import 'package:analog_clock/src/public/size_config.dart';

class TimeInHourAndMinute extends StatelessWidget {
  final TimeOfDay timeOfDay;
  final bool showPeriod;
  final clockController = Get.put(ClockController());

  TimeInHourAndMinute({
    super.key,
    required this.timeOfDay,
    required this.showPeriod,
  });

  @override
  Widget build(BuildContext context) {
    final String period = timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          // if you use _timeOfDay.hour then it will show 20:10 like that
          // But we want 8:10
          "${clockController.formatTime(timeOfDay.hourOfPeriod)}:${clockController.formatTime(timeOfDay.minute)}",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        showPeriod
            ? Row(
                children: [
                  const SizedBox(width: 5),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      period,
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(18)),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
