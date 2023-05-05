import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';

part 'trip_invitation_num.freezed.dart';

/// 招待リンクから参加可能な人数の上限
/// 招待リンク作成時に、ユーザーに人数を入力させないので、初期値を10人にしておく
@Freezed(copyWith: false)
class TripInvitationNum with _$TripInvitationNum {
  factory TripInvitationNum({int value = maxNum}) {
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
