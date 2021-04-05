import 'dart:async';
import 'dart:math';
import 'package:analog_clock/src/public/constants.dart';
import 'package:analog_clock/src/public/size_config.dart';
import 'package:analog_clock/src/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'clock_painter.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: kShadowColor.withOpacity(0.14),
                    blurRadius: 64,
                  ),
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: IconButton(
            icon: Icon(
              ThemeService().getThemeMode() == ThemeMode.dark
                  ? Feather.moon
                  : Feather.sun,
              color: Theme.of(context).primaryColor,
              size: getProportionateScreenWidth(26),
            ),
            onPressed: () => ThemeService().changeThemeMode(),
          ),
        ),
      ],
    );
  }
}
