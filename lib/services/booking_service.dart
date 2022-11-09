import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybeauty/models/index.dart';
import 'package:mybeauty/models/staff.dart';
import 'package:mybeauty/services/services.dart';

AuthService _authService = AuthService();

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
    final bookings = await _firestore
        .collection('bookings')
        .where('userId', isEqualTo: userID)
        .orderBy('bookingDate')
        .get();
    for (var booking in bookings.docs) {
      final service = await _firestore.doc(booking.get('service').path).get();
      final staff = await _firestore.doc(booking.get('staff').path).get();
      final user = _authService.user;
      returnValue.add(AddBookingModel(
        ServiceModel.fromJson(service.data(), booking.get('service').id),
        (booking.data()['bookingDate'] as Timestamp).toDate(),
        (booking.data()['bookingTime'] as Timestamp).toDate(),
        Staff.fromJson(staff.data(), booking.get('staff').id),
        user,
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
        return false;
      }
    }
    return true;
  }
}
