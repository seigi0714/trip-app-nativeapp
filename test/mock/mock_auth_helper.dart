import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

Future<MockFirebaseAuth> mockSignIn(MockUser firebaseAuthUser) async {
  final googleUser = await MockGoogleSignIn().signIn();
  final signInAccount = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: signInAccount?.accessToken,
    idToken: signInAccount?.idToken,
  );
  final mockAuth = MockFirebaseAuth(mockUser: firebaseAuthUser);
  await mockAuth.signInWithCredential(credential);
  return mockAuth;
}
