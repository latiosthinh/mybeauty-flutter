import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybeauty/logger.dart';

import 'models.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void add(AddBookingModel model) {
    _firestore.collection('bookings').add({
      'userId': model.user?.uid,
      'service': model.service,
      'created': DateTime.now(),
      'bookingDate': model.bookingDate,
      'from': model.from,
      'to': model.to,
      'staff': model.staff.id
    });
    Logger.log('add booking');
  }
}
