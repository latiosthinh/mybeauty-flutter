import 'package:flutter/material.dart';

class Logger {
  static void log(String msg) {
    assert(() {
      debugPrint('MyBeauty#$msg');
      return true;
    }());
  }

  static void error(String msg) {
    debugPrint('MyBeauty#$msg');
  }
}
