import 'package:analog_clock/src/pages/home/controllers/clock_controller.dart';
import 'package:analog_clock/src/public/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeInHourAndMinute extends StatelessWidget {
  final TimeOfDay timeOfDay;
  TimeInHourAndMinute({this.timeOfDay});

  final clockController = Get.put(ClockController());

  @override
  Widget build(BuildContext context) {
    String _period = timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          // if you use _timeOfDay.hour then it will show 20:10 like that
          // But we want 8:10
          "${clockController.formatTime(timeOfDay.hourOfPeriod)}:${clockController.formatTime(timeOfDay.minute)}",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(width: 5),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          ),
        ),
      ],
    );
  }
}
