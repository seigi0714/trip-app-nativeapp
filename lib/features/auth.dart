import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/utils/loading.dart';

import '../models/api/exception/api_exception.dart';
import '../repositories/auth_repository.dart';
import '../services/scaffold_messenger.dart';

final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

final signUpWithLINEProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) {
    return () async {
      ref.read(overlayLoadingProvider.notifier).update((s) => true);
      try {
        final response =
            await ref.read(authRepositoryProvider).signUpWithLINE();
        await ref
            .read(authRepositoryProvider)
            .signInWithCustomToken(response.customToken);
        ref.read(scaffoldMessengerServiceProvider).showSnackBar('ログインしました 🙌');
      } on PlatformException catch (e) {
        ref
            .read(scaffoldMessengerServiceProvider)
            .showSnackBar('[${e.code}] ログインに失敗しました。(${e.toString()})');
      } on FirebaseException catch (e) {
        ref
            .read(scaffoldMessengerServiceProvider)
            .showSnackBarByFirebaseException(e);
      } on ApiException catch (e) {
        ref.read(scaffoldMessengerServiceProvider).showSnackBar(
          '''[${e.statusCode}] ログインに失敗しました。
          ${e.errorCode}: ${e.description}''',
        );
      } on Exception catch (e) {
        ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
      } finally {
        ref.read(overlayLoadingProvider.notifier).update((s) => false);
      }
    };
  },
);

final signOutProvider = Provider.autoDispose<Future<void> Function()>((ref) {
  return () async {
    try {
      await ref.read(firebaseAuthProvider).signOut();
      ref.read(scaffoldMessengerServiceProvider).showSnackBar('ログアウトしました 😌');
    } on FirebaseException catch (e) {
      ref
          .read(scaffoldMessengerServiceProvider)
          .showSnackBarByFirebaseException(e);
    } on Exception catch (e) {
      ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
    }
  };
});
