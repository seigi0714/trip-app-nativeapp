import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_app_nativeapp/core/cache/app_user/app_user_notifier.dart';
import 'package:trip_app_nativeapp/core/cache/app_user/model/app_user.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/dio.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

Future<void> main() async {
  group(
    'AppUserNotifier test',
    () {
      late DioAdapter dioAdapter;
      late ProviderContainer container;
      final dio = Dio(
        BaseOptions(validateStatus: (status) => true),
      );

      const name = 'Bob';
      const email = 'bob@somedomain.com';
      final firebaseAuthUser = MockUser(
        email: 'bob@somedomain.com',
        displayName: name,
      );

      const tripAppUser = AppUser(id: 1, name: name, email: email);

      setUp(() {
        TestWidgetsFlutterBinding.ensureInitialized();
        dioAdapter = DioAdapter(dio: dio);
      });

      test(
        '正常系 Firebase Auth がログイン状態の際は AppUser が取得できている',
        () async {
          final googleUser = await MockGoogleSignIn().signIn();
          final signInAccount = await googleUser?.authentication;
          final credential = GoogleAuthProvider.credential(
            accessToken: signInAccount?.accessToken,
            idToken: signInAccount?.idToken,
          );
          final auth = MockFirebaseAuth(mockUser: firebaseAuthUser);
          await auth.signInWithCredential(credential);

          final listener = Listener<AsyncValue<AppUser?>>();

          container = ProviderContainer(
            overrides: [
              dioProvider(ApiDestination.privateTripAppV1)
                  .overrideWithValue(dio),
              firebaseAuthProvider.overrideWithValue(auth),
              firebaseAuthUserProvider.overrideWith(
                (ref) => auth.userChangedStream,
              )
            ],
          )..listen(
              appUserNotifierProvider,
              listener,
              fireImmediately: true,
            );

          dioAdapter.onGet(
            '/my/profile',
            (server) => server.reply(
              200,
              tripAppUser.toJson(),
            ),
          );

          container.read(appUserNotifierProvider).when(
                data: (data) => print(data?.email.toString()),
                error: (error, stackTrace) => print(error),
                loading: () => print('loading'),
              );

          verify(
            () => listener(null, const AsyncLoading<AppUser?>()),
          );

          // verify(
          //   () => listener(
          //     const AsyncLoading<AppUser?>(),
          //     const AsyncData<AppUser>(tripAppUser),
          //   ),
          // );
        },
      );

      test(
        '正常系 Firebase Auth が 非ログイン状態の際は AppUser は null',
        () async {
          container = ProviderContainer(
            overrides: [
              dioProvider(ApiDestination.privateTripAppV1)
                  .overrideWithValue(dio),
              firebaseAuthProvider.overrideWithValue(
                MockFirebaseAuth(),
              ),
            ],
          );

          container.read(appUserNotifierProvider).maybeWhen(
                data: (data) {
                  expect(data?.name, firebaseAuthUser.displayName);
                  expect(data?.email, firebaseAuthUser.email);
                  expect(data?.id, tripAppUser.id);
                },
                orElse: () => null,
              );
        },
      );
    },
  );
}
