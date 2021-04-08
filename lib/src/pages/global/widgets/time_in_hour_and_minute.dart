import 'package:analog_clock/src/pages/global/controllers/clock_controller.dart';
import 'package:analog_clock/src/public/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeInHourAndMinute extends StatelessWidget {
  TimeInHourAndMinute({
    Key key,
    this.timeOfDay,
    @required this.showPeriod,
  }) : super(key: key);
  final TimeOfDay timeOfDay;
  final bool showPeriod;
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
        showPeriod
            ? Row(
                children: [
                  SizedBox(width: 5),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      _period,
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(18)),
                    ),
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
