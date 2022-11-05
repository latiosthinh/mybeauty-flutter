import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mybeauty/components/index.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/utils/datetime_utils.dart';
import 'package:mybeauty/widgets/index.dart';

class DateLine extends StatefulWidget {
  final Color color;
  final Function onSelected;
  final DateTime selected;
  const DateLine(
      {Key? key,
      required this.color,
      required this.onSelected,
      required this.selected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateLineState();
}

class _DateLineState extends State<DateLine> {
  final List<DateTime> workDates = DateTimeUtils.getWorkingDate();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        height: 70.0,
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(color: grayColor),
                bottom: BorderSide(color: grayColor))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: workDates.map((date) {
                  return SizedBox(
                      height: 55,
                      width: 50,
                      child: Column(
                        children: [
                          Text(
                              DateTimeUtils.getDayOfWeek(date).substring(0, 3)),
                          const VSpacer(5),
                          CircleButton(
                              onTap: () => {
                                    widget.onSelected(date),
                                  },
                              text: date.day.toString(),
                              bgColor: widget.selected.day == date.day
                                  ? widget.color
                                  : Colors.transparent,
                              foreColor: widget.selected.day == date.day
                                  ? Colors.white
                                  : Colors.black)
                        ],
                      ));
                }).toList()),
            RoundedButton(
                bgColor: widget.color,
                iconColor: widget.color,
                hasBgColor: false,
                icon: Icons.arrow_forward,
                onTap: () => {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2030, 12, 12), onChanged: (date) {
                        widget.onSelected(date);
                      }, onConfirm: (date) {
                        widget.onSelected(date);
                      }, currentTime: DateTime.now(), locale: LocaleType.en)
                    }),
          ],
        ));
  }
}
