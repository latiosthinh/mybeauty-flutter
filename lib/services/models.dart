import 'package:firebase_auth/firebase_auth.dart';
import 'package:mybeauty/models/index.dart';
import 'package:mybeauty/models/staff.dart';

class AddBookingModel {
  final ServiceModel service;
  final DateTime bookingDate;
  final DateTime bookingTime;
  final Staff staff;
  final User? user;

  AddBookingModel(
      this.service, this.bookingDate, this.bookingTime, this.staff, this.user);
}

class ClientModel {
  final User user;

  ClientModel(this.user);
}

class MenuModel {
  final String id;
  final String name;
  final String image;
  bool isExpanded = false;
  final List<ServiceModel> services;

  MenuModel(this.id, this.name, this.services, this.image);
}
