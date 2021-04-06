import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PickDay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PickDayState();
}

class _PickDayState extends State<PickDay> {
  List<String> values = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  List<bool> picked = List.generate(7, (index) => index < 3);

  pickDay(index) {
    setState(() {
      picked[index] = !picked[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAction(context, 0),
          _buildAction(context, 1),
          _buildAction(context, 2),
          _buildAction(context, 3),
          _buildAction(context, 4),
          _buildAction(context, 5),
          _buildAction(context, 6),
        ],
      ),
    );
  }

  Widget _buildAction(context, index) {
    return Container(
      height: width / 8,
      width: width / 8,
      alignment: Alignment.center,
      child: NeumorphicButton(
        onPressed: () => pickDay(index),
        child: Text(
          values[index],
          style: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: width / 23.0,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
              ),
        ),
        style: NeumorphicStyle(
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.circle(),
          depth: 6.0,
          intensity: .25,
          color: picked[index]
              ? Theme.of(context).primaryColor
              : Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
