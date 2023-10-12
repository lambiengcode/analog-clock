// Flutter imports:
import 'package:flutter/material.dart';

class Logger {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => debugPrint('** $text. isError: [$isError]'));
  }
}
