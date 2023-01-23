import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';

part 'trip_invitation_num.freezed.dart';

@Freezed(copyWith: false)
class TripInvitationNum with _$TripInvitationNum {
  factory TripInvitationNum({required int value}) {
    if (minNum > value || maxNum < value) {
      throw const AppException(
        code: ExceptionCode.invalidTripInvitationNum,
        message: '招待人数は1~10人を指定してください。',
      );
    }
    return TripInvitationNum._internal(value: value);
  }
  factory TripInvitationNum._internal({required int value}) =
      _TripInvitationNum;
  static const minNum = 1;
  static const maxNum = 10;
}
