import 'package:get/get.dart';
import 'dart:async';

class StopWatchController extends GetxController {
  StreamController<DateTime> currentTime =
      StreamController<DateTime>.broadcast();
  DateTime dateTime = DateTime(0, 0, 0, 0, 0, 0);
  Timer timer;
  double percent = .0;
  bool isRunning = false;
  List<DateTime> dateTimes = [];

  formatTime(input) {
    if (input < 10) {
      return '0$input';
    }
    return input.toString();
  }

  play() {
    isRunning ? stopTimer() : startTimer();
  }

  updateTime(h, m, s) {
    currentTime.add(dateTime);
  }

  startTimer() {
    isRunning = true;
    update();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      dateTime = dateTime.add(Duration(seconds: 1));
      currentTime.add(dateTime);
      percent = dateTime.second / 60.0;
      update();
    });
  }

  stopTimer() {
    timer.cancel();
    isRunning = false;
    update();
  }

  saveCurrentTime() {
    dateTimes.add(dateTime);
  }

  resetTime() {
    dateTime = DateTime(0, 0, 0, 0, 0, 0);
    timer.cancel();
    currentTime.add(dateTime);
    isRunning = false;
    update();
  }
}
