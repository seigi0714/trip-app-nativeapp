abstract class FirebaseAuthInterface {
  Future<void> signInWithCustomToken({
    required String customToken,
  });

  Future<void> signOut();
}
