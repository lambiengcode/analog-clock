// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// Project imports:
import 'package:analog_clock/src/pages/bedtime/widgets/pick_day.dart';
import 'package:analog_clock/src/pages/global/controllers/clock_controller.dart';
import 'package:analog_clock/src/pages/global/widgets/clock_painter.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:analog_clock/src/public/size_config.dart';
import 'package:analog_clock/src/theme/theme_service.dart';

class BedTimePage extends StatefulWidget {
  const BedTimePage({super.key});

  @override
  State<StatefulWidget> createState() => _BedTimePageState();
}

class _BedTimePageState extends State<BedTimePage> {
  final clockController = Get.put(ClockController());
  bool isOn = true;

  @override
  void initState() {
    clockController.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    clockController.dispose();
    super.dispose();
  }

  toggle() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(context),
        const Spacer(),
        const PickDay(),
        const Spacer(flex: 2),
        Stack(
          alignment: Alignment.center,
          children: [
            CircularPercentIndicator(
              radius: width * .45,
              lineWidth: 35.0,
              percent: .5,
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
              animationDuration: 2000,
              animateFromLastPercent: true,
              rotateLinearGradient: true,
              center: StreamBuilder(
                stream: clockController.currentDay.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return _buildClock(context, DateTime.now());
                  }

                  return _buildClock(context, snapshot.data);
                },
              ),
            ),
            Positioned(
              top: width * .45 - 5,
              left: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  ThemeService().getThemeMode() == ThemeMode.dark
                      ? PhosphorIcons.moon
                      : PhosphorIcons.sun,
                  color: Theme.of(context).primaryColor,
                  size: getProportionateScreenWidth(26),
                ),
                onPressed: () => ThemeService().changeThemeMode(),
              ),
            ),
            Positioned(
              top: 35 / 2 + 8,
              left: 0,
              right: 0,
              child: Icon(
                Icons.power_settings_new_sharp,
                color: Colors.white,
                size: width / 16.0,
              ),
            ),
            Positioned(
              bottom: 35 / 2 + 6,
              left: 0,
              right: 0,
              child: Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
                size: width / 16.0,
              ),
            ),
          ],
        ),
        const Spacer(flex: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomTime(
              context,
              '00:00',
              'Bedtime',
              Icons.power_settings_new_sharp,
            ),
            _buildBottomTime(
              context,
              '06:00',
              'Wakeup',
              Icons.notifications_active,
            ),
          ],
        ),
        const Spacer(flex: 3),
      ],
    );
  }

  Widget _buildTitle(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bedtime Schedule',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontFamily: 'Lato',
              fontSize: width / 21.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          Switch(
            activeColor: Theme.of(context).primaryColor,
            value: isOn,
            onChanged: (val) {
              toggle();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildClock(context, dateTime) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 35 + width * .05,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: kShadowColor.withOpacity(0.14),
                blurRadius: 64,
              ),
            ],
          ),
          child: Transform.rotate(
            angle: -pi / 2,
            child: CustomPaint(
              painter: ClockPainter(context, dateTime),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomTime(context, time, title, icon) {
    return Column(
      children: [
        Text(
          time,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontFamily: 'Lato',
            fontSize: width / 12.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Lato',
            fontSize: width / 25.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6.0),
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: width / 14.0,
        ),
      ],
    );
  }
}
