import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);

  List<double> clockOffset = [
    pi / 2,
    pi / 3,
    pi / 6,
    0,
    -pi / 6,
    -pi / 3,
    -pi / 2,
    -2 * pi / 3,
    -5 * pi / 6,
    pi,
    5 * pi / 6,
    2 * pi / 3
  ];

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // Minute Calculation
    double minX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    //Minute Line
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = Theme.of(context).accentColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    // Hour Calculation
    // dateTime.hour * 30 because 360/12 = 30
    // dateTime.minute * 0.5 each minute we want to turn our hour line a little
    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    // hour Line
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = Theme.of(context).colorScheme.secondary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    // Second Calculation
    // size.width * 0.4 define our line height
    // dateTime.second * 6 because 360 / 60 = 6
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    // Second Line
    canvas.drawLine(center, Offset(secondX, secondY),
        Paint()..color = Theme.of(context).primaryColor);

    // Draw time,
    // 12h
    clockOffset.asMap().forEach((i, e) {
      double hour12XText =
          centerX + size.width * .38 * cos(e); // * cos((12 * 30) * pi / 180);
      double hour12YText =
          centerY - size.width * .38 * sin(e); // * sin((12) * pi / 180);

      double hour12X = centerX +
          size.width *
              ([0, 3, 6, 9].contains(i) ? .45 : .47) *
              cos(e); // * cos((12 * 30) * pi / 180);
      double hour12Y = centerY +
          size.width *
              ([0, 3, 6, 9].contains(i) ? .45 : .47) *
              sin(e); // * sin((12) * pi / 180);
      // canvas.drawCircle(
      //     Offset(hour12Y, hour12X), 4, Paint()..color = Colors.black);

      double hour12Xx =
          centerX + size.width * 0.49 * cos(e); // * cos((12 * 30) * pi / 180);
      double hour12Yy =
          centerY + size.width * 0.49 * sin(e); // * sin((12) * pi / 180);
      // canvas.drawCircle(
      //     Offset(hour12Yy, hour12Xx), 4, Paint()..color = Colors.amber);
      //
      TextSpan span = new TextSpan(
          style: new TextStyle(
            color: [0, 3, 6, 9].contains(i)
                ? Theme.of(context).primaryColor
                : Theme.of(context).secondaryHeaderColor,
          ),
          text: i == 0 ? '12' : i.toString());
      TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      canvas.rotate(pi / 2);
      tp.layout();
      tp.paint(canvas,
          new Offset(hour12XText - 5.0, hour12YText - size.width - 8.0));
      canvas.rotate(-pi / 2);
      canvas.drawLine(
        Offset(hour12Y, hour12X),
        Offset(hour12Yy, hour12Xx),
        Paint()
          ..color = [0, 3, 6, 9].contains(i)
              ? Theme.of(context).primaryColor
              : Theme.of(context).secondaryHeaderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = [0, 3, 6, 9].contains(i) ? 2.5 : 1,
      );
    });

    // Center Dots
    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(
        center, 23, Paint()..color = Theme.of(context).backgroundColor);
    // canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
