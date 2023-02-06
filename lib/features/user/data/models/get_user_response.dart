import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_response.freezed.dart';
part 'get_user_response.g.dart';

@Freezed(copyWith: false)
class GetUserResponse with _$GetUserResponse {
  const factory GetUserResponse({
    required int id,
    required String name,
    required String email,
  }) = _GetUserResponse;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}
