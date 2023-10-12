// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:analog_clock/src/pages/tab/tab_bar_layout.dart';
import 'package:analog_clock/src/theme/theme_service.dart';

class App extends StatefulWidget {
  const App({super.key});

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
    return const TabBarLayout();
  }
}
