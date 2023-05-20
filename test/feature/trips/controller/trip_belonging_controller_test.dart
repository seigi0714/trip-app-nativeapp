import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/dio.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_belonging_controller.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_name.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_num.dart';

import '../../../mock/async_value_listener.dart';

Future<void> main() async {
  late ProviderContainer providerContainer;

  final dio = Dio(BaseOptions(validateStatus: (status) => true));
  final dioAdapter = DioAdapter(dio: dio);

  const testTripId = 1;
  final testFetchBelongings = [
    AddedTripBelonging(
      id: 1,
      name: TripBelongingName(value: '持ち物1'),
      numOf: TripBelongingNum(value: 5),
      isShareAmongMember: true,
      isChecked: false,
    ),
    AddedTripBelonging(
      id: 2,
      name: TripBelongingName(value: '持ち物2'),
      numOf: TripBelongingNum(value: 10),
      isShareAmongMember: true,
      isChecked: true,
    ),
  ];

  final testAddBelonging = AddedTripBelonging(
    id: 3,
    name: TripBelongingName(value: '持ち物3'),
    numOf: TripBelongingNum(value: 10),
    isShareAmongMember: false,
    isChecked: false,
  );

  final asyncValueListener =
      AsyncValueListener<AsyncValue<List<AddedTripBelonging>>>();

  setUp(() {
    dioAdapter.onGet(
      '/trips/$testTripId/belongings',
      (server) => server.reply(
        200,
        <String, dynamic>{
          'data': [
            {
              'id': 1,
              'name': '持ち物1',
              'num_of': 5,
              'is_share_among_member': true,
              'is_checked': false,
            },
            {
              'id': 2,
              'name': '持ち物2',
              'num_of': 10,
              'is_share_among_member': true,
              'is_checked': true,
            }
          ],
        },
      ),
    );
    providerContainer = ProviderContainer(
      overrides: [
        dioProvider(ApiDestination.privateTripAppV1).overrideWithValue(dio),
      ],
    )..listen(
        tripBelongingsControllerProvider(tripId: testTripId),
        asyncValueListener.call,
        fireImmediately: true,
      );
  });

  group('コンストラクター', () {
    test('正常系', () async {
      final result = await providerContainer
          .read(tripBelongingsControllerProvider(tripId: testTripId).future);

      expect(result, testFetchBelongings);
      verify(
        () => asyncValueListener(
          null,
          const AsyncLoading<List<AddedTripBelonging>>(),
        ),
      );
    });
  });

  group('addBelonging', () {
    test('正常系', () async {
      dioAdapter.onPost(
        '/trips/$testTripId/belongings',
        data: {
          'name': testAddBelonging.name.value,
          'num_of': testAddBelonging.numOf.value,
          'is_share_among_member': testAddBelonging.isShareAmongMember,
        },
        (server) => server.reply(
          201,
          <String, dynamic>{
            'data': {
              'id': 3,
              'name': testAddBelonging.name.value,
              'num_of': testAddBelonging.numOf.value,
              'is_share_among_member': testAddBelonging.isShareAmongMember,
              'is_checked': false,
            },
          },
        ),
      );
      await providerContainer
          .read(tripBelongingsControllerProvider(tripId: testTripId).notifier)
          .addBelonging(
            tripId: testTripId,
            name: testAddBelonging.name.value,
            numOf: testAddBelonging.numOf.value,
            isShareAmongMember: testAddBelonging.isShareAmongMember,
          );
      final result = await providerContainer.read(
        tripBelongingsControllerProvider(tripId: testTripId).future,
      );
      expect(result, [testAddBelonging, ...testFetchBelongings]);
    });
  });
}
