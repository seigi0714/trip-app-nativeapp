import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/features/auth/domain/entity/third_party_credential/third_party_credential.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/firebase_auth_interface.dart';

part 'firebase_auth_repository.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) => FirebaseAuth.instance;

@riverpod
FirebaseAuthInterface firebaseAuthRepository(FirebaseAuthRepositoryRef ref) {
  return FirebaseAuthRepository(
    ref.watch(firebaseAuthProvider),
  );
}

class FirebaseAuthRepository implements FirebaseAuthInterface {
  FirebaseAuthRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> signInWithCustomToken({
    required String customToken,
  }) =>
      _firebaseAuth.signInWithCustomToken(customToken);

  @override
  Future<void> signInWithGoogle(
    ThirdPartyCredential credential,
  ) async {
    final firebaseCredential = GoogleAuthProvider.credential(
      accessToken: credential.accessToken,
      idToken: credential.idToken,
    );
    await _firebaseAuth.signInWithCredential(firebaseCredential);
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();
}
