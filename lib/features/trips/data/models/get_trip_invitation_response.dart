import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_trip_invitation_response.freezed.dart';
part 'get_trip_invitation_response.g.dart';

@freezed
class GetTripInvitationResponse with _$GetTripInvitationResponse {
  const factory GetTripInvitationResponse({
    required String invitationCode,
    required int invitationNum,
    required TripItem trip,
    required InvitationUserItem invitationUser,
  }) = _GetTripInvitationResponse;

  factory GetTripInvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTripInvitationResponseFromJson(json);
}

@freezed
class InvitationUserItem with _$InvitationUserItem {
  const factory InvitationUserItem({
    required int id,
    required String name,
  }) = _InvitationUserItem;

  factory InvitationUserItem.fromJson(Map<String, dynamic> json) =>
      _$InvitationUserItemFromJson(json);
}

@freezed
class TripItem with _$TripItem {
  const factory TripItem({
    required int id,
    required String name,
  }) = _TripItem;

  factory TripItem.fromJson(Map<String, dynamic> json) =>
      _$TripItemFromJson(json);
}
