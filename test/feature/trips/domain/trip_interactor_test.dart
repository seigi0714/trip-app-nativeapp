import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_app_nativeapp/features/trips/data/repositories/trip_repository.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_member.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_period.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_title.dart';
import 'package:trip_app_nativeapp/features/trips/domain/interactor/trip_interactor.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';

@GenerateMocks([TripRepository])
import 'trip_interactor_test.mocks.dart';

void main() {
  late ProviderContainer providerContainer;
  final mockTripRepo = MockTripRepository();
  final unexpectedException = Exception('想定外のエラー');

  setUp(() {
    providerContainer = ProviderContainer(
      overrides: [tripRepositoryProvider.overrideWithValue(mockTripRepo)],
    );
    reset(mockTripRepo);
  });

  group('fetchTripsByUserId', () {
    test('正常系 fetchTripsByUserId should call tripRepo.fetchUser', () async {
      when(mockTripRepo.fetchTripsByUserId(1)).thenAnswer(
        (_) => Future.value([
          Trip.createExistingTrip(
            id: 1,
            title: TripTitle(value: 'title'),
            period: TripPeriod(
              fromDate: DateTime(2023, 2, 25),
              endDate: DateTime(2023, 3, 3),
            ),
            members: [
              const TripMember.joined(
                isHost: true,
                user: AppUser(
                  id: 1,
                  name: 'Bob',
                  email: 'bob@somedomain.com',
                ),
              ),
            ],
          ) as ExistingTrip
        ]),
      );
      await expectLater(
        providerContainer.read(tripInteractorProvider).fetchTripsByUserId(1),
        completes,
      );
      verify(mockTripRepo.fetchTripsByUserId(1)).called(1);
    });
  });

  test('準正常系 fetchUser should throw exception', () {
    when(mockTripRepo.fetchTripsByUserId(1)).thenThrow(unexpectedException);
    expect(
      () =>
          providerContainer.read(tripInteractorProvider).fetchTripsByUserId(1),
      throwsA(unexpectedException),
    );
    verify(mockTripRepo.fetchTripsByUserId(1)).called(1);
  });
}
