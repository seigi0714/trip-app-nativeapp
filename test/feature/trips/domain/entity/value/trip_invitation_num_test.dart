import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_num.dart';

Future<void> main() async {
  group('TripInvitationNum コンストラクタ', () {
    test('正常系', () async {
      expect(
        () => TripInvitationNum(
          value: 1,
        ),
        returnsNormally,
      );
      expect(
        () => TripInvitationNum(
          value: 5,
        ),
        returnsNormally,
      );
      expect(
        () => TripInvitationNum(
          value: 10,
        ),
        returnsNormally,
      );
    });
    test('準正常系 1~10人しか招待することはできない', () async {
      expect(
        () => TripInvitationNum(
          value: 0,
        ),
        throwsA(
          isA<AppException>()
            ..having(
              (e) => e.code,
              'errorCode',
              ExceptionCode.invalidTripInvitationNum,
            ).having(
              (e) => e.message,
              'errorMessage',
              '招待人数は1~10人を指定してください。',
            ),
        ),
      );
      expect(
        () => TripInvitationNum(
          value: 11,
        ),
        throwsA(
          isA<AppException>()
            ..having(
              (e) => e.code,
              'errorCode',
              ExceptionCode.invalidTripInvitationNum,
            ).having(
              (e) => e.message,
              'errorMessage',
              '招待人数は1~10人を指定してください。',
            ),
        ),
      );
    });
  });
}
