import 'package:dio/dio.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:trip_app_nativeapp/core/cache/app_user/app_user_notifier.dart';
import 'package:trip_app_nativeapp/core/cache/app_user/model/app_user.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/dio.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';

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
          // final googleUser = await MockGoogleSignIn().signIn();
          // final signInAccount = await googleUser?.authentication;
          // final credential = GoogleAuthProvider.credential(
          //   accessToken: signInAccount?.accessToken,
          //   idToken: signInAccount?.idToken,
          // );
          final auth = MockFirebaseAuth(mockUser: firebaseAuthUser);
          // await auth.signInWithCredential(credential);

          container = ProviderContainer(
            overrides: [
              dioProvider(ApiDestination.privateTripAppV1)
                  .overrideWithValue(dio),
              firebaseAuthProvider.overrideWithValue(auth),
              // firebaseAuthUserProvider.overrideWith(
              //   (ref) => auth.userChangedStream,
              // )
            ],
          );

          dioAdapter.onGet(
            '/my/profile',
            (server) => server.reply(
              200,
              tripAppUser.toJson(),
            ),
          );

          // final appUser = await container.read(appUserNotifierProvider.future);
          // expect(appUser?.name, firebaseAuthUser.displayName);
          // expect(appUser?.email, firebaseAuthUser.email);
          // expect(appUser?.id, tripAppUser.id);
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
