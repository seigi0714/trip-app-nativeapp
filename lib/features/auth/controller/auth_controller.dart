import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/enum/login_type.dart';
import 'package:trip_app_nativeapp/core/exception/exception_handler.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/domain/interactor/auth_interactor.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';

part 'auth_controller.g.dart';

final firebaseAuthUserProvider = StreamProvider.autoDispose<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

@riverpod
Future<void> login(
  LoginRef ref,
  LoginType loginType,
) async {
  try {
    switch (loginType) {
      case LoginType.line:
        await ref.read(authInteractorProvider).loginWithLINE();
        break;
      case LoginType.google:
        await ref.read(authInteractorProvider).loginWithGoogle();
        break;
    }
    ref.read(scaffoldMessengerHelperProvider).showSnackBar('ログインしました 🙌');
  } on Exception catch (e) {
    ref.read(exceptionHandlerProvider).handleException(e);
  }
}

@riverpod
Future<void> logOut(LogOutRef ref) async {
  try {
    await ref.read(firebaseAuthRepositoryProvider).signOut();
    ref.read(scaffoldMessengerHelperProvider).showSnackBar('ログアウトしました 😌');
  } on Exception catch (e) {
    ref.read(exceptionHandlerProvider).handleException(e);
  }
}
