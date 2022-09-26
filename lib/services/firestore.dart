import 'package:firebase_storage/firebase_storage.dart';

class FireStore {
  final FirebaseStorage _firestore = FirebaseStorage.instance;

  Future<String> getAvatar(String imageFile) async {
    final ref = _firestore.ref().child(imageFile);
    return await ref.getDownloadURL();
  }
}
