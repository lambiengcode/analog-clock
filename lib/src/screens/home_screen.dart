import 'package:analog_clock/src/public/size_config.dart';
import 'package:analog_clock/src/screens/components/body.dart';
import 'package:analog_clock/src/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
          ThemeService().getThemeMode() == ThemeMode.dark
              ? Feather.moon
              : Feather.sun,
          color: Theme.of(context).primaryColor,
          size: getProportionateScreenWidth(26),
        ),
        onPressed: () {
          ThemeService().changeThemeMode();
        },
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
