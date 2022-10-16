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

  @override
  Future<void> signInWithCustomToken({
    required String customToken,
  }) =>
      _firebaseAuth.signInWithCustomToken(customToken);

  @override
  Future<void> signOut() => _firebaseAuth.signOut();
}
