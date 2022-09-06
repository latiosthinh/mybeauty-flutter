import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/buttons/index.dart';
import 'package:mybeauty/components/time_picker_spinner.dart';
import 'package:mybeauty/constants.dart';

class AppointmentScreen extends StatefulWidget {
  final String title;

  const AppointmentScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenScreenState();
}

final db = FirebaseFirestore.instance;

class _AppointmentScreenScreenState extends State<AppointmentScreen> {
  late DateTime from;
  late DateTime to;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                        style: GoogleFonts.robotoCondensed(
                            color: greenColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: greenColor,
                        ),
                        Text(
                          '306 St Paul\'s Road London N12LH',
                          style: GoogleFonts.robotoCondensed(color: greenColor),
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
                padding: const EdgeInsets.only(
                    top: 16, left: 16, right: 16, bottom: 30.0),
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
                        margin: const EdgeInsets.only(bottom: 20.0),
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
                                  onDateTimeChanged: ((value) => {})),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
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
                    buildLineDate(),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
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
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Column(
                            children: const [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    NetworkImage('https://i.pravatar.cc/100'),
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
                    ),
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
                        child: Text('APPLY',
                            style: GoogleFonts.robotoCondensed(
                                color: whiteColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0)),
                        onPressed: () => {
                          db.collection('bookings').add({
                            'name': 'Đinh Công Tân',
                            'service': widget.title,
                            'created': DateTime.now(),
                            'phone': '0762559696',
                            'email': 'f7deat@gmail.com'
                          })
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> workDates = ['14', '15', '16', '17', '18', '19'];

Widget buildLineDate() {
  return Row(
      mainAxisSize: MainAxisSize.max,
      children: workDates.map((date) {
        return Expanded(
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: grayColor),
                        bottom: BorderSide(color: grayColor))),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Text('Today'),
                        const SizedBox(
                          height: 5,
                        ),
                        circleButton(() => {}, date)
                      ],
                    )
                  ],
                )));
      }).toList());
}
