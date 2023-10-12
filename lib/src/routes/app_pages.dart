// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:analog_clock/src/app.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const rootRoute = Routes.root;

  static final routes = [
    GetPage(
      name: Routes.root,
      page: () => const App(),
    ),
  ];
}
