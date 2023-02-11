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
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_num.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_status.dart';

import 'trip_repository_test.mocks.dart';

@GenerateMocks([AbstractApiClient])
Future<void> main() async {
  late ProviderContainer providerContainer;

  final mockApiClient = MockAbstractApiClient();

  const validTitle = 'test_user';
  final validFromDate = DateTime(2023);
  final validEndDate = DateTime(2023, 1, 2);

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
    final testNewTrip = Trip.createNewTrip(
      title: validTitle,
      fromDate: validFromDate,
      endDate: validEndDate,
    );

    final validResult = Trip.createExistingTrip(
      title: validTitle,
      fromDate: validFromDate,
      endDate: validEndDate,
    );
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
  group('invite', () {
    const validTripId = 1;
    const validInvitationNum = 3;
    const validInvitationCode = 'test_code';
    final testInvitation = TripInvitation.createNewTripInvitation(
      tripId: validTripId,
      invitationNum: TripInvitationNum(value: validInvitationNum),
    ) as NewTripInvitation;

    final validResult = TripInvitation.createGeneratedTripInvitation(
      tripId: validTripId,
      invitationNum: TripInvitationNum(value: validInvitationNum),
      invitationCode: validInvitationCode,
    ) as GeneratedTripInvitation;
    test('正常系', () async {
      when(
        mockApiClient.post(
          '/trips/1/invite',
          data: {
            'invitation_num': validInvitationNum,
          },
        ),
      ).thenAnswer((_) async {
        return const ApiResponse(
          data: {
            'invitation_code': validInvitationCode,
            'invitation_num': validInvitationNum,
          },
        );
      });

      final result = await providerContainer
          .read(tripRepositoryProvider)
          .invite(testInvitation);
      expect(result, validResult);
    });
    test('準正常系 旅取得APIからエラーが返却された場合エラー返却', () async {
      when(
        mockApiClient.post(
          '/trips/1/invite',
          data: {
            'invitation_num': validInvitationNum,
          },
        ),
      ).thenThrow(unexpectedException);

      await expectLater(
        providerContainer.read(tripRepositoryProvider).invite(testInvitation),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('getInvitationByCode', () {
    const validTripId = 1;
    const validTripName = 'test_trip';
    const validInvitationNum = 3;
    const validInvitationCode = 'test_code';
    const validInvitationStatus = 'open';
    const validInvitationUserId = 9999;
    const validInvitationUserName = 'test_invitation_user';
    final validFromDate = DateTime(2022, 9);
    final validEndDate = DateTime(2022, 9, 5);
    final validExpiredDate = DateTime(2022, 08, 1, 10, 15, 11);

    final validResult = TripInvitation.createDetailTripInvitation(
        invitationCode: validInvitationCode,
        invitationUserName: validInvitationUserName,
        invitationNum: TripInvitationNum(value: validInvitationNum),
        trip: Trip.createExistingTrip(
          title: validTripName,
          fromDate: validFromDate,
          endDate: validEndDate,
        ),
        status: TripInvitationStatus.open,
        expiredAt: validExpiredDate) as DetailTripInvitation;
    test('正常系', () async {
      when(
        mockApiClient.get(
          '/trip_invitations/$validInvitationCode',
        ),
      ).thenAnswer((_) async {
        return const ApiResponse(
          data: {
            'invite_code': validInvitationCode,
            'invite_num': validInvitationNum,
            'invite_status': validInvitationStatus,
            'expired_at': '2022-08-01 10:15:11',
            'trip': {
              'from_date': '2022-09-01',
              'end_date': '2022-09-05',
              'id': validTripId,
              'name': validTripName,
            },
            'invitation_user': {
              'id': validInvitationUserId,
              'name': validInvitationUserName,
            },
          },
        );
      });

      final result = await providerContainer
          .read(tripRepositoryProvider)
          .getInvitationByCode(validInvitationCode);
      expect(result, validResult);
    });
    test('準正常系 招待取得に失敗すると例外発生させる', () async {
      when(
        mockApiClient.get(
          '/trip_invitations/$validInvitationCode',
        ),
      ).thenThrow(unexpectedException);

      await expectLater(
        providerContainer
            .read(tripRepositoryProvider)
            .getInvitationByCode(validInvitationCode),
        throwsA(isA<Exception>()),
      );
    });
  });
}
