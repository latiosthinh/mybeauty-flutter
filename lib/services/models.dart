import 'package:firebase_auth/firebase_auth.dart';
import 'package:mybeauty/models/staff.dart';

class AddBookingModel {
  final String service;
  final DateTime bookingDate;
  final DateTime bookingTime;
  final Staff staff;
  final User? user;

  AddBookingModel(
      this.service, this.bookingDate, this.bookingTime, this.staff, this.user);
}

class MenuModel {
  final String id;
  final String name;
  final String image;
  bool isExpanded = false;
  final List<ServiceModel> services;

  MenuModel(this.id, this.name, this.services, this.image);
}

class ServiceModel {
  final String id;
  final String name;
  final String description;
  final String duration;
  final String price;

  ServiceModel(this.id, this.name, this.description, this.duration, this.price);

  factory ServiceModel.fromJson(Map<String, dynamic> json, String id) {
    return ServiceModel(id, json['name'], json['description'], json['duration'], json['price']);
  }
}
