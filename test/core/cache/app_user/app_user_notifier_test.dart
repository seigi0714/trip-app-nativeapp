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
  // AppUserNotifier のテスト
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
          container = ProviderContainer(
            overrides: [
              dioProvider(ApiDestination.privateTripAppV1)
                  .overrideWithValue(dio),
              firebaseAuthProvider.overrideWithValue(
                MockFirebaseAuth(mockUser: firebaseAuthUser),
              ),
            ],
          );

          dioAdapter.onGet(
            '/my/profile',
            (server) => server.reply(
              200,
              tripAppUser.toJson(),
            ),
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
