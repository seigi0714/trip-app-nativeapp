import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/features/auth/domain/entity/app_user/app_user.dart';

part 'trip_member.freezed.dart';
part 'trip_member.g.dart';

@freezed
class TripMember with _$TripMember {
  const factory TripMember({
    required AppUser member,
    required bool isHost,
  }) = _TripMember;

  factory TripMember.fromJson(Map<String, dynamic> json) =>
      _$TripMemberFromJson(json);
}
