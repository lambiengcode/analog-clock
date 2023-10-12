// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class ClockController extends GetxController {
  StreamController<DateTime> currentDay =
      StreamController<DateTime>.broadcast();
  Timer? timer;
  TimeOfDay timeOfDay = TimeOfDay.now();
  String formatTime(int input) {
    if (input < 10) {
      return '0$input';
    }
    return input.toString();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentDay.add(DateTime.now());
    });
  }
}
