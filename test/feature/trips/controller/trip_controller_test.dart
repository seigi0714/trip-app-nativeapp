import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';
import 'package:trip_app_nativeapp/core/exception/exception_handler.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/features/trips/domain/interactor/trip_interactor.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';

import '../../../mock/mock_exception_handler.dart';
import '../../../mock/mock_scaffold_messenger_helper.dart';
import 'trip_controller_test.mocks.dart';

@GenerateMocks([TripInteractor])
Future<void> main() async {
  late ProviderContainer providerContainer;

  final mockTripInteractor = MockTripInteractor();
  final mockScaffoldMessengerHelper = MockScaffoldMessengerHelper();
  final mockExceptionHandler = MockExceptionHandler();

  // callbackがちゃんと呼ばれているかチェックするため
  // 実際にはScaffoldMessengerHelperのメソッドが呼ばれているわけでは無い
  final mockOnSuccess = MockScaffoldMessengerHelper();

  const validName = 'test_user';
  final validFromDate = DateTime(2023);
  final validEndDate = DateTime(2023, 1, 2);
  final invalidEndDate = DateTime(2022, 12, 31);

  final unexpectedException = Exception('想定外のエラー');

  setUp(() {
    providerContainer = ProviderContainer(
      overrides: [
        tripInteractorProvider.overrideWith((_) => mockTripInteractor),
        scaffoldMessengerHelperProvider.overrideWith(
          (_) => mockScaffoldMessengerHelper,
        ),
        exceptionHandlerProvider.overrideWith((_) => mockExceptionHandler),
      ],
    );

    reset(mockTripInteractor);
    reset(mockScaffoldMessengerHelper);
    reset(mockExceptionHandler);
  });

  group('createTrip', () {
    test('正常系', () async {
      when(
        mockTripInteractor.createTrip(
          validName,
          validFromDate,
          validEndDate,
        ),
      ).thenAnswer((_) async {});
      when(
        mockScaffoldMessengerHelper.showSnackBar(
          createTripSuccessMessage,
        ),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(tripControllerProvider).createTrip(
              title: validName,
              fromDate: validFromDate,
              endDate: validEndDate,
              onSuccess: () => mockOnSuccess.showSnackBar('成功時コールバック'),
            ),
        completes,
      );

      verify(
        mockTripInteractor.createTrip(
          validName,
          validFromDate,
          validEndDate,
        ),
      ).called(1);
      verify(
        mockScaffoldMessengerHelper.showSnackBar(
          createTripSuccessMessage,
        ),
      ).called(1);
      verify(mockOnSuccess.showSnackBar('成功時コールバック')).called(1);
    });
    test('準正常系 タイトルが空文字の場合旅作成は行わない', () async {
      when(
        mockExceptionHandler.handleException(
          const AppException(
            code: ExceptionCode.invalidFormValue,
            message: emptyTripTitleMessage,
          ),
        ),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(tripControllerProvider).createTrip(
              title: '',
              fromDate: validFromDate,
              endDate: validEndDate,
              onSuccess: () => mockOnSuccess.showSnackBar('成功時コールバック'),
            ),
        completes,
      );

      verifyNever(
        mockTripInteractor.createTrip(
          '',
          validFromDate,
          validEndDate,
        ),
      );
      verify(
        mockExceptionHandler.handleException(
          const AppException(
            code: ExceptionCode.invalidFormValue,
            message: emptyTripTitleMessage,
          ),
        ),
      ).called(1);
      verifyNever(mockOnSuccess.showSnackBar('成功時コールバック'));
    });
    test('準正常系 帰宅日が出発日より以前の日付の場合旅作成は行わない', () async {
      when(
        mockExceptionHandler.handleException(
          const AppException(
            code: ExceptionCode.invalidFormValue,
            message: tripDateCompareErrorMessage,
          ),
        ),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(tripControllerProvider).createTrip(
              title: validName,
              fromDate: validFromDate,
              endDate: invalidEndDate,
              onSuccess: () => mockOnSuccess.showSnackBar('成功時コールバック'),
            ),
        completes,
      );

      verifyNever(
        mockTripInteractor.createTrip(
          validName,
          validFromDate,
          invalidEndDate,
        ),
      );
      verify(
        mockExceptionHandler.handleException(
          const AppException(
            code: ExceptionCode.invalidFormValue,
            message: tripDateCompareErrorMessage,
          ),
        ),
      ).called(1);
      verifyNever(mockOnSuccess.showSnackBar('成功時コールバック'));
    });
    test('異常系 旅作成に失敗', () async {
      when(
        mockExceptionHandler.handleException(
          unexpectedException,
        ),
      ).thenReturn(null);

      when(
        mockTripInteractor.createTrip(
          validName,
          validFromDate,
          validEndDate,
        ),
      ).thenThrow(unexpectedException);

      await expectLater(
        providerContainer.read(tripControllerProvider).createTrip(
              title: validName,
              fromDate: validFromDate,
              endDate: validEndDate,
              onSuccess: () => mockOnSuccess.showSnackBar('成功時コールバック'),
            ),
        completes,
      );

      verify(
        mockTripInteractor.createTrip(
          validName,
          validFromDate,
          validEndDate,
        ),
      ).called(1);
      verifyNever(
        mockScaffoldMessengerHelper.showSnackBar(
          createTripSuccessMessage,
        ),
      );
      verify(
        mockExceptionHandler.handleException(unexpectedException),
      ).called(1);
      verifyNever(mockOnSuccess.showSnackBar('成功時コールバック'));
    });
  });
}
