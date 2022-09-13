import 'package:firebase_auth/firebase_auth.dart';
import 'package:mybeauty/models/staff.dart';

class AddBookingModel {
  final String service;
  final DateTime bookingDate;
  final DateTime from;
  final DateTime to;
  final Staff staff;
  final User? user;

  AddBookingModel(this.service, this.bookingDate, this.from, this.to,
      this.staff, this.user);
}

class MenuModel {
  final String id;
  final String name;
  bool isExpanded = false;
  final List<ServiceModel> services;

  MenuModel(this.id, this.name, this.services);
}

class ServiceModel {
  final String id;
  final String name;

  ServiceModel(this.id, this.name);
}
