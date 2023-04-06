import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_num.dart';

Future<void> main() async {

  group('TripBelongingName コンストラクタ', () {
    test('正常系', () async {
      expect(() => TripBelongingNum(value: 100), returnsNormally);
    });
    test('純正常系 持ち物は0個で指定できない', () async {
      expect(
        () => TripBelongingNum(value: 0),
        throwsA(
          isA<AppException>()
              .having(
                (e) => e.code,
                'errorCode',
                ExceptionCode.invalidTripBelongingNum,
              )
              .having(
                (e) => e.message,
                'errorMessage',
                '持ち物の個数を1個以上指定してください',
              ),
        ),
      );
    });
  });
}
