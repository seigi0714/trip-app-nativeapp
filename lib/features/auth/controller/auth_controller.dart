import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/enum/login_type.dart';
import '../../../core/exception/exception_handler.dart';
import '../../../view/widgets/helpers/scaffold_messenger.dart';
import '../data/repositories/firebase_auth_repository.dart';
import '../domain/interactor/auth_interactor.dart';

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
