// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Project imports:
import 'package:analog_clock/src/routes/app_pages.dart';
import 'package:analog_clock/src/shared/logger/logger_utils.dart';
import 'package:analog_clock/src/theme/theme_service.dart';
import 'package:analog_clock/src/theme/themes.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.rootRoute,
      getPages: AppPages.routes,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    ),
  );
}
