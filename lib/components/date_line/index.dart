import 'package:flutter/material.dart';
import 'package:mybeauty/components/index.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/utils/datetime_utils.dart';

class DateLine extends StatefulWidget {
  final Color color;
  final Function onSelected;
  const DateLine({Key? key, required this.color, required this.onSelected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateLineState();
}

class _DateLineState extends State<DateLine> {
  final List<DateTime> workDates = DateTimeUtils.getWorkingDate();
  late DateTime selected = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: grayColor),
              bottom: BorderSide(color: grayColor))),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          children: workDates.map((date) {
            return Expanded(
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(DateTimeUtils.getDayOfWeek(date)
                                .substring(0, 3)),
                            const SizedBox(
                              height: 5,
                            ),
                            CircleButton(
                                onTap: () => {
                                      widget.onSelected(date),
                                      setState(() => {selected = date})
                                    },
                                text: date.day.toString(),
                                bgColor: selected.day == date.day
                                    ? widget.color
                                    : Colors.transparent,
                                foreColor: selected.day == date.day
                                    ? Colors.white
                                    : Colors.black)
                          ],
                        )
                      ],
                    )));
          }).toList()),
    );
  }
}
