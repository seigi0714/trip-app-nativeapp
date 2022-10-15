import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/repositories/firebase_auth_interface.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final firebaseAuthRepositoryProvider = Provider<FirebaseAuthInterface>(
  (ref) => FirebaseAuthRepository(
    ref.watch(firebaseAuthProvider),
  ),
);

class FirebaseAuthRepository implements FirebaseAuthInterface {
  FirebaseAuthRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  /// Firebase Auth のカスタムトークン認証でサインインする。
  @override
  Future<UserCredential> signInWithCustomToken({
    required String customToken,
  }) async {
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

  @override
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
