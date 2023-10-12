// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:analog_clock/src/public/constants.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    appBarTheme: appBarTheme,
    primaryColor: kPrimaryColor,
    secondaryHeaderColor: kSecondaryColor,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: kBodyTextColorLight),
    primaryIconTheme: const IconThemeData(color: kPrimaryIconLightColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyLarge: const TextStyle(color: kBodyTextColorLight),
      bodyMedium: const TextStyle(color: kBodyTextColorLight),
      headlineMedium: const TextStyle(color: kTitleTextLightColor, fontSize: 32),
      displayLarge: const TextStyle(color: kTitleTextLightColor, fontSize: 80),
      displayMedium: const TextStyle(color: kTitleTextDarkColor, fontSize: 80),
    ),
    brightness: Brightness.light, colorScheme: const ColorScheme.light(
      secondary: kSecondaryLightColor,
      // on light theme surface = Colors.white by default
    ).copyWith(secondary: kAccentLightColor).copyWith(background: Colors.white),
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    secondaryHeaderColor: kSecondaryColor,
    scaffoldBackgroundColor: const Color(0xFF0D0C0E),
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: kBodyTextColorDark),
    primaryIconTheme: const IconThemeData(color: kPrimaryIconDarkColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyLarge: const TextStyle(color: kBodyTextColorDark),
      bodyMedium: const TextStyle(color: kBodyTextColorDark),
      headlineMedium: const TextStyle(color: kTitleTextDarkColor, fontSize: 32),
      displayLarge: const TextStyle(color: kTitleTextDarkColor, fontSize: 80),
      displayMedium: const TextStyle(color: kTitleTextDarkColor, fontSize: 80),
    ),
    brightness: Brightness.dark, colorScheme: const ColorScheme.light(
      secondary: kSecondaryDarkColor,
      surface: kSurfaceDarkColor,
    ).copyWith(secondary: kAccentDarkColor).copyWith(background: kBackgroundDarkColor),
  );
}
