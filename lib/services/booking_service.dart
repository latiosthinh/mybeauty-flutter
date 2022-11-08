import 'package:cloud_firestore/cloud_firestore.dart';
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
      'createdDate': DateTime.now(),
      'bookingDate': model.bookingDate,
      'bookingTime': model.bookingTime,
      'service': _firestore.doc('services/${model.service.id}'),
      'staff': _firestore.doc('staffs/${model.staff.id}'),
      'staffId': model.staff.id,
    });
  }

  Future<List<AddBookingModel>> getBookings(String userID) async {
    List<AddBookingModel> returnValue = [];
    final bookings =
        await _firestore.collection('bookings')
          .where('userId', isEqualTo: userID)
          .orderBy('bookingDate')
          .get(const GetOptions(source: Source.cache));
    for (var booking in bookings.docs) {
      returnValue
          .add(AddBookingModel(
            booking.get('service'),
            booking.get('bookingDate'),
            booking.get('bookingTime'),
            booking.get('staff'),
            booking.get('user'),
          ));
    }
    return returnValue;
  }

  Future<bool> isExist(AddBookingModel model) async {
    final snapshot = await _firestore
        .collection(collection)
        .where('staffId', isEqualTo: model.staff.id)
        .where('bookingDate', isEqualTo: model.bookingDate)
        .get();
    if (snapshot.docs.isEmpty) {
      return false;
    }
    for (var work in snapshot.docs) {
      if (model.bookingTime
              .isAfter((work.get('bookingTime') as Timestamp).toDate()) &&
          model.bookingTime.isBefore((work.get('bookingTime') as Timestamp)
              .toDate()
              .add(Duration(minutes: (model.service.duration * 60).round())))) {
        return true;
      }
    }
    return false;
  }
}
