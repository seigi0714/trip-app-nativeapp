import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_num.dart';

part 'trip_invitation.freezed.dart';

@Freezed(copyWith: false, fromJson: false, toJson: false)
class TripInvitation with _$TripInvitation {
  /// 新規作成時のfactory関数
  factory TripInvitation.createNewTripInvitation({
    required int tripId,
    required TripInvitationNum invitationNum,
  }) = NewTripInvitation;

  /// 招待コード生成後のエンティティのfactory関数
  factory TripInvitation.createGeneratedTripInvitation({
    required int tripId,
    required TripInvitationNum invitationNum,
    required String invitationCode,
  }) = GeneratedTripInvitation;
}
