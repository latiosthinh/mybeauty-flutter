import 'package:firebase_auth/firebase_auth.dart';

class AddBookingModel {
  final String service;
  final DateTime bookingDate;
  final DateTime from;
  final DateTime to;
  final String staff;
  final User? user;

  AddBookingModel(this.service, this.bookingDate, this.from, this.to,
      this.staff, this.user);
}
