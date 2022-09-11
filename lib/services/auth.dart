import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mybeauty/logger.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> anonymousLogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      Logger.error(e.message);
    }
  }

  Future<void> googleLogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await auth.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      Logger.error(e.message);
    }
  }

  Future<void> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      Logger.error(e.message);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
