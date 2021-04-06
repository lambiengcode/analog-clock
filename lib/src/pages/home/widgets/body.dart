import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'clock.dart';
import 'country_card.dart';
import 'time_in_hour_and_minute.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat('hh:mm');

    return Container(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: height / 25.0),
            _buildTopBar(context),
            SizedBox(height: 24.0),
            Text(
              "Ho Chi Minh, Viet Nam",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TimeInHourAndMinute(),
            Spacer(),
            Clock(),
            Spacer(),
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
                        Duration(hours: 11),
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
                        Duration(hours: 3),
                      ),
                    ),
                    period: "AM",
                  ),
                  CountryCard(
                    country: "HongKong, China",
                    timeZone: "UTC +8 | EA",
                    iconSrc: "assets/icons/Sydney.svg",
                    time: format.format(
                      DateTime.now().add(
                        Duration(hours: 1),
                      ),
                    ),
                    period: "AM",
                  ),
                  SizedBox(width: 12.0),
                ],
              ),
            ),
            SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionIcon(context, Icons.watch_later_outlined, true),
          _buildActionIcon(context, Icons.alarm, false),
          _buildActionIcon(context, Icons.train_sharp, false),
          _buildActionIcon(context, Icons.today_outlined, false),
          _buildActionIcon(context, Icons.alarm_add, false),
        ],
      ),
    );
  }

  Widget _buildActionIcon(context, icon, active) {
    return IconButton(
      onPressed: () => null,
      icon: Icon(
        icon,
        color: active
            ? Theme.of(context).primaryColor
            : Theme.of(context).iconTheme.color,
        size: width / 14.0,
      ),
    );
  }
}
