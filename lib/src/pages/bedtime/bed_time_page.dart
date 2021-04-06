import 'package:analog_clock/src/pages/bedtime/widgets/pick_day.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BedTimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BedTimePageState();
}

class _BedTimePageState extends State<BedTimePage> {
  bool isOn = true;

  toggle() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildTitle(context),
          SizedBox(height: height * .04),
          PickDay(),
          SizedBox(height: 24.0),
          CircularPercentIndicator(
            radius: width * .9,
            lineWidth: 10.0,
            percent: .5,
            center: new Container(),
            progressColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bedtime Schedule',
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
              fontFamily: 'Lato',
              fontSize: width / 24.0,
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
}
