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
        centerX + size.width * 0.335 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.335 * sin((dateTime.minute * 6) * pi / 180);

    //Minute Line
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = Theme.of(context).accentColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );
    canvas.drawCircle(
      Offset(minX, minY),
      .1,
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
            0.25 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.25 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    // hour Line
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = Theme.of(context).colorScheme.secondary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 15.0,
    );
    canvas.drawCircle(
      Offset(hourX, hourY),
      1.5,
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

    // Draw minute
    for (int i = 1; i < 60; i++) {
      if ([5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55].contains(i) == false) {
        double startX = centerX + size.width * 0.475 * cos((i * 6) * pi / 180);
        double startY = centerY + size.width * 0.475 * sin((i * 6) * pi / 180);
        double endX = centerX + size.width * 0.49 * cos((i * 6) * pi / 180);
        double endY = centerY + size.width * 0.49 * sin((i * 6) * pi / 180);

        canvas.drawLine(Offset(startX, startY), Offset(endX, endY),
            Paint()..color = Theme.of(context).primaryColor);
      }
    }

    // Draw time,
    // 12h
    clockOffset.asMap().forEach((i, e) {
      double hour12XText =
          centerX + size.width * .4 * cos(e); // * cos((12 * 30) * pi / 180);
      double hour12YText =
          centerY - size.width * .4 * sin(e); // * sin((12) * pi / 180);

      double hour12X = centerX +
          size.width *
              ([0, 3, 6, 9].contains(i) ? .45 : .475) *
              cos(e); // * cos((12 * 30) * pi / 180);
      double hour12Y = centerY +
          size.width *
              ([0, 3, 6, 9].contains(i) ? .45 : .475) *
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
            fontFamily: 'Lato',
            fontSize: [0, 3, 6, 9].contains(i)
                ? size.width / 22.0
                : size.width / 28.0,
            fontWeight:
                [0, 3, 6, 9].contains(i) ? FontWeight.w600 : FontWeight.w400,
          ),
          text: i == 0 ? '12' : i.toString());
      TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      canvas.rotate(pi / 2);
      tp.layout();
      tp.paint(
          canvas,
          new Offset(hour12XText - (i == 0 ? 10.0 : 5.0),
              hour12YText - size.width - 8.0));
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
