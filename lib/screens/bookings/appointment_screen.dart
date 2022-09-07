import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybeauty/components/buttons/index.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/services/bookingService.dart';
import 'package:mybeauty/services/models.dart';

class AppointmentScreen extends StatefulWidget {
  final String title;

  const AppointmentScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenScreenState();
}

final db = FirebaseFirestore.instance;
BookingService _bookingService = BookingService();

class _AppointmentScreenScreenState extends State<AppointmentScreen> {
  late DateTime from;
  late DateTime to;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void setSelectedDate(DateTime day) {
      setState(() {
        selectedDate = day;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 30, right: 38, left: 38, bottom: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: backButton(greenColor, whiteColor,
                          () => {Navigator.pop(context)})),
                  Container(
                    margin: const EdgeInsets.only(bottom: 9.0),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          color: greenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0),
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        color: greenColor,
                      ),
                      Text(
                        '306 St Paul\'s Road London N12LH',
                        style: TextStyle(color: greenColor),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1,
              child: Container(color: grayColor),
            ),
            Container(
              padding: const EdgeInsets.only(top: 16, bottom: 30.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16.0, left: 20),
                    child: Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.schedule),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Time',
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 133.0,
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 20.0, left: 16.0, right: 16.0),
                      decoration:
                          BoxDecoration(border: Border.all(color: grayColor)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: grayColor, width: 1.0))),
                                child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    use24hFormat: true,
                                    onDateTimeChanged: ((value) => {
                                          setState(
                                            () => from = value,
                                          )
                                        })),
                              )),
                          Expanded(
                            flex: 1,
                            child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: true,
                                onDateTimeChanged: ((value) => {
                                      setState(
                                        () => to = value,
                                      )
                                    })),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 20.0, left: 16.0, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.event),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Date')
                          ],
                        ),
                        Row(
                          children: const [
                            Text('Today'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.cancel_outlined)
                          ],
                        )
                      ],
                    ),
                  ),
                  buildLineDate(selectedDate, setSelectedDate),
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 10.0, top: 20.0, left: 40.0, right: 40.0),
                    child: Row(
                      children: const [
                        Icon(Icons.person_outline),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Team')
                      ],
                    ),
                  ),
                  buildStaff(),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: darkPinkColor),
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: TextButton(
                      child: const Text('APPLY',
                          style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0)),
                      onPressed: () => {
                        _bookingService.add(AddBookingModel(
                            widget.title, selectedDate, from, to))
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildStaff() {
  return Container(
    margin: const EdgeInsets.only(bottom: 10.0, left: 16.0),
    child: Row(
      children: [
        Column(
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://i.pravatar.cc/100'),
            ),
            Text('Juliet'),
            Text(
              '★ 4.9',
              style: TextStyle(color: Colors.amber),
            )
          ],
        )
      ],
    ),
  );
}

List<DateTime> getDates() {
  List<DateTime> returnValue = [];
  for (int i = 0; i < 6; i++) {
    returnValue.add(DateTime.now().add(Duration(days: i)));
  }
  return returnValue;
}

final List<DateTime> workDates = getDates();

Widget buildLineDate(DateTime selectedDate, Function setSelectedDate) {
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
                          const Text('Today'),
                          const SizedBox(
                            height: 5,
                          ),
                          circleButton(
                              () => {setSelectedDate(date)},
                              date.day.toString(),
                              selectedDate.day == date.day
                                  ? darkPinkColor
                                  : Colors.transparent,
                              selectedDate.day == date.day
                                  ? Colors.white
                                  : Colors.black)
                        ],
                      )
                    ],
                  )));
        }).toList()),
  );
}
