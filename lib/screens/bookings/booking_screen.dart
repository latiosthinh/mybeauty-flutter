import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/services/booking_service.dart';
import 'package:mybeauty/services/auth.dart';
import 'package:mybeauty/widgets/index.dart';
import '../../services/models.dart';
import '../../utils/datetime_utils.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = "/booking";
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

AuthService _authService = AuthService();

class _BookingScreenState extends State<BookingScreen> {
  final BookingService _bookingService = BookingService();

  List<AddBookingModel> _bookings = [];
  _getBookings() async {
    List<AddBookingModel> bookings =
        await _bookingService.getBookings(_authService.user!.uid);
    setState(() {
      _bookings = bookings;
    });
  }

  @override
  void initState() {
    super.initState();

    _getBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Bookings',
            style: TextStyle(color: blackColor, fontWeight: FontWeight.w700),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.square(0),
            child: Container(
              color: pinkColor,
              height: 1.0,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
              children: _bookings.map((AddBookingModel item) {
            return Container(
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: pinkColor),
                        bottom: BorderSide(color: pinkColor),
                        left: BorderSide(color: pinkColor),
                        right: BorderSide(color: pinkColor))),
                margin: const EdgeInsets.only(top: 16.0),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              item.service.name,
                              style: const TextStyle(
                                  color: pinkColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            const HSpacer(10),
                            Text(
                              '/ ${item.service.price}\$',
                              style: const TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Text(
                          '${DateTimeUtils.getDayOfWeek(item.bookingDate)}, ${DateTimeUtils.getTime(item.bookingTime)}',
                          style: const TextStyle(color: blackColor),
                        ),
                      ],
                    ),
                    const VSpacer(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person_outline),
                            const HSpacer(10),
                            Text(
                              item.staff.name,
                              style: const TextStyle(color: blackColor),
                            ),
                          ],
                        ),
                        Text(
                          DateTimeUtils.getFullDate(item.bookingDate),
                          style: const TextStyle(color: blackColor),
                        ),
                      ],
                    ),
                  ],
                ));
          }).toList()),
        ));
  }
}
