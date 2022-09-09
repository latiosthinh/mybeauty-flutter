import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybeauty/models/staff.dart';

class StaffService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Staff>> GetStaffs() async {
    List<Staff> returnValue = [];
    await _firestore.collection('staffs').get().then((value) => {
          value.docs.forEach((element) {
            returnValue.add(Staff(element.get('name'), element.get('avatar'),
                element.get('rate')));
          })
        });
    return returnValue;
  }
}
