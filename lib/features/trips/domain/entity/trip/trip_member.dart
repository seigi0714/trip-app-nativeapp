import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';

part 'trip_member.freezed.dart';

@Freezed(copyWith: false, fromJson: false, toJson: false)
class TripMember with _$TripMember {
  /// 参加済みのメンバーの factory 関数
  const factory TripMember.joined({
    required bool isHost,
    required AppUser user,
  }) = JoinedTripMember;
}
