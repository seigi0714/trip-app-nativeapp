import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_app_nativeapp/core/enum/login_type.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_handler.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/domain/interactor/auth_interactor.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';
import 'package:trip_app_nativeapp/view/widgets/loading.dart';

import '../../../mock/loading_provider_listener.dart';
import '../../../mock/mock_exception_handler.dart';
import '../../../mock/mock_scaffold_messenger_helper.dart';
import '../interactor/auth_interactor_test.mocks.dart';
import 'auth_controller_test.mocks.dart';

@GenerateMocks([AuthInteractor])
Future<void> main() async {
  late ProviderContainer providerContainer;
  late LoadingProviderListener loadingProviderListener;

  final mockAuthInteractor = MockAuthInteractor();
  final mockScaffoldMessengerHelper = MockScaffoldMessengerHelper();
  final mockExceptionHandler = MockExceptionHandler();
  final mockFirebaseAuthRepository = MockFirebaseAuthInterface();

  const loginMessage = 'ログインしました 🙌';
  const logoutMessage = 'ログアウトしました 😌';

  const loginException = AppException(
    code: 'unAuthorization',
    message: 'ログインに失敗しました。',
  );
  const logoutException = AppException(
    code: 'unAuthorization',
    message: 'ログアウトに失敗しました。',
  );

  setUp(() {
    providerContainer = ProviderContainer(
      overrides: [
        authInteractorProvider.overrideWith((_) => mockAuthInteractor),
        scaffoldMessengerHelperProvider.overrideWith(
          (_) => mockScaffoldMessengerHelper,
        ),
        exceptionHandlerProvider.overrideWith((_) => mockExceptionHandler),
        firebaseAuthRepositoryProvider.overrideWith(
          (_) => mockFirebaseAuthRepository,
        )
      ],
    );
    loadingProviderListener = LoadingProviderListener();

    // プロバイダ内の値を監視する
    providerContainer.listen<bool>(
      overlayLoadingProvider,
      loadingProviderListener,
      fireImmediately: true,
    );

    reset(mockAuthInteractor);
    reset(mockScaffoldMessengerHelper);
    reset(loadingProviderListener);
    reset(mockExceptionHandler);
    reset(mockFirebaseAuthRepository);
  });

  group('login', () {
    test('正常系 LINEログイン', () async {
      when(mockAuthInteractor.loginWithLINE()).thenAnswer((_) async {});
      when(
        mockScaffoldMessengerHelper.showSnackBar(
          loginMessage,
        ),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(authControllerProvider).login(LoginType.line),
        completes,
      );

      verify(mockAuthInteractor.loginWithLINE()).called(1);
      verify(
        mockScaffoldMessengerHelper.showSnackBar(
          loginMessage,
        ),
      ).called(1);
    });

    test('正常系 Googleログイン', () async {
      when(mockAuthInteractor.loginWithGoogle()).thenAnswer((_) async {});
      when(
        mockScaffoldMessengerHelper.showSnackBar(
          loginMessage,
        ),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(authControllerProvider).login(LoginType.google),
        completes,
      );

      verify(mockAuthInteractor.loginWithGoogle()).called(1);
      verify(
        mockScaffoldMessengerHelper.showSnackBar(
          loginMessage,
        ),
      ).called(1);
    });

    test('準正常系 LINEログインに失敗するとExceptionハンドラーが呼ばれる', () async {
      when(mockAuthInteractor.loginWithLINE()).thenThrow(loginException);
      when(
        mockExceptionHandler.handleException(
          loginException,
        ),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(authControllerProvider).login(LoginType.line),
        completes,
      );

      verify(mockAuthInteractor.loginWithLINE()).called(1);
      verify(mockExceptionHandler.handleException(loginException)).called(1);
      verifyNever(
        mockScaffoldMessengerHelper.showSnackBar(
          loginMessage,
        ),
      );
    });

    test('準正常系 Googleログインに失敗するとExceptionハンドラーが呼ばれる', () async {
      when(mockAuthInteractor.loginWithGoogle()).thenThrow(loginException);
      when(
        mockExceptionHandler.handleException(
          loginException,
        ),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(authControllerProvider).login(LoginType.google),
        completes,
      );

      verify(mockAuthInteractor.loginWithGoogle()).called(1);
      verify(mockExceptionHandler.handleException(loginException)).called(1);
      verifyNever(
        mockScaffoldMessengerHelper.showSnackBar(
          loginMessage,
        ),
      );
    });
  });

  group('logOut', () {
    test('正常系', () async {
      when(mockFirebaseAuthRepository.signOut()).thenAnswer((_) async {});
      when(
        mockScaffoldMessengerHelper.showSnackBar(logoutMessage),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(authControllerProvider).logOut(),
        completes,
      );

      verify(mockFirebaseAuthRepository.signOut()).called(1);
      verify(mockScaffoldMessengerHelper.showSnackBar(logoutMessage)).called(1);
    });

    test('準正常系 Firebaseログアウトに失敗', () async {
      when(mockFirebaseAuthRepository.signOut()).thenThrow(logoutException);
      when(
        mockExceptionHandler.handleException(logoutException),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(authControllerProvider).logOut(),
        completes,
      );

      verify(mockFirebaseAuthRepository.signOut()).called(1);
      verify(mockExceptionHandler.handleException(logoutException)).called(1);
      verifyNever(mockScaffoldMessengerHelper.showSnackBar(logoutMessage));
    });
  });
}
