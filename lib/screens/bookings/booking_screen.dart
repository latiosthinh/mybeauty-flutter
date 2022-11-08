import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/services/booking_service.dart';
import 'package:mybeauty/services/auth.dart';
import '../../services/models.dart';

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
          margin: const EdgeInsets.only(left: 38, right: 38),
          child: Column(
              children: _bookings.map((AddBookingModel item) {
            return Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Text(item.service.name));
          }).toList()),
        ));
  }
}
