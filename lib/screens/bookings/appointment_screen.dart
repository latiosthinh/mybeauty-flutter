import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybeauty/components/buttons/index.dart';
import 'package:mybeauty/components/custom_bottom_nav_bar.dart';
import 'package:mybeauty/components/time_picker_spinner.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/enums.dart';
import 'package:mybeauty/models/appointment_screen_arguments.dart';

class AppointmentScreen extends StatefulWidget {
  static String routeName = "/order";
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenScreenState();
}

class _AppointmentScreenScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    final AppontmentScreenArguments agrs =
        ModalRoute.of(context)!.settings.arguments as AppontmentScreenArguments;
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
                      agrs.title,
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
                                child: TimePickerSpinner(),
                              )),
                          Expanded(
                            flex: 1,
                            child: TimePickerSpinner(),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
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
                          children: const [Text('Today'), Icon(Icons.close)],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
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
                      onPressed: () => {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.booking),
    );
  }
}
