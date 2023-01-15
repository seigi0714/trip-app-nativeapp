import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/enum/login_type.dart';
import 'package:trip_app_nativeapp/core/exception/exception_handler.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/domain/interactor/auth_interactor.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';
import 'package:trip_app_nativeapp/view/widgets/loading.dart';

part 'auth_controller.g.dart';

final firebaseAuthUserProvider = StreamProvider.autoDispose<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

@riverpod
AuthController authController(AuthControllerRef ref) => AuthController(ref);

class AuthController {
  AuthController(this._ref);

  final Ref _ref;

  Future<void> login(LoginType loginType) async {
    _ref.read(overlayLoadingProvider.notifier).startLoading();
    try {
      switch (loginType) {
        case LoginType.line:
          await _ref.read(authInteractorProvider).loginWithLINE();
          break;
        case LoginType.google:
          await _ref.read(authInteractorProvider).loginWithGoogle();
          break;
      }
      _ref.read(scaffoldMessengerHelperProvider).showSnackBar('ログインしました 🙌');
    } on Exception catch (e) {
      _ref.read(exceptionHandlerProvider).handleException(e);
    } finally {
      _ref.read(overlayLoadingProvider.notifier).endLoading();
    }
  }

  Future<void> logOut() async {
    try {
      await _ref.read(firebaseAuthRepositoryProvider).signOut();
      _ref.read(scaffoldMessengerHelperProvider).showSnackBar('ログアウトしました 😌');
    } on Exception catch (e) {
      _ref.read(exceptionHandlerProvider).handleException(e);
    }
  }
}
