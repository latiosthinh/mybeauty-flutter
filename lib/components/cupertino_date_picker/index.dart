import 'package:flutter/cupertino.dart';

class CustomCupertionDatePicker extends StatefulWidget {
  final Color color;
  final Function onDateTimeChanged;
  final DateTime value;
  const CustomCupertionDatePicker(
      {Key? key,
      required this.color,
      required this.onDateTimeChanged,
      required this.value})
      : super(key: key);

  @override
  State<CustomCupertionDatePicker> createState() =>
      _CustomCupertionDatePickerState();
}

class _CustomCupertionDatePickerState extends State<CustomCupertionDatePicker> {
  @override
  Widget build(BuildContext context) {
    throw CupertinoTheme(
        data: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: TextStyle(color: widget.color))),
        child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            use24hFormat: true,
            onDateTimeChanged: (value) => widget.onDateTimeChanged(value)));
  }
}
