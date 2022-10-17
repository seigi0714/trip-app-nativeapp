import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/google_login_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/line_login_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/trip_app_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/domain/entity/oidc/oidc_info.dart';
import 'package:trip_app_nativeapp/features/auth/domain/entity/third_perty_credential/third_perty_credential.dart';
import 'package:trip_app_nativeapp/features/auth/domain/interactor/auth_interactor.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/firebase_auth_interface.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/google_login_interface.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/line_login_interface.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/trip_app_auth_interface.dart';

import './auth_intaractor_test.mocks.dart';

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
  const testThirdPertyCredential = ThirdPertyCredential(
    idToken: 'idToken',
    accessToken: 'accessToken',
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
  });
  // LINEログイン
  group('AuthIntaractor loginWithLINE', () {
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
        await authInteractor.loginWithLINE();
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
  });
  // Googleログイン
  group('AuthIntaractor loginWithGoogle', () {
    test(
      '正常系',
      () async {
        when(mockGoogleLoginRepository.login())
            .thenAnswer((_) async => testThirdPertyCredential);
        await authInteractor.loginWithGoogle();
        verify(mockGoogleLoginRepository.login()).called(1);
        verify(
          mockFirebaseAuthRepository.signInWithGoogle(testThirdPertyCredential),
        ).called(1);
      },
    );
  });
}
