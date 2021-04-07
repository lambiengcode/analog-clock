import 'package:analog_clock/src/pages/count_down/widgets/count_controll.dart';
import 'package:analog_clock/src/pages/count_down/widgets/pick_time.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:analog_clock/src/public/constants.dart';

class CountDownPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Spacer(flex: 4),
              CircularPercentIndicator(
                radius: width * .85,
                lineWidth: 60.0,
                percent: 1,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Theme.of(context).accentColor,
                linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).secondaryHeaderColor,
                  ],
                  tileMode: TileMode.mirror,
                ),
                animationDuration: 2000,
                addAutomaticKeepAlive: true,
                animateFromLastPercent: true,
                rotateLinearGradient: true,
                center: Container(
                  child: Center(
                    child: Text(
                      '00:11:11',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: width / 10.0,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 3),
              PickTime(),
              Spacer(flex: 2),
              CountControll(),
              Spacer(flex: 8),
            ],
          ),
        ),
      ),
    );
  }
}
