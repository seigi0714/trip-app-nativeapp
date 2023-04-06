import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_name.dart';

Future<void> main() async {
  const validTitle = '持ち物１';
  const emptyTitle = '';

  group('TripBelongingName コンストラクタ', () {
    test('正常系', () async {
      expect(() => TripBelongingName(value: validTitle), returnsNormally);
    });
    test('純正常系 持ち物名は空文字は受け付けない', () async {
      expect(
        () => TripBelongingName(value: emptyTitle),
        throwsA(
          isA<AppException>()
              .having(
                (e) => e.code,
                'errorCode',
                ExceptionCode.invalidTripBelongingName,
              )
              .having(
                (e) => e.message,
                'errorMessage',
                '持ち物名が空文字です',
              ),
        ),
      );
    });
  });
}
