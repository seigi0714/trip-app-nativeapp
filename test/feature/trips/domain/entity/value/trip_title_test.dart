import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_title.dart';

Future<void> main() async {
  const validTitle = 'test_user';
  const emptyTitle = '';

  group('TripTitle コンストラクタ', () {
    test('正常系', () async {
      expect(() => TripTitle(validTitle), returnsNormally);
    });
    test('純正常系 タイトルは空文字は受け付けない', () async {
      expect(
        () => TripTitle(emptyTitle),
        throwsA(
          isA<AppException>()
            ..having(
              (e) => e.code,
              'errorCode',
              ExceptionCode.invalidTripTitle,
            ).having(
              (e) => e.message,
              'errorMessage',
              '旅のタイトルが空文字です。',
            ),
        ),
      );
    });
  });
}
