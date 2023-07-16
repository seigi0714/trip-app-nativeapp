import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/dio.dart';
import 'package:trip_app_nativeapp/core/http/network_connectivity.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/user/controller/app_user_controller.dart';
import 'package:trip_app_nativeapp/features/user/data/models/get_user_response.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';

import '../../../mock/async_value_listener.dart';
import '../../../mock/mock_auth_helper.dart';

Future<void> main() async {
  group(
    'AppUserNotifier test',
    () {
      late ProviderContainer container;
      final dio = Dio(BaseOptions(validateStatus: (status) => true));
      const name = 'Bob';
      const email = 'bob@somedomain.com';
      final firebaseAuthUser = MockUser(email: email, displayName: name);
      const userRes = GetUserResponse(id: 1, name: name, email: email);
      final asyncValueListener = AsyncValueListener<AsyncValue<AppUser?>>();
      final mockConnectivity = Stream<ConnectivityResult>.fromIterable(
        [ConnectivityResult.mobile],
      );
      final testResponse = <String, dynamic>{
        'data': userRes.toJson(),
      };

      setUp(TestWidgetsFlutterBinding.ensureInitialized);

      test(
        '正常系 Firebase Auth がログイン状態の場合は AppUser が取得できている',
        () async {
          final (mockAuth, mockDio) = await mockLogin(
            mockFirebaseUser: firebaseAuthUser,
            dio: dio,
            mockUserRes: testResponse,
          );

          container = ProviderContainer(
            overrides: [
              dioProvider(ApiDestination.privateTripAppV1)
                  .overrideWithValue(mockDio),
              firebaseAuthProvider.overrideWithValue(mockAuth),
              networkConnectivityProvider
                  .overrideWith((ref) => mockConnectivity),
            ],
          )..listen(
              appUserControllerProvider,
              asyncValueListener.call,
              fireImmediately: true,
            );

          await container.read(appUserControllerProvider.future);

          verify(
            () => asyncValueListener(
              null,
              const AsyncLoading<AppUser?>(),
            ),
          );

          verify(
            () => asyncValueListener(
              const AsyncLoading<AppUser?>(),
              const AsyncData<AppUser?>(
                AppUser(id: 1, name: name, email: email),
              ),
            ),
          );

          verifyNoMoreInteractions(asyncValueListener);
        },
      );

      test(
        '準正常系 非ログイン状態の場合は AppUser は null',
        () async {
          final mockAuth = MockFirebaseAuth(mockUser: firebaseAuthUser);
          container = ProviderContainer(
            overrides: [
              dioProvider(ApiDestination.privateTripAppV1)
                  .overrideWithValue(dio),
              firebaseAuthProvider.overrideWithValue(mockAuth),
              networkConnectivityProvider
                  .overrideWith((ref) => mockConnectivity),
            ],
          )..listen(
              appUserControllerProvider,
              asyncValueListener.call,
              fireImmediately: true,
            );

          await container.read(appUserControllerProvider.future);

          verify(
            () => asyncValueListener(
              null,
              const AsyncLoading<AppUser?>(),
            ),
          );

          verify(
            () => asyncValueListener(
              const AsyncLoading<AppUser?>(),
              const AsyncData<AppUser?>(null),
            ),
          );

          verifyNoMoreInteractions(asyncValueListener);

          final appUser =
              await container.read(appUserControllerProvider.future);
          expect(appUser, null);
        },
      );
    },
  );
}
