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
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_member.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_name.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_num.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_num.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_status.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_period.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_title.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';

import 'trip_repository_test.mocks.dart';

@GenerateMocks([AbstractApiClient])
Future<void> main() async {
  late ProviderContainer providerContainer;

  final mockApiClient = MockAbstractApiClient();

  const validTripId = 999;
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
      title: TripTitle(value: validTitle),
      period: TripPeriod(
        fromDate: validFromDate,
        endDate: validEndDate,
      ),
    ) as NewTrip;

    final validResult = Trip.createExistingTrip(
      id: validTripId,
      title: TripTitle(value: validTitle),
      period: TripPeriod(
        fromDate: validFromDate,
        endDate: validEndDate,
      ),
      members: [],
      belongings: [],
    ) as ExistingTrip;
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
            'id': validTripId,
            'name': testNewTrip.title.value,
            'from_date': testNewTrip.period.fromDate.toJsonDateString(),
            'end_date': testNewTrip.period.endDate.toJsonDateString(),
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

  group(
    'fetchTripsByUserId',
    () {
      const validTripId = 999;
      const validUserId = 1;
      const validName = 'Bob';
      const validEmail = 'bob@somedomain.com';
      const validMember = TripMember.joined(
        isHost: true,
        user: AppUser(id: validUserId, name: validName, email: validEmail),
      );
      final validResult = [
        Trip.createExistingTrip(
          id: validTripId,
          title: TripTitle(value: validTitle),
          period: TripPeriod(
            fromDate: validFromDate,
            endDate: validEndDate,
          ),
          members: [validMember],
          belongings: [],
        ),
      ];

      test('正常系', () async {
        when(
          mockApiClient.get(
            '/users/$validUserId/trips',
          ),
        ).thenAnswer((_) async {
          return ApiResponse(
            data: {
              'items': [
                {
                  'id': validTripId,
                  'name': validTitle,
                  'members': [
                    {
                      'member': {
                        'id': validUserId,
                        'name': validName,
                        'email': validEmail,
                      },
                      'is_host': true,
                    },
                  ],
                  'from_date': validFromDate.toJsonDateString(),
                  'end_date': validEndDate.toJsonDateString(),
                },
              ]
            },
          );
        });

        final result = await providerContainer
            .read(tripRepositoryProvider)
            .fetchTripsByUserId(validUserId);
        expect(result, validResult);
      });
      test('準正常系 旅取得APIへのリクエスト時の例外はそのままリスローされるはず', () async {
        when(
          mockApiClient.get(
            '/users/$validUserId/trips',
          ),
        ).thenThrow(unexpectedException);

        await expectLater(
          providerContainer
              .read(tripRepositoryProvider)
              .fetchTripsByUserId(validUserId),
          throwsA(isA<Exception>()),
        );
      });
    },
  );
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
        id: validTripId,
        title: TripTitle(value: validTripName),
        period: TripPeriod(
          fromDate: validFromDate,
          endDate: validEndDate,
        ),
        members: [],
        belongings: [],
      ),
      status: TripInvitationStatus.open,
      expiredAt: validExpiredDate,
    ) as DetailTripInvitation;
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

  group('addTripBelonging', () {
    const validTripId = 1;
    const validBelongingId = 99;
    const validBelongingName = '持ち物１';
    const validBelongingNumOf = 10;
    final validBelonging = TripBelonging.createNewTripBelonging(
      name: TripBelongingName(value: validBelongingName),
      numOf: TripBelongingNum(value: validBelongingNumOf),
      isShareAmongMember: true,
    ) as NewTripBelonging;

    final validResult = TripBelonging.createAddedTripBelonging(
      id: validBelongingId,
      name: TripBelongingName(value: validBelongingName),
      numOf: TripBelongingNum(value: validBelongingNumOf),
      isShareAmongMember: true,
      isChecked: false,
    ) as AddedTripBelonging;
    test('正常系', () async {
      when(
        mockApiClient.post(
          '/trips/$validTripId/belongings',
          data: {
            'name': validBelongingName,
            'num_of': validBelongingNumOf,
            'is_share_among_member': true,
          },
        ),
      ).thenAnswer((_) async {
        return const ApiResponse(
          data: {
            'id': validBelongingId,
            'name': validBelongingName,
            'num_of': validBelongingNumOf,
            'is_share_among_member': true,
          },
        );
      });

      final result = await providerContainer
          .read(tripRepositoryProvider)
          .addTripBelonging(validTripId, validBelonging);
      expect(result, validResult);
    });
    test('準正常系 持ち物追加に失敗すると例外を返却', () async {
      when(
        mockApiClient.post(
          '/trips/$validTripId/belongings',
          data: {
            'name': validBelongingName,
            'num_of': validBelongingNumOf,
            'is_share_among_member': true,
          },
        ),
      ).thenThrow(unexpectedException);

      await expectLater(
        providerContainer
            .read(tripRepositoryProvider)
            .addTripBelonging(validTripId, validBelonging),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('fetchTripBelongings', () {
    const validTripId = 1;
    const validBelongingId = 99;
    const validBelongingName = '持ち物１';
    const validBelongingNumOf = 10;
    const validBelonging2Id = 9999;
    const validBelonging2Name = '持ち物2';
    const validBelonging2NumOf = 5;

    final validResult = [
      TripBelonging.createAddedTripBelonging(
        id: validBelongingId,
        name: TripBelongingName(value: validBelongingName),
        numOf: TripBelongingNum(value: validBelongingNumOf),
        isShareAmongMember: true,
        isChecked: false,
      ) as AddedTripBelonging,
      TripBelonging.createAddedTripBelonging(
        id: validBelonging2Id,
        name: TripBelongingName(value: validBelonging2Name),
        numOf: TripBelongingNum(value: validBelonging2NumOf),
        isShareAmongMember: true,
        isChecked: true,
      ) as AddedTripBelonging,
    ];
    test('正常系', () async {
      when(
        mockApiClient.get('/trips/$validTripId/belongings'),
      ).thenAnswer((_) async {
        return const ApiResponse(
          data: {
            'items': [
              {
                'id': validBelongingId,
                'name': validBelongingName,
                'num_of': validBelongingNumOf,
                'is_share_among_member': true,
              },
              {
                'id': validBelonging2Id,
                'name': validBelonging2Name,
                'num_of': validBelonging2NumOf,
                'is_share_among_member': true,
                'is_checked': true,
              },
            ]
          },
        );
      });

      final result = await providerContainer
          .read(tripRepositoryProvider)
          .fetchTripBelongings(validTripId);
      expect(result, validResult);
    });
    test('準正常系 持ち物追加に失敗すると例外を返却', () async {
      when(
        mockApiClient.get('/trips/$validTripId/belongings'),
      ).thenThrow(unexpectedException);

      await expectLater(
        providerContainer
            .read(tripRepositoryProvider)
            .fetchTripBelongings(validTripId),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('changeBelongingCheckStatus', () {
    const validBelongingId = 99;
    test('正常系', () async {
      when(
        mockApiClient.put(
          '/trip_belongings/$validBelongingId/check_status',
          data: {
            'is_checked': true,
          },
        ),
      ).thenAnswer((_) async {
        return const ApiResponse(
          data: {'is_checked': true},
        );
      });

      final result = await providerContainer
          .read(tripRepositoryProvider)
          .changeBelongingCheckStatus(
            belongingId: validBelongingId,
            isChecked: true,
          );
      expect(result, true);
    });

    test('正常系', () async {
      when(
        mockApiClient.put(
          '/trip_belongings/$validBelongingId/check_status',
          data: {
            'is_checked': true,
          },
        ),
      ).thenThrow(unexpectedException);

      await expectLater(
        providerContainer
            .read(tripRepositoryProvider)
            .changeBelongingCheckStatus(
              belongingId: validBelongingId,
              isChecked: true,
            ),
        throwsA(
          isA<Exception>(),
        ),
      );
    });
  });
}
