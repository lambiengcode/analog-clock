import 'package:analog_clock/src/pages/drawer/widgets/option_line.dart';
import 'package:analog_clock/src/pages/drawer/widgets/under_line.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DrawerLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DrawerLayoutState();
}

class _DrawerLayoutState extends State<DrawerLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          SizedBox(height: 16.0),
          Row(
            children: [
              Container(
                height: width * .08,
                width: width * .08,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://avatars.githubusercontent.com/u/60530946?v=4',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.0),
              Text(
                'Dao Hong Vinh',
                style: TextStyle(
                  fontSize: width / 26.0,
                  color: Theme.of(context).iconTheme.color,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.0),
          Text(
            'Today is 05/04/2021',
            style: TextStyle(
              fontSize: width / 22.5,
              color: Theme.of(context).textTheme.headline4.color,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(
              color: Theme.of(context).primaryColor,
              height: .25,
              thickness: .25,
            ),
          ),
          OptionLine(
            icon: Feather.clock,
            title: 'Alarm',
          ),
          UnderLine(),
          OptionLine(
            icon: Feather.watch,
            title: 'Count Down',
          ),
          UnderLine(),
          OptionLine(
            icon: Feather.monitor,
            title: 'Stopwatch',
          ),
        ],
      ),
    );
  }
}
