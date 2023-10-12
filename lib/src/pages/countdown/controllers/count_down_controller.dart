// Dart imports:
import 'dart:async';

// Package imports:
import 'package:get/get.dart';

class CountDownController extends GetxController {
  StreamController<DateTime> currentTime =
      StreamController<DateTime>.broadcast();
  int hour = 0, minute = 0, second = 0;
  double percent = .0;
  bool isRunning = false;
  DateTime dateTime = DateTime(0, 0, 0);
  Timer? timer;

  formatTime(input) {
    if (input < 10) {
      return '0$input';
    }
    return input.toString();
  }

  play() {
    if ([hour, minute, second].join() != '000') {
      isRunning ? stopTimer() : startTimer();
    }
  }

  updateTime(h, m, s) {
    hour = h;
    minute = m;
    second = s;
    dateTime = DateTime(0, 0, 0, h, m, s);
    currentTime.add(dateTime);
    update();
  }

  startTimer() {
    isRunning = true;
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (dateTime.hour == 0 && dateTime.minute == 0 && dateTime.second == 0) {
        stopTimer();
      } else {
        dateTime = dateTime.subtract(const Duration(seconds: 1));
        currentTime.add(dateTime);
        percent = 1.0 -
            ((dateTime.hour * 3600 + dateTime.minute * 60 + dateTime.second) /
                (hour * 3600 + minute * 60 + second));
        update();
      }
    });
  }

  stopTimer() {
    timer?.cancel();
    isRunning = false;
    update();
  }

  resetTime() {
    dateTime = DateTime(0, 0, 0, hour, minute, second);
    timer?.cancel();
    currentTime.add(dateTime);
    isRunning = false;
    update();
  }
}
