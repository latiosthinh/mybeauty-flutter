import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybeauty/components/index.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/models/staff.dart';
import 'package:mybeauty/screens/index.dart';
import 'package:mybeauty/services/services.dart';
import 'package:mybeauty/utils/index.dart';
import 'package:mybeauty/widgets/index.dart';

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
AuthService _authService = AuthService();

class _AppointmentScreenScreenState extends State<AppointmentScreen> {
  DateTime bookingDate = DateTimeUtils.initDate();
  DateTime bookingTime = DateTime.now();
  late Staff selectedStaff;
  late bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 20, right: 16, left: 16, bottom: 30),
              child: Row(
                children: [
                  RoundedButton(
                      bgColor: widget.color,
                      iconColor: whiteColor,
                      hasBgColor: true,
                      onTap: () => {Navigator.pop(context)}),
                  const SizedBox(width: 20),
                  Text(
                    widget.service.name,
                    style: TextStyle(
                        color: widget.color,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0),
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
                  NetLoadingDialog(loading: loading),
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 16.0, left: 16, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.schedule),
                            HSpacer(10),
                            Text(
                              'Time',
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(DateTimeUtils.getTime(bookingTime)),
                            const HSpacer(10),
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => {
                                      setState(() => {
                                            bookingTime = DateTime.now(),
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
                          bottom: 30.0, left: 16.0, right: 16.0),
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
                                      () => bookingTime = value,
                                    )
                                  },
                                ),
                              )),
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
                            const HSpacer(10),
                            const Text('Date')
                          ],
                        ),
                        Row(
                          children: [
                            Text('${DateTimeUtils.getDayOfWeek(bookingDate)} (${DateTimeUtils.getFullDate(bookingDate)})'),
                            const HSpacer(10),
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => {
                                      setState(() => {
                                            bookingDate =
                                                DateTimeUtils.initDate()
                                          })
                                    },
                                icon:
                                    SvgPicture.asset('assets/icons/cancel.svg'))
                          ],
                        )
                      ],
                    ),
                  ),
                  DateLine(
                    color: widget.color,
                    onSelected: (DateTime value) => {
                      setState(() => {
                            bookingDate =
                                DateTime(value.year, value.month, value.day)
                          })
                    },
                    selected: bookingDate,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 10.0, top: 30.0, left: 16.0, right: 16.0),
                    child: Row(
                      children: const [
                        Icon(Icons.person_outline),
                        HSpacer(10),
                        Text('Staffs')
                      ],
                    ),
                  ),
                  StaffList(
                      onSelected: (Staff value) => {
                            setState(
                              () => {selectedStaff = value},
                            )
                          }),
                  const VSpacer(10),
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
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          final model = AddBookingModel(
                              widget.service,
                              bookingDate,
                              bookingTime,
                              selectedStaff,
                              _authService.user);
                          if (await isValid(model)) {
                            _bookingService.add(model);
                            Navigator.pushNamed(
                                context, BookingScreen.routeName);
                          }
                          setState(() {
                            loading = false;
                          });
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> isValid(AddBookingModel model) async {
    if (bookingDate.day <= DateTime.now().day &&
        bookingTime.isBefore(DateTime.now())) {
      _showToast(context, 'Please choose a valid time');
      return false;
    }
    if (await _bookingService.isExist(model)) {
      _showToast(context, 'Staff is busy in this select time');
      return false;
    }
    return true;
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
}
