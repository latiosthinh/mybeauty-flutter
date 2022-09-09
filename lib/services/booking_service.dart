import 'package:cloud_firestore/cloud_firestore.dart';

import 'models.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void add(AddBookingModel model) {
    _firestore.collection('bookings').add({
      'name': 'Đinh Công Tân',
      'service': model.service,
      'created': DateTime.now(),
      'phone': '0762559696',
      'email': 'f7deat@gmail.com',
      'bookingDate': model.bookingDate,
      'from': model.from,
      'to': model.to,
      'staff': model.staff
    });
  }
}
