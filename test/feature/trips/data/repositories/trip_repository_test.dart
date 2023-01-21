import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/core/http/api_client/abstract_api_client.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_client.dart';
import 'package:trip_app_nativeapp/core/http/response/api_response/api_response.dart';
import 'package:trip_app_nativeapp/features/trips/data/repositories/trip_repository.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';

import 'trip_repository_test.mocks.dart';

@GenerateMocks([AbstractApiClient])
Future<void> main() async {
  late ProviderContainer providerContainer;

  final mockApiClient = MockAbstractApiClient();

  const validTitle = 'test_user';
  final validFromDate = DateTime(2023);
  final validEndDate = DateTime(2023, 1, 2);

  final testNewTrip = Trip.createNewTrip(
    title: validTitle,
    fromDate: validFromDate,
    endDate: validEndDate,
  );

  final validResult = Trip.createCreatedTrip(
    title: validTitle,
    fromDate: validFromDate,
    endDate: validEndDate,
  );

  final unexpectedException = Exception('想定外のエラー');

  setUp(() {
    providerContainer = ProviderContainer(
      overrides: [
        privateTripAppV1ClientProvider.overrideWith((_) => mockApiClient),
      ],
    );

    reset(mockApiClient);
  });

  group('createTrip', () {
    test('正常系', () async {
      when(
        mockApiClient.post(
          '/trips',
          data: {
            'name': validTitle,
            'from_date': validFromDate.toJsonDateString(),
            'end_date': validEndDate.toJsonDateString(),
          },
        ),
      ).thenAnswer((_) async {
        return ApiResponse(
          data: {
            'name': testNewTrip.title.value,
            'from_date': testNewTrip.tripPeriod.fromDate.toJsonDateString(),
            'end_date': testNewTrip.tripPeriod.endDate.toJsonDateString(),
          },
        );
      });

      final result = await providerContainer
          .read(tripRepositoryProvider)
          .createTrip(testNewTrip);
      expect(result, validResult);
    });
    test('準正常系 旅取得APIからエラーが返却された場合エラー返却', () async {
      when(
        mockApiClient.post(
          '/trips',
          data: {
            'name': validTitle,
            'from_date': validFromDate.toJsonDateString(),
            'end_date': validEndDate.toJsonDateString(),
          },
        ),
      ).thenThrow(unexpectedException);

      await expectLater(
        providerContainer.read(tripRepositoryProvider).createTrip(testNewTrip),
        throwsA(isA<Exception>()),
      );
    });
  });
}
