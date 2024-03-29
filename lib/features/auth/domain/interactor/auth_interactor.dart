import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/google_login_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/line_login_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/trip_app_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/firebase_auth_interface.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/google_login_interface.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/line_login_interface.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/trip_app_auth_interface.dart';

part 'auth_interactor.g.dart';

@riverpod
AuthInteractor authInteractor(AuthInteractorRef ref) {
  return AuthInteractor(
    firebaseAuthInterface: ref.watch(firebaseAuthRepositoryProvider),
    lineLoginInterface: ref.watch(lineLoginRepositoryProvider),
    tripAppAuthInterface: ref.watch(tripAppAuthRepositoryProvider),
    googleLoginInterface: ref.watch(googleLoginRepositoryProvider),
  );
}

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
    final googleAccount = await googleLoginInterface.login();
    await firebaseAuthInterface.signInWithGoogle(googleAccount.credential);
    try {
      await tripAppAuthInterface.createUserWithFirebaseIdToken(
        name: googleAccount.displayName,
      );
    } on Exception catch (_) {
      // ユーザー登録に失敗した場合いかなる失敗でもFirebaseサインアウト
      await firebaseAuthInterface.signOut();
      rethrow;
    }
  }
}
