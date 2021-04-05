import 'package:analog_clock/src/pages/drawer/drawer.dart';
import 'package:analog_clock/src/pages/home/widgets/body.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:analog_clock/src/public/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
      drawer: Container(
        width: width * .75,
        child: Drawer(
          child: DrawerLayout(),
        ),
      ),
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: .0,
      leading: IconButton(
        icon: Icon(
          Feather.list,
          color: Theme.of(context).iconTheme.color,
          size: getProportionateScreenWidth(26),
        ),
        onPressed: () => openDrawer(),
      ),
      actions: [buildAddButton(context)],
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
