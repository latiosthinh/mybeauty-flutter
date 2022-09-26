import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/components/buttons/index.dart';
import 'package:mybeauty/components/index.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/models/staff.dart';
import 'package:mybeauty/screens/bookings/booking_screen.dart';
import 'package:mybeauty/services/services.dart';
import 'package:mybeauty/utils/datetime_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppointmentScreen extends StatefulWidget {
  final ServiceModel service;
  final Color color;

  const AppointmentScreen(
      {Key? key, required this.service, required this.color})
      : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenScreenState();
}

BookingService _bookingService = BookingService();
StaffService _staffService = StaffService();
AuthService _authService = AuthService();

class _AppointmentScreenScreenState extends State<AppointmentScreen> {
  DateTime from = DateTime.now();
  DateTime to = DateTime.now().add(const Duration(hours: 1));
  DateTime selectedDate = DateTime.now();
  late Staff selectedStaff;

  List<Staff> _staffs = [];

  _setupStaffs() async {
    List<Staff> staffs = await _staffService.getStaffs();
    setState(() {
      _staffs = staffs;
      if (staffs.isNotEmpty) {
        selectedStaff = staffs.first;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _setupStaffs();
  }

  @override
  Widget build(BuildContext context) {
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
                      child: backButton(widget.color, whiteColor,
                          () => {Navigator.pop(context)})),
                  Container(
                    margin: const EdgeInsets.only(bottom: 9.0),
                    child: Text(
                      widget.service.name,
                      style: TextStyle(
                          color: widget.color,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: widget.color,
                      ),
                      Text(
                        '306 St Paul\'s Road London N12LH',
                        style: TextStyle(color: widget.color),
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
                    margin: const EdgeInsets.only(
                        bottom: 16.0, left: 20, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Row(
                          children: [
                            Text(DateTimeUtils.getTime(from)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('to'),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(DateTimeUtils.getTime(to)),
                            const SizedBox(
                              width: 10.0,
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => {
                                      setState(() => {
                                            from = DateTime.now(),
                                            to = DateTime.now()
                                          })
                                    },
                                icon:
                                    SvgPicture.asset('assets/icons/cancel.svg'))
                          ],
                        )
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
                                child: CustomCupertinoDatePicker(
                                  color: widget.color,
                                  onDateTimeChanged: (DateTime value) => {
                                    setState(
                                      () => from = value,
                                    )
                                  },
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: CustomCupertinoDatePicker(
                                color: widget.color,
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
                          children: [
                            SvgPicture.asset(
                              'assets/icons/calendar.svg',
                              color: blackColor,
                              width: 24,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('Date')
                          ],
                        ),
                        Row(
                          children: [
                            Text(DateTimeUtils.getDayOfWeek(selectedDate)),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => {
                                      setState(
                                          () => {selectedDate = DateTime.now()})
                                    },
                                icon:
                                    SvgPicture.asset('assets/icons/cancel.svg'))
                          ],
                        )
                      ],
                    ),
                  ),
                  buildLineDate(),
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
                        color: widget.color),
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: TextButton(
                      child: Text(
                          AppLocalizations.of(context)?.settings ?? 'APPLY',
                          style: const TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0)),
                      onPressed: () => {
                        if (_staffs.isEmpty)
                          {_showToast(context, 'Member of team not found!')}
                        else if (from.isAfter(to) ||
                            from.isAfter(DateTime.now()))
                          {_showToast(context, 'Please choose a valid time')}
                        else
                          {
                            _bookingService.add(AddBookingModel(
                                widget.service.id,
                                selectedDate,
                                from,
                                to,
                                selectedStaff,
                                _authService.user)),
                            Navigator.pushNamed(
                                context, BookingScreen.routeName)
                          }
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

  Widget buildStaff() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, left: 16.0, right: 16.0),
      child: Row(
        children: _staffs
            .map((staff) => Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Avatar(
                        image: staff.avatar,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(staff.name),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16.0,
                        ),
                        Text(
                          staff.rate.toString(),
                          style: const TextStyle(color: Colors.amber),
                        )
                      ]),
                      Radio(
                          value: staff,
                          groupValue: selectedStaff,
                          onChanged: ((Staff? value) => {
                                setState(() {
                                  selectedStaff = value ?? _staffs.first;
                                })
                              }))
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  final List<DateTime> workDates = DateTimeUtils.getWorkingDate();

  Widget buildLineDate() {
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
                                      setState(() {
                                        selectedDate = date;
                                      })
                                    },
                                text: date.day.toString(),
                                bgColor: selectedDate.day == date.day
                                    ? widget.color
                                    : Colors.transparent,
                                foreColor: selectedDate.day == date.day
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
