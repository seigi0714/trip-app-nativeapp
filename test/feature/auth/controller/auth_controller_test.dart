import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_app_nativeapp/core/enum/login_type.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';
import 'package:trip_app_nativeapp/features/auth/domain/interactor/auth_interactor.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';
import 'package:trip_app_nativeapp/view/widgets/loading.dart';

import '../../../mock/listener.dart';
import '../../../mock/mock_exception_handler.dart';
import '../../../mock/mock_scaffold_messanger_helper.dart';
import 'auth_controller_test.mocks.dart';

@GenerateMocks([AuthInteractor])
Future<void> main() async {
  late ProviderContainer providerContainer;
  late LoadingProviderListener loadingProviderListener;

  final mockAuthInteractor = MockAuthInteractor();
  final mockScaffoldMessangerHelper = MockScaffoldMessangerHelper();
  final mockExceptionHandler = MockExceptionHandler();

  const loginMessage = 'ログインしました 🙌';
  const logoutMessage = 'ログアウトしました 😌';

  setUp(() {
    providerContainer = ProviderContainer(
      overrides: [
        authInteractorProvider.overrideWithProvider(
          Provider((_) => mockAuthInteractor),
        ),
        scaffoldMessengerHelperProvider.overrideWithProvider(
          Provider.autoDispose(
            (ref) => mockScaffoldMessangerHelper,
          ),
        ),
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
    reset(mockScaffoldMessangerHelper);
    reset(loadingProviderListener);
  });

  group('loginController', () {
    test('正常系 LINEログイン', () async {
      when(mockAuthInteractor.loginWithLINE()).thenAnswer((_) async {});
      when(
        mockScaffoldMessangerHelper.showSnackBar(
          loginMessage,
        ),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(loginController).call(LoginType.line),
        completes,
      );

      verify(mockAuthInteractor.loginWithLINE()).called(1);
      verify(
        mockScaffoldMessangerHelper.showSnackBar(
          loginMessage,
        ),
      ).called(1);
      // verifyNever(mockExceptionHandler.handleException);
      // 初期ローディングが呼ばれていることを確認
      verify(loadingProviderListener(false, true)).called(1);
      // ローディングが終了していることを確認
      verify(loadingProviderListener(true, false)).called(1);
    });

    test('正常系 Googleログイン', () async {
      when(mockAuthInteractor.loginWithGoogle()).thenAnswer((_) async {});
      when(
        mockScaffoldMessangerHelper.showSnackBar(
          loginMessage,
        ),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(loginController).call(LoginType.google),
        completes,
      );

      verify(mockAuthInteractor.loginWithGoogle()).called(1);
      verify(
        mockScaffoldMessangerHelper.showSnackBar(
          loginMessage,
        ),
      ).called(1);
      // verifyNever(mockExceptionHandler.handleException);
      // 初期ローディングが呼ばれていることを確認
      verify(loadingProviderListener(false, true)).called(1);
      // ローディングが終了していることを確認
      verify(loadingProviderListener(true, false)).called(1);
    });
  });
}
