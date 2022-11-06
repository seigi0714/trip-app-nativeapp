import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/features/auth/domain/interactor/auth_interactor.dart';
import 'package:trip_app_nativeapp/view/widgets/loading.dart';

import '../../../core/enum/login_type.dart';
import '../../../core/exception/exception_handler.dart';
import '../../../view/widgets/helpers/scaffold_messenger.dart';
import '../data/repositories/firebase_auth_repository.dart';

final firebaseAuthUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

final loginController =
    Provider.autoDispose<Future<void> Function(LoginType loginType)>(
  (ref) {
    return (LoginType loginType) async {
      ref.read(overlayLoadingProvider.notifier).update((s) => true);
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
      } finally {
        ref.read(overlayLoadingProvider.notifier).update((s) => false);
      }
    };
  },
);

final logOutController = Provider.autoDispose<Future<void> Function()>((ref) {
  return () async {
    try {
      await ref.read(firebaseAuthRepositoryProvider).signOut();
      ref.read(scaffoldMessengerHelperProvider).showSnackBar('ログアウトしました 😌');
    } on Exception catch (e) {
      ref.read(exceptionHandlerProvider).handleException(e);
    }
  };
});
