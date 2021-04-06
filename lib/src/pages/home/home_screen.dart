import 'package:analog_clock/src/pages/home/widgets/body.dart';
import 'package:analog_clock/src/public/size_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      body: Body(),
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
