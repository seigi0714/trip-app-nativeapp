import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/widgets/loading.dart';

import '../models/api/exception/api_exception.dart';
import '../models/api/exception/app_exception.dart';
import '../repositories/auth/firebase_auth_repository.dart';
import '../repositories/auth/line_login_repository.dart';
import '../repositories/auth/trip_app_auth_repository.dart';
import '../services/app/scaffold_messenger.dart';

final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

final signUpWithLINEProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) {
    return () async {
      ref.read(overlayLoadingProvider.notifier).update((s) => true);
      try {
        final result = await ref.read(lineLoginRepositoryProvider).login();
        final idToken = result.accessToken.idTokenRaw;
        final nonce = result.idTokenNonce;
        if (idToken == null || nonce == null) {
          throw const AppException(message: 'idToken または nonce が取得できませんでした');
        }
        final response =
            await ref.read(tripAppAuthRepositoryProvider).loginWithIdToken(
                  idToken: idToken,
                  nonce: nonce,
                );
        await ref
            .read(firebaseAuthRepositoryProvider)
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
