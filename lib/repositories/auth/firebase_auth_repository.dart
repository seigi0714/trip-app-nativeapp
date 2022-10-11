import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>(
  (ref) => FirebaseAuthRepository(
    ref.watch(firebaseAuthProvider),
  ),
);

class FirebaseAuthRepository {
  FirebaseAuthRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  /// Firebase Auth のカスタムトークン認証でサインインする。
  Future<UserCredential> signInWithCustomToken(String customToken) async {
    try {
      final userCredential =
          await _firebaseAuth.signInWithCustomToken(customToken);
      return userCredential;
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
