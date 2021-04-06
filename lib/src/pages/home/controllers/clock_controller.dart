import 'dart:async';
import 'package:get/get.dart';

class ClockController extends GetxController {
  DateTime dateTime = DateTime.now();
  Timer timer;
  String formatTime(int input) {
    if (input < 10) {
      return '0' + input.toString();
    }
    return input.toString();
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      dateTime = DateTime.now();
      update();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
