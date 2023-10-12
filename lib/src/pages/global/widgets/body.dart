// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:analog_clock/src/pages/global/widgets/clock.dart';
import 'package:analog_clock/src/pages/global/widgets/country_card.dart';
import 'package:analog_clock/src/pages/global/widgets/time_in_hour_and_minute.dart';
import 'package:analog_clock/src/public/constants.dart';

class Body extends StatelessWidget {
  final DateTime dateTime;
  const Body({super.key, required this.dateTime});
  @override
  Widget build(BuildContext context) {
    final DateFormat format = DateFormat('hh:mm');

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Ho Chi Minh, Viet Nam",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  fontSize: width / 26.0,
                ),
          ),
          TimeInHourAndMinute(
            timeOfDay: TimeOfDay.fromDateTime(dateTime),
            showPeriod: true,
          ),
          const Spacer(),
          Clock(dateTime: dateTime),
          const Spacer(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CountryCard(
                  country: "New York, USA",
                  timeZone: "UTC -5 | EST",
                  iconSrc: "assets/icons/Liberty.svg",
                  time: format.format(
                    DateTime.now().subtract(
                      const Duration(hours: 11),
                    ),
                  ),
                  period: "PM",
                ),
                CountryCard(
                  country: "Sydney, AU",
                  timeZone: "UTC +10 | AEST",
                  iconSrc: "assets/icons/Sydney.svg",
                  time: format.format(
                    DateTime.now().add(
                      const Duration(hours: 3),
                    ),
                  ),
                  period: "AM",
                ),
                CountryCard(
                  country: "HongKong, CN",
                  timeZone: "UTC +8 | EA",
                  iconSrc: "assets/icons/Sydney.svg",
                  time: format.format(
                    DateTime.now().add(
                      const Duration(hours: 1),
                    ),
                  ),
                  period: "AM",
                ),
                const SizedBox(width: 12.0),
              ],
            ),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
