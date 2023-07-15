import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_app_nativeapp/core/exception/exception_handler.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/dio.dart';
import 'package:trip_app_nativeapp/core/http/network_connectivity.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_member.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_period.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_title.dart';
import 'package:trip_app_nativeapp/features/trips/domain/interactor/trip_interactor.dart';
import 'package:trip_app_nativeapp/features/user/controller/app_user_controller.dart';
import 'package:trip_app_nativeapp/features/user/data/models/get_user_response.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';

import '../../../mock/async_value_listener.dart';
import '../../../mock/mock_auth_helper.dart';
import '../../../mock/mock_exception_handler.dart';
import '../../../mock/mock_scaffold_messenger_helper.dart';
import 'trip_controller_test.mocks.dart';

@GenerateMocks([TripInteractor])
Future<void> main() async {
  late ProviderContainer providerContainer;
  final dio = Dio(BaseOptions(validateStatus: (status) => true));

  final mockTripInteractor = MockTripInteractor();
  final mockScaffoldMessengerHelper = MockScaffoldMessengerHelper();
  final mockExceptionHandler = MockExceptionHandler();

  // callbackがちゃんと呼ばれているかチェックするため
  // 実際にはScaffoldMessengerHelperのメソッドが呼ばれているわけでは無い
  final mockOnSuccess = MockScaffoldMessengerHelper();

  const validTripId = 1;
  const validTitleValue = 'test_trip';
  final validFromDate = DateTime(2023);
  final validEndDate = DateTime(2023, 1, 2);
  const validUserId = 1;
  const validName = 'Bob';
  const validEmail = 'bob@somedomain.com';
  const validMember = TripMember.joined(
    isHost: true,
    user: AppUser(id: validUserId, name: validName, email: validEmail),
  );
  final mockFirebaseAuthUser =
      MockUser(email: validEmail, displayName: validName);
  final mockAuth = await mockSignIn(mockFirebaseAuthUser);
  const validUserDataRes =
      GetUserResponse(id: validUserId, name: validName, email: validEmail);
  final validUserRes = <String, dynamic>{
    'data': validUserDataRes.toJson(),
  };
  final mockConnectivity = Stream<ConnectivityResult>.fromIterable(
    [ConnectivityResult.mobile],
  );
  final asyncValueListener =
      AsyncValueListener<AsyncValue<List<ExistingTrip>>>();
  final unexpectedException = Exception('想定外のエラー');

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    DioAdapter(dio: dio).onGet(
      '/my/profile',
      (server) => server.reply(
        200,
        validUserRes,
      ),
    );

    providerContainer = ProviderContainer(
      overrides: [
        dioProvider(ApiDestination.privateTripAppV1).overrideWithValue(dio),
        tripInteractorProvider.overrideWith((_) => mockTripInteractor),
        firebaseAuthProvider.overrideWithValue(mockAuth),
        networkConnectivityProvider.overrideWith((ref) => mockConnectivity),
        scaffoldMessengerHelperProvider.overrideWith(
          (_) => mockScaffoldMessengerHelper,
        ),
        exceptionHandlerProvider.overrideWith((_) => mockExceptionHandler),
      ],
    )..listen(
        tripsControllerProvider,
        asyncValueListener.call,
        fireImmediately: true,
      );

    // TripsController.build() で appUserControllerProvider を watch しているので、
    // appUserControllerProvider の初期化を完了させておく。
    await providerContainer.read(appUserControllerProvider.future);

    reset(mockTripInteractor);
    reset(mockScaffoldMessengerHelper);
    reset(mockExceptionHandler);
  });

  group('TripsController.build', () {
    test('正常系', () async {
      final testTrip = ExistingTrip(
        id: validTripId,
        title: TripTitle(value: validTitleValue),
        period: TripPeriod(
          fromDate: validFromDate,
          endDate: validEndDate,
        ),
        members: [validMember],
        belongings: [],
      );

      final expectedTripList = [
        ExistingTrip(
          id: validTripId,
          title: TripTitle(value: validTitleValue),
          period: TripPeriod(
            fromDate: validFromDate,
            endDate: validEndDate,
          ),
          members: [validMember],
          belongings: [],
        )
      ];

      when(
        mockTripInteractor.fetchTripsByUserId(validUserId),
      ).thenAnswer(
        (_) => Future.value([testTrip]),
      );

      final result =
          await providerContainer.read(tripsControllerProvider.future);

      expect(result, expectedTripList);
      verify(
        mockTripInteractor.fetchTripsByUserId(validUserId),
      ).called(1);
    });
  });

  group('TripsController.createTrip', () {
    const newTripId = 2;
    final newTrip = ExistingTrip(
      id: newTripId,
      title: TripTitle(value: validTitleValue),
      period: TripPeriod(
        fromDate: validFromDate,
        endDate: validEndDate,
      ),
      // TODO(shimizu-saffle): post のレスポンスにメンバー情報を含めるように改修次第テストデータを入れる
      members: [],
      belongings: [],
    );

    test('正常系', () async {
      when(
        mockTripInteractor.fetchTripsByUserId(validUserId),
      ).thenAnswer((_) async => <ExistingTrip>[]);

      when(
        mockTripInteractor.createTrip(
          validTitleValue,
          validFromDate,
          validEndDate,
        ),
      ).thenAnswer((_) => Future.value(newTrip));

      when(
        mockScaffoldMessengerHelper.showSnackBar(
          createTripSuccessMessage,
        ),
      ).thenReturn(null);

      await expectLater(
        providerContainer.read(tripsControllerProvider.notifier).createTrip(
              title: validTitleValue,
              fromDate: validFromDate,
              endDate: validEndDate,
              onSuccess: () => mockOnSuccess.showSnackBar('成功時コールバック'),
            ),
        completes,
      );

      verify(
        mockTripInteractor.createTrip(
          validTitleValue,
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

    test('異常系 旅作成に失敗', () async {
      when(
        mockExceptionHandler.handleException(
          unexpectedException,
        ),
      ).thenReturn(null);

      when(
        mockTripInteractor.createTrip(
          validTitleValue,
          validFromDate,
          validEndDate,
        ),
      ).thenThrow(unexpectedException);

      await expectLater(
        providerContainer.read(tripsControllerProvider.notifier).createTrip(
              title: validTitleValue,
              fromDate: validFromDate,
              endDate: validEndDate,
              onSuccess: () => mockOnSuccess.showSnackBar('成功時コールバック'),
            ),
        completes,
      );

      verify(
        mockTripInteractor.createTrip(
          validTitleValue,
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

  // TODO(seigi0714): generateAndCopyInviteLinkのテスト実装
}
