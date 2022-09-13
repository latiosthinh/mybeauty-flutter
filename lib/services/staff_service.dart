import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybeauty/models/staff.dart';

class StaffService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Staff>> getStaffs() async {
    List<Staff> returnValue = [];
    await _firestore.collection('staffs').get().then((value) => {
          for (var staff in value.docs)
            {
              returnValue.add(Staff(staff.get('name'), staff.get('avatar'),
                  staff.get('rate'), staff.id))
            }
        });
    return returnValue;
  }
}
