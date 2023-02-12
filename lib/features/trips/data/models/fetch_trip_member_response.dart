import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/features/user/data/models/get_user_response.dart';

part 'fetch_trip_member_response.freezed.dart';
part 'fetch_trip_member_response.g.dart';

@Freezed(copyWith: false)
class FetchTripMemberResponse with _$FetchTripMemberResponse {
  const factory FetchTripMemberResponse({
    required bool isHost,
    required GetUserResponse member,
  }) = _FetchTripMemberResponse;

  factory FetchTripMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchTripMemberResponseFromJson(json);
}
