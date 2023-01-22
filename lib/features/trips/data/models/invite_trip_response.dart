import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_trip_response.freezed.dart';
part 'invite_trip_response.g.dart';

@freezed
class InviteTripResponse with _$InviteTripResponse {
  const factory InviteTripResponse({
    required String invitationCode,
    required int invitationNum,
  }) = _InviteTripResponse;

  factory InviteTripResponse.fromJson(Map<String, dynamic> json) =>
      _$InviteTripResponseFromJson(json);
}
