import 'package:analog_clock/src/pages/tab/tab_bar_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: GetPlatform.isAndroid ? Brightness.dark : Brightness.light,
      statusBarIconBrightness: GetPlatform.isAndroid ?  Brightness.dark : Brightness.light,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarLayout();
  }
}
