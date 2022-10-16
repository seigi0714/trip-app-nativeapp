import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/google_login_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/line_login_repository.dart';

import '../../data/repositories/trip_app_auth_repository.dart';
import '../repositories/firebase_auth_interface.dart';
import '../repositories/google_login_interface.dart';
import '../repositories/line_login_interface.dart';
import '../repositories/trip_app_auth_interface.dart';

final authInteractorProvider = Provider<AuthInteractor>((ref) {
  return AuthInteractor(
    firebaseAuthInterface: ref.watch(firebaseAuthRepositoryProvider),
    lineLoginInterface: ref.watch(lineLoginRepositoryProvider),
    tripAppAuthInterface: ref.watch(tripAppAuthRepositoryProvider),
    googleLoginInterface: ref.watch(googleLoginRepositoryProvider),
  );
});

class AuthInteractor {
  AuthInteractor({
    required this.lineLoginInterface,
    required this.tripAppAuthInterface,
    required this.firebaseAuthInterface,
    required this.googleLoginInterface,
  });

  final LineLoginInterface lineLoginInterface;
  final TripAppAuthInterface tripAppAuthInterface;
  final FirebaseAuthInterface firebaseAuthInterface;
  final GoogleLoginInterface googleLoginInterface;

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

  Future<void> loginWithGoogle() async {
    final credential = await googleLoginInterface.login();
    await firebaseAuthInterface.signInWithGoogle(credential);

    // TODO(seigi0714): ユーザー登録APIをコール
  }
}
