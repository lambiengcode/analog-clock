import 'package:analog_clock/src/pages/tab/tab_bar_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme/theme_service.dart';

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
    ThemeService().initBrighness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarLayout();
  }
}
