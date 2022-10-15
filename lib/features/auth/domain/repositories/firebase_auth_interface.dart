import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthInterface {
  Future<UserCredential> signInWithCustomToken({
    required String customToken,
  });

  Future<void> signOut();
}
