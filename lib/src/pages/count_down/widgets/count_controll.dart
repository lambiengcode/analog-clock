import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CountControll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountControllState();
}

class _CountControllState extends State<CountControll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.refresh_cw,
              size: width / 16.0,
            ),
          ),
          NeumorphicButton(
            onPressed: () => null,
            duration: Duration(milliseconds: 200),
            child: Icon(
              Icons.play_arrow,
              size: width / 12.0,
            ),
            padding: EdgeInsets.all(width / 22.5),
            style: NeumorphicStyle(
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.circle(),
              depth: 10.0,
              intensity: .2,
              surfaceIntensity: .75,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.bell,
              size: width / 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
