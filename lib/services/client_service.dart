import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybeauty/services/services.dart';

AuthService _authService = AuthService();

class ClientService {
  static String collection = 'clients';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addClient() async {
    final snapshot = await _firestore
        .collection(collection)
        .doc(_authService.user?.uid)
        .get();

    if (snapshot.exists) {
      return;
    }

    _firestore.collection(collection).doc(_authService.user?.uid).set({
      'name': _authService.user?.displayName,
      'phone': _authService.user?.phoneNumber,
      'email': _authService.user?.email,
    });
  }
}
