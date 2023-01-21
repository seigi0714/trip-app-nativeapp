import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_period.dart';

Future<void> main() async {
  group('TripPeriod コンストラクタ', () {
    test('正常系 fromDateとendDateが同じ日付', () async {
      expect(
        () => TripPeriod(
          fromDate: DateTime.now(),
          endDate: DateTime.now(),
        ),
        returnsNormally,
      );
    });
    test('正常系 endDateがfromDateより未来の日付', () async {
      expect(
        () => TripPeriod(
          fromDate: DateTime.now(),
          endDate: DateTime.now().add(
            const Duration(days: 1),
          ),
        ),
        returnsNormally,
      );
    });
    test('純正常系 endDateがfromDateより過去の日付の場合エラー', () async {
      expect(
        () => TripPeriod(
          fromDate: DateTime.now(),
          endDate: DateTime.now().subtract(const Duration(days: 1)),
        ),
        throwsA(
          isA<AppException>()
            ..having(
              (e) => e.code,
              'errorCode',
              ExceptionCode.invalidTripPeriod,
            ).having(
              (e) => e.message,
              'errorMessage',
              '帰宅日が出発日過去より日付になっています。',
            ),
        ),
      );
    });
  });
}
