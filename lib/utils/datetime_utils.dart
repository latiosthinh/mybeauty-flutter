// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime initDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String getMonth(DateTime dateTime) {
    var formatter = DateFormat('MMM');
    return formatter.format(dateTime);
  }

  static String getDayOfMonth(DateTime dateTime) {
    var formatter = DateFormat('dd');
    return formatter.format(dateTime);
  }

  static String getFullDate(DateTime dateTime) {
    var formatter = DateFormat('dd MMM, yyyy');
    return formatter.format(dateTime);
  }

  static String getDayOfWeek(DateTime dateTime) {
    var formatter = DateFormat('EEEE');
    return formatter.format(dateTime);
  }

  static String getTime(DateTime dateTime) {
    var formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

  static List<DateTime> getWorkingDate() {
    List<DateTime> returnValue = [];
    for (int i = 0; i < 6; i++) {
      returnValue.add(DateTime.now().add(Duration(days: i)));
    }
    return returnValue;
  }
}
