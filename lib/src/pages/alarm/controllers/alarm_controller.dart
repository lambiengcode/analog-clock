// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class AlarmController extends GetxController {
  StreamController<DateTime> currentTime =
      StreamController<DateTime>.broadcast();
  ScrollController scrollController = ScrollController();
  Timer? timer;
  double percent = .0;
  bool isRunning = false;
  List<DateTime> dateTimes = [];

  formatTime(input) {
    if (input < 10) {
      return '0$input';
    }
    return input.toString();
  }

  startTimer() {
    isRunning = true;
    // <---> virtual data
    dateTimes.add(DateTime.now().add(const Duration(hours: 3)));
    dateTimes.add(DateTime.now().add(const Duration(hours: 4)));
    dateTimes.add(DateTime.now().add(const Duration(hours: 5)));
    dateTimes.add(DateTime.now().add(const Duration(hours: 7)));
    // <---> virtual data
    update();
    timer = Timer.periodic(const Duration(milliseconds: 17), (timer) {
      currentTime.add(DateTime.now());
      percent = DateTime.now().second / 60.0;
      update();
    });
  }

  stopTimer() {
    timer?.cancel();
    isRunning = false;
    update();
  }
}
