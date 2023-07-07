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

  const validTripId = 1;
  const validTripTitle = 'test_trip_title';
  final validFromDate = DateTime(2023);
  final validEndDate = DateTime(2023, 1, 2);
  const validUserId = 1;
  const validName = 'Bob';
  const validEmail = 'bob@somedomain.com';

  setUp(() {
    providerContainer = ProviderContainer(
      overrides: [tripRepositoryProvider.overrideWithValue(mockTripRepo)],
    );
    reset(mockTripRepo);
  });

  group('fetchTripsByUserId', () {
    test('正常系 fetchTripsByUserId should call tripRepo.fetchUser', () async {
      when(mockTripRepo.fetchTripsByUserId(validTripId)).thenAnswer(
        (_) => Future.value([
          Trip.createExistingTrip(
            id: validTripId,
            title: TripTitle(value: validTripTitle),
            period: TripPeriod(
              fromDate: validFromDate,
              endDate: validEndDate,
            ),
            members: [
              const TripMember.joined(
                isHost: true,
                user: AppUser(
                  id: validUserId,
                  name: validName,
                  email: validEmail,
                ),
              ),
            ],
            belongings: [],
          ) as ExistingTrip
        ]),
      );
      await expectLater(
        providerContainer
            .read(tripInteractorProvider)
            .fetchTripsByUserId(validTripId),
        completes,
      );
      verify(mockTripRepo.fetchTripsByUserId(validTripId)).called(1);
    });
  });

  test('準正常系 fetchUser should throw exception', () {
    when(mockTripRepo.fetchTripsByUserId(validTripId))
        .thenThrow(unexpectedException);
    expect(
      () => providerContainer
          .read(tripInteractorProvider)
          .fetchTripsByUserId(validTripId),
      throwsA(unexpectedException),
    );
    verify(mockTripRepo.fetchTripsByUserId(validTripId)).called(1);
  });

  group(
    'updateTrip',
    () {
      final testExistingTrip = Trip.createExistingTrip(
        id: validTripId,
        title: TripTitle(value: validTripTitle),
        period: TripPeriod(
          fromDate: validFromDate,
          endDate: validEndDate,
        ),
        // tripRepo.updateTrip では、メンバーと持ち物の更新はできないので、空の List を渡す。
        members: [],
        belongings: [],
      ) as ExistingTrip;

      const validMember = TripMember.joined(
        isHost: true,
        user: AppUser(id: validUserId, name: validName, email: validEmail),
      );

      final expectedTrip = Trip.createExistingTrip(
        id: validTripId,
        title: TripTitle(value: validTripTitle),
        period: TripPeriod(
          fromDate: validFromDate,
          endDate: validEndDate,
        ),
        members: [validMember],
        belongings: [],
      ) as ExistingTrip;

      test(
        '正常系',
        () async {
          when(
            mockTripRepo.updateTrip(
              trip: testExistingTrip,
            ),
          ).thenAnswer(
            (_) => Future.value(expectedTrip),
          );

          final result =
              await providerContainer.read(tripInteractorProvider).updateTrip(
                    validTripId,
                    validTripTitle,
                    validFromDate,
                    validEndDate,
                  );
          verify(mockTripRepo.updateTrip(trip: testExistingTrip)).called(1);
          expect(result, expectedTrip);
        },
      );

      test(
        '準正常系 tripRepo.updateTrip で例外がスローされた場合、それをリスローする',
        () async {
          when(
            mockTripRepo.updateTrip(trip: testExistingTrip),
          ).thenAnswer((_) => Future.error(unexpectedException));

          await expectLater(
            providerContainer.read(tripInteractorProvider).updateTrip(
                  validTripId,
                  validTripTitle,
                  validFromDate,
                  validEndDate,
                ),
            throwsA(isA<Exception>()),
          );
        },
      );
    },
  );
}
