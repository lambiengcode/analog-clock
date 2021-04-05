import 'package:analog_clock/src/routes/app_pages.dart';
import 'package:analog_clock/src/shared/logger/logger_utils.dart';
import 'package:analog_clock/src/theme/theme_service.dart';
import 'package:analog_clock/src/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    enableLog: true,
    logWriterCallback: Logger.write,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    theme: Themes().lightTheme,
    darkTheme: Themes().darkTheme,
    themeMode: ThemeService().getThemeMode(),
  ));
}
