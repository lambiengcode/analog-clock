import 'package:get/get.dart';

class ClockController extends GetxController {
  String formatTime(int input) {
    if (input < 10) {
      return '0' + input.toString();
    }
    return input.toString();
  }
}
