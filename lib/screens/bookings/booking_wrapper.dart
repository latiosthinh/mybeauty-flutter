import 'package:flutter/material.dart';
import 'package:mybeauty/constants.dart';
import 'package:mybeauty/screens/bookings/appointment_screen.dart';
import 'package:mybeauty/screens/bookings/booking_screen.dart';
import 'package:mybeauty/services/auth.dart';
import 'package:mybeauty/services/models.dart';

class BookingWrapper extends StatefulWidget {
  static String routeName = "/booking-wrapper";
  const BookingWrapper({Key? key}) : super(key: key);

  @override
  State<BookingWrapper> createState() => _BookingWrapperState();
}

class _BookingWrapperState extends State<BookingWrapper> {
  @override
  Widget build(BuildContext context) {
    if (AuthService().user != null) {
      return AppointmentScreen(
        color: blackColor,
        service: ServiceModel('hRsoLO4J3TeEERrZQpKl', 'Eyebrow'),
      );
    }

    return const BookingScreen();
  }
}
