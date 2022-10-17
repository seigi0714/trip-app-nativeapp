import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/google_login_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/line_login_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/trip_app_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/domain/entity/oidc/oidc_info.dart';
import 'package:trip_app_nativeapp/features/auth/domain/entity/third_party_credential/third_party_credential.dart';
import 'package:trip_app_nativeapp/features/auth/domain/interactor/auth_interactor.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/firebase_auth_interface.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/google_login_interface.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/line_login_interface.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/trip_app_auth_interface.dart';

import './auth_interactor_test.mocks.dart';

@GenerateMocks([
  FirebaseAuthInterface,
  LineLoginInterface,
  GoogleLoginInterface,
  TripAppAuthInterface,
])
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer providerContainer;
  late AuthInteractor authInteractor;

  final mockFirebaseAuthRepository = MockFirebaseAuthInterface();
  final mockLineLoginRepository = MockLineLoginInterface();
  final mockGoogleLoginRepository = MockGoogleLoginInterface();
  final mockTripAppRepository = MockTripAppAuthInterface();

  const testOidcInfo = OidcInfo(idToken: 'idToken', nonce: 'nonce');
  const testCustomToken = 'customToken';
  const testthirdPartyCredential = ThirdPartyCredential(
    idToken: 'idToken',
    accessToken: 'accessToken',
  );

  /*
   * exception
   */
  const unAuthorizationErrorCode = 'UnAuthorization';
  // LINEログインエラー
  const lineLoginErrorMessage = 'LINEログインに失敗';
  const lineLoginException = AppException(
    code: unAuthorizationErrorCode,
    message: lineLoginErrorMessage,
  );
  // trip_app_apiエラー
  const tripAppLoginErrorMessage = 'API側でエラー';
  const tripAppLoginException = AppException(
    code: unAuthorizationErrorCode,
    message: tripAppLoginErrorMessage,
  );
  // Firebaseログインエラー
  const firebaseLoginErrorMessage = 'firebaseログインに失敗';
  const firebaseLoginException = AppException(
    code: unAuthorizationErrorCode,
    message: firebaseLoginErrorMessage,
  );
  // Googleログインエラー
  const googleLoginErrorMessage = 'Googleログインに失敗';
  const googleLoginException = AppException(
    code: unAuthorizationErrorCode,
    message: googleLoginErrorMessage,
  );

  setUp(() {
    providerContainer = ProviderContainer(
      overrides: [
        firebaseAuthRepositoryProvider.overrideWithProvider(
          Provider((_) => mockFirebaseAuthRepository),
        ),
        lineLoginRepositoryProvider.overrideWithProvider(
          Provider((ref) => mockLineLoginRepository),
        ),
        googleLoginRepositoryProvider.overrideWithProvider(
          Provider((_) => mockGoogleLoginRepository),
        ),
        tripAppAuthRepositoryProvider.overrideWithProvider(
          Provider((_) => mockTripAppRepository),
        ),
      ],
    );
    authInteractor = providerContainer.read(authInteractorProvider);

    reset(mockLineLoginRepository);
    reset(mockFirebaseAuthRepository);
    reset(mockTripAppRepository);
    reset(mockGoogleLoginRepository);
  });
  // LINEログイン
  group('AuthInteractor loginWithLINE', () {
    test(
      '正常系',
      () async {
        when(mockLineLoginRepository.login())
            .thenAnswer((_) async => testOidcInfo);
        when(
          mockTripAppRepository.loginWithIdToken(
            idToken: testOidcInfo.idToken,
            nonce: testOidcInfo.nonce,
          ),
        ).thenAnswer((_) async => testCustomToken);
        when(
          mockFirebaseAuthRepository.signInWithCustomToken(
            customToken: testCustomToken,
          ),
        ).thenAnswer(
          (_) async {
            return;
          },
        );

        await expectLater(
          authInteractor.loginWithLINE(),
          completes,
        );

        verify(mockLineLoginRepository.login()).called(1);
        verify(
          mockTripAppRepository.loginWithIdToken(
            idToken: testOidcInfo.idToken,
            nonce: testOidcInfo.nonce,
          ),
        ).called(1);
        verify(
          mockFirebaseAuthRepository.signInWithCustomToken(
            customToken: testCustomToken,
          ),
        ).called(1);
      },
    );

    test('準正常系 LINEログインに失敗した際は後続の処理が呼ばれず例外を返す', () async {
      when(mockLineLoginRepository.login()).thenThrow(lineLoginException);

      await expectLater(
        () async {
          await authInteractor.loginWithLINE();
        },
        throwsA(
          isA<AppException>()
            ..having(
              (e) => e.code,
              'errorCode',
              unAuthorizationErrorCode,
            ).having(
              (e) => e.message,
              'errorMessage',
              lineLoginErrorMessage,
            ),
        ),
      );

      verify(mockLineLoginRepository.login()).called(1);
      verifyNever(
        mockTripAppRepository.loginWithIdToken(
          idToken: anyNamed('idToken'),
          nonce: anyNamed('nonce'),
        ),
      );
      verifyNever(
        mockFirebaseAuthRepository.signInWithCustomToken(
          customToken: anyNamed('customToken'),
        ),
      );
    });

    test('準正常系 API通信に失敗した場合、Firebaseログインは呼ばれず例外を返す', () async {
      when(
        mockLineLoginRepository.login(),
      ).thenAnswer(
        (_) async => testOidcInfo,
      );

      when(
        mockTripAppRepository.loginWithIdToken(
          idToken: testOidcInfo.idToken,
          nonce: testOidcInfo.nonce,
        ),
      ).thenThrow(tripAppLoginException);

      await expectLater(
        () async {
          await authInteractor.loginWithLINE();
        },
        throwsA(
          isA<AppException>()
            ..having(
              (e) => e.code,
              'errorCode',
              unAuthorizationErrorCode,
            ).having(
              (e) => e.message,
              'errorMessage',
              tripAppLoginErrorMessage,
            ),
        ),
      );

      verify(mockLineLoginRepository.login()).called(1);
      verify(
        mockTripAppRepository.loginWithIdToken(
          idToken: testOidcInfo.idToken,
          nonce: testOidcInfo.nonce,
        ),
      ).called(1);
      verifyNever(
        mockFirebaseAuthRepository.signInWithCustomToken(
          customToken: anyNamed('customToken'),
        ),
      );
    });

    test('準正常系 Firebaseでのカスタムトークンログインが失敗した場合例外を返す', () async {
      when(
        mockLineLoginRepository.login(),
      ).thenAnswer(
        (_) async => testOidcInfo,
      );
      when(
        mockTripAppRepository.loginWithIdToken(
          idToken: testOidcInfo.idToken,
          nonce: testOidcInfo.nonce,
        ),
      ).thenAnswer(
        (_) async => testCustomToken,
      );
      when(
        mockFirebaseAuthRepository.signInWithCustomToken(
          customToken: testCustomToken,
        ),
      ).thenThrow(firebaseLoginException);

      await expectLater(
        () async {
          await authInteractor.loginWithLINE();
        },
        throwsA(
          isA<AppException>()
            ..having(
              (e) => e.code,
              'errorCode',
              unAuthorizationErrorCode,
            ).having(
              (e) => e.message,
              'errorMessage',
              firebaseLoginErrorMessage,
            ),
        ),
      );

      verify(mockLineLoginRepository.login()).called(1);
      verify(
        mockTripAppRepository.loginWithIdToken(
          idToken: testOidcInfo.idToken,
          nonce: testOidcInfo.nonce,
        ),
      ).called(1);
      verify(
        mockFirebaseAuthRepository.signInWithCustomToken(
          customToken: testCustomToken,
        ),
      );
    });
  });

  // Googleログイン
  group('AuthInteractor loginWithGoogle', () {
    test(
      '正常系',
      () async {
        when(mockGoogleLoginRepository.login())
            .thenAnswer((_) async => testthirdPartyCredential);

        when(
          mockFirebaseAuthRepository.signInWithGoogle(testthirdPartyCredential),
        ).thenAnswer(
          (_) async {
            return;
          },
        );

        await expectLater(
          authInteractor.loginWithGoogle(),
          completes,
        );

        verify(mockGoogleLoginRepository.login()).called(1);
        verify(
          mockFirebaseAuthRepository.signInWithGoogle(testthirdPartyCredential),
        ).called(1);
      },
    );

    test('準正常系 googleログインに失敗すると後続の処理が呼ばれず例外を返す', () async {
      when(mockGoogleLoginRepository.login()).thenThrow(googleLoginException);

      await expectLater(
        () async {
          await authInteractor.loginWithGoogle();
        },
        throwsA(
          isA<AppException>()
            ..having(
              (e) => e.code,
              'errorCode',
              unAuthorizationErrorCode,
            ).having(
              (e) => e.message,
              'errorMessage',
              googleLoginErrorMessage,
            ),
        ),
      );

      verify(mockGoogleLoginRepository.login()).called(1);
      verifyNever(mockFirebaseAuthRepository.signInWithGoogle(any));
    });

    test('準正常系 FirebaseGoogleログインに失敗すると例外を返す', () async {
      when(
        mockGoogleLoginRepository.login(),
      ).thenAnswer(
        (_) async => testthirdPartyCredential,
      );

      when(
        mockFirebaseAuthRepository.signInWithGoogle(testthirdPartyCredential),
      ).thenThrow(
        firebaseLoginException,
      );

      await expectLater(
        () async {
          await authInteractor.loginWithGoogle();
        },
        throwsA(
          isA<AppException>()
            ..having(
              (e) => e.code,
              'errorCode',
              unAuthorizationErrorCode,
            ).having(
              (e) => e.message,
              'errorMessage',
              firebaseLoginErrorMessage,
            ),
        ),
      );

      verify(mockGoogleLoginRepository.login()).called(1);
      verify(
        mockFirebaseAuthRepository.signInWithGoogle(testthirdPartyCredential),
      ).called(1);
    });
  });
}
