import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter/material.dart';

class OptionLine extends StatelessWidget {
  final IconData icon;
  final String title;
  OptionLine({this.icon, this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
          size: width / 16.0,
        ),
        SizedBox(width: 12.0),
        Text(
          title,
          style: TextStyle(
            fontSize: width / 26.0,
            color: Theme.of(context).iconTheme.color,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
