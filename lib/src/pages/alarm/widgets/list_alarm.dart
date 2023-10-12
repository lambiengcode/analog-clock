// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:analog_clock/src/pages/alarm/controllers/alarm_controller.dart';
import 'package:analog_clock/src/public/constants.dart';

class ListAlarm extends StatefulWidget {
  const ListAlarm({super.key});

  @override
  State<StatefulWidget> createState() => _ListAlarmState();
}

class _ListAlarmState extends State<ListAlarm> {
  DateFormat format = DateFormat('HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlarmController>(
      builder: (_) => ListView.builder(
        controller: _.scrollController,
        padding: EdgeInsets.zero,
        itemCount: _.dateTimes.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alarm: ${index + 1}',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: width / 24.0,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${format.format(_.dateTimes[index])},\t\tAlarm Daily',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: width / 24.0,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.color
                                ?.withOpacity(.8),
                          ),
                    ),
                  ],
                ),
                Icon(
                  Icons.alarm,
                  size: width / 16.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
