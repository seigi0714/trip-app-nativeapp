import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/view/widgets/loading.dart';
import 'package:trip_app_nativeapp/features/auth/domain/interactor/auth_interactor.dart';

import '../../../../core/enum/login_provider.dart';
import '../../../../core/exception/exception_handler.dart';
import '../../../../core/view/widgets/helpers/scaffold_messenger.dart';
import '../../data/repositories/firebase_auth_repository.dart';

final firebaseAuthUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

final loginController =
    Provider.autoDispose<Future<void> Function(LoginProvider provider)>(
  (ref) {
    return (LoginProvider provider) async {
      ref.read(overlayLoadingProvider.notifier).update((s) => true);
      try {
        switch (provider) {
          case LoginProvider.line:
            await ref.read(authInteractorProvider).loginWithLINE();
            break;
          case LoginProvider.google:
            await ref.read(authInteractorProvider).loginWithGoogle();
            break;
        }

        ref.read(scaffoldMessengerServiceProvider).showSnackBar('ログインしました 🙌');
      } on Exception catch (e) {
        ref.read(exceptionHandler).handleException(e);
      } finally {
        ref.read(overlayLoadingProvider.notifier).update((s) => false);
      }
    };
  },
);

final logOutController = Provider.autoDispose<Future<void> Function()>((ref) {
  return () async {
    try {
      await ref.read(firebaseAuthProvider).signOut();
      ref.read(scaffoldMessengerHelperProvider).showSnackBar('ログアウトしました 😌');
    } on Exception catch (e) {
      ref.read(exceptionHandler).handleException(e);
    }
  };
});
