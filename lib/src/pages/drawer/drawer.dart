import 'package:analog_clock/src/pages/drawer/widgets/option_line.dart';
import 'package:analog_clock/src/pages/drawer/widgets/under_line.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class DrawerLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DrawerLayoutState();
}

class _DrawerLayoutState extends State<DrawerLayout> {
  DateFormat format = DateFormat('dd/MM/yyyy');
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
                height: width * .1,
                width: width * .1,
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
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dao Hong Vinh',
                    style: TextStyle(
                      fontSize: width / 24.0,
                      color: Theme.of(context).textTheme.headline1.color,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.5),
                  Text(
                    'Today is ${format.format(DateTime.now())}',
                    style: TextStyle(
                      fontSize: width / 26.0,
                      color: Theme.of(context).textTheme.headline1.color,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
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
