import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybeauty/logger.dart';

import 'models.dart';

class BookingService {
  static String collection = 'bookings';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void add(AddBookingModel model) {
    _firestore.collection(collection).add({
      'userId': model.user?.uid,
      'userName': model.user?.displayName,
      'userPhone': model.user?.phoneNumber,
      'userEmail': model.user?.email,
      'service': model.service,
      'created': DateTime.now(),
      'bookingDate': model.bookingDate,
      'staffId': model.staff.id,
      'bookingTime': model.bookingTime,
      'staff': model.staff.id
    });
    Logger.log(
        '[add booking] userId:${model.user?.email}, service: ${model.service}, staff: ${model.staff.name}, date: ${model.bookingDate.day}');
  }

  Future<bool> isExist(AddBookingModel model) async {
    final snapshot = await _firestore
        .collection(collection)
        .where('staffId', isEqualTo: model.staff.id)
        .where('bookingDate', isEqualTo: model.bookingDate)
        .where('bookingTime', isGreaterThanOrEqualTo: model.bookingTime)
        .where('bookingTime', isGreaterThanOrEqualTo: model.bookingTime)
        .get();
    if (snapshot.docs.isEmpty) {
      return false;
    }
    Logger.log('[Valid booking time] ${model.staff.id}, ${model.bookingTime}');
    return true;
  }
}
