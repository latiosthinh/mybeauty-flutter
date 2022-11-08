import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybeauty/models/staff.dart';

class StaffService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Staff>> getStaffs() async {
    final snapshot = await _firestore
        .collection('staffs')
        .get(const GetOptions(source: Source.cache));
    return snapshot.docs.map((e) => Staff.fromJson(e.data(), e.id)).toList();
  }
}
