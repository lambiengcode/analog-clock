import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockController extends GetxController {
  StreamController<DateTime> currentDay =
      StreamController<DateTime>.broadcast();
  Timer timer;
  TimeOfDay timeOfDay = TimeOfDay.now();
  String formatTime(int input) {
    if (input < 10) {
      return '0' + input.toString();
    }
    return input.toString();
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      currentDay.add(DateTime.now());
    });
  }
}
