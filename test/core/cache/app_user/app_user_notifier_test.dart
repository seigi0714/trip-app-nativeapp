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

import '../../../mock/async_value_listener.dart';

Future<void> main() async {
  group(
    'AppUserNotifier test',
    () {
      late DioAdapter dioAdapter;
      late ProviderContainer container;
      final dio = Dio(
        BaseOptions(
          validateStatus: (status) => true,
        ),
      );

      const name = 'Bob';
      const email = 'bob@somedomain.com';
      final firebaseAuthUser = MockUser(email: email, displayName: name);
      const tripAppUser = AppUser(id: 1, name: name, email: email);

      setUp(() {
        TestWidgetsFlutterBinding.ensureInitialized();
        dioAdapter = DioAdapter(dio: dio);
      });

      test(
        '正常系 Firebase Auth がログイン状態の場合は AppUser が取得できている',
        () async {
          final googleUser = await MockGoogleSignIn().signIn();
          final signInAccount = await googleUser?.authentication;
          final credential = GoogleAuthProvider.credential(
            accessToken: signInAccount?.accessToken,
            idToken: signInAccount?.idToken,
          );
          final mockAuth = MockFirebaseAuth(mockUser: firebaseAuthUser);
          await mockAuth.signInWithCredential(credential);
          final asyncValueListener = AsyncValueListener<AsyncValue<AppUser?>>();

          container = ProviderContainer(
            overrides: [
              dioProvider(ApiDestination.privateTripAppV1)
                  .overrideWithValue(dio),
              firebaseAuthProvider.overrideWithValue(mockAuth),
              firebaseAuthUserProvider.overrideWith(
                (ref) => mockAuth.userChangedStream,
              )
            ],
          )..listen(
              appUserNotifierProvider,
              asyncValueListener,
              fireImmediately: true,
            );

          final testResponse = <String, dynamic>{
            'data': tripAppUser.toJson(),
          };

          dioAdapter.onGet(
            '/my/profile',
            (server) => server.reply(
              200,
              testResponse,
            ),
          );

          container.read(appUserNotifierProvider);

          verify(
            () => asyncValueListener(
              null,
              const AsyncLoading<AppUser?>(),
            ),
          );

          // /my/profile [get] からの response が返ってくるまで待つ
          await Future<void>.delayed(const Duration(seconds: 1));

          verify(
            () => asyncValueListener(
              const AsyncLoading<AppUser?>(),
              const AsyncData<AppUser?>(
                AppUser(id: 1, name: name, email: email),
              ),
            ),
          );
        },
      );

      // TODO(shimizu-saffle): 書く
      // test(
      //   '正常系 Firebase Auth が 非ログイン状態の場合は AppUser は null',
      //   () async {},
      // );
    },
  );
}
