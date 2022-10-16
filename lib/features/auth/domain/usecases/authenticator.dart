import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/line_login_repository.dart';

import '../../data/repositories/trip_app_auth_repository.dart';
import '../repositories/firebase_auth_interface.dart';
import '../repositories/line_login_interface.dart';
import '../repositories/trip_app_auth_interface.dart';

final authenticatorProvider = Provider<Authenticator>((ref) {
  return Authenticator(
    firebaseAuthInterface: ref.watch(firebaseAuthRepositoryProvider),
    lineLoginInterface: ref.watch(lineLoginRepositoryProvider),
    tripAppAuthInterface: ref.watch(tripAppAuthRepositoryProvider),
  );
});

class Authenticator {
  Authenticator({
    required this.lineLoginInterface,
    required this.tripAppAuthInterface,
    required this.firebaseAuthInterface,
  });

  final LineLoginInterface lineLoginInterface;
  final TripAppAuthInterface tripAppAuthInterface;
  final FirebaseAuthInterface firebaseAuthInterface;

  Future<void> loginWithLINE() async {
    final oidcInfo = await lineLoginInterface.login();
    final response = await tripAppAuthInterface.loginWithIdToken(
      idToken: oidcInfo.idToken,
      nonce: oidcInfo.nonce,
    );
    await firebaseAuthInterface.signInWithCustomToken(
      customToken: response,
    );
  }
}
