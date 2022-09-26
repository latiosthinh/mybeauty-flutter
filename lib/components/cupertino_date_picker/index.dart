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
            use24hFormat: true,
            onDateTimeChanged: (value) => widget.onDateTimeChanged(value)));
  }
}
