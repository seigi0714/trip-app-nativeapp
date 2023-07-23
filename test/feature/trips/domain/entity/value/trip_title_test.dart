import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_title.dart';

void main() {
  const validTitle = 'test_user';
  const emptyTitle = '';
  const longTitle = 'test_title_test_title_test_title_test_title_test_title';

  group('TripTitle コンストラクタ', () {
    test('正常系', () {
      expect(() => TripTitle(value: validTitle), returnsNormally);
    });
    test('異常系 タイトルは空文字は受け付けない', () {
      expect(
        () => TripTitle(value: emptyTitle),
        throwsA(
          isA<AssertionError>().having(
            (e) => e.message,
            'message',
            'UI のコードによって、空文字が入力されないように制御してください',
          ),
        ),
      );
    });

    test(
      '異常系 26文字以上のタイトルは受け付けない',
      () {
        expect(
          () => TripTitle(value: longTitle),
          throwsA(
            isA<AssertionError>().having(
              (e) => e.message,
              'message',
              'UI のコードによって、26文字以上の文字列が入力されないように制御してください',
            ),
          ),
          reason: '26文字以上の場合 trip-app-backend がエラーを返すため',
        );
      },
    );
  });
}
