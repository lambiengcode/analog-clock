import 'package:analog_clock/src/pages/home/controllers/clock_controller.dart';
import 'package:analog_clock/src/pages/home/widgets/body.dart';
import 'package:analog_clock/src/public/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final clockController = Get.put(ClockController());

  @override
  void initState() {
    super.initState();
    clockController.startTimer();
  }

  @override
  void dispose() {
    clockController.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: StreamBuilder(
        stream: clockController.currentDay.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Body(
              dateTime: DateTime.now(),
            );
          }

          return Body(
            dateTime: snapshot.data,
          );
        },
      ),
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: getProportionateScreenWidth(32),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
