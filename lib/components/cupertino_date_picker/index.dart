import 'package:flutter/cupertino.dart';

class CustomCupertinoDatePicker extends StatefulWidget {
  final Color color;
  final Function onDateTimeChanged;
  const CustomCupertinoDatePicker(
      {Key? key, required this.color, required this.onDateTimeChanged})
      : super(key: key);

  @override
  State<CustomCupertinoDatePicker> createState() =>
      _CustomCupertinoDatePickerState();
}

class _CustomCupertinoDatePickerState extends State<CustomCupertinoDatePicker> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
        data: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: TextStyle(color: widget.color))),
        child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, (DateTime.now().minute % 30 * 30).toInt()),
            minuteInterval: 30,
            use24hFormat: true,
            onDateTimeChanged: (value) => widget.onDateTimeChanged(value)));
  }
}
