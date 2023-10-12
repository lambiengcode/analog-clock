import 'dart:math';
import 'package:analog_clock/src/public/constants.dart';
import 'package:analog_clock/src/public/size_config.dart';
import 'package:analog_clock/src/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/src/pages/global/widgets/clock_painter.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class Clock extends StatelessWidget {
  final DateTime dateTime;
  const Clock({super.key, required this.dateTime});
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
        ),
        Positioned(
          top: height * .182,
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
      ],
    );
  }
}
