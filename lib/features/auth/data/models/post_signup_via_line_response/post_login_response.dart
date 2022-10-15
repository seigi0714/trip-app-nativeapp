import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_login_response.freezed.dart';
part 'post_login_response.g.dart';

@freezed
class PostLoginResponse with _$PostLoginResponse {
  const factory PostLoginResponse({
    required String customToken,
  }) = _PostLoginResponse;

  factory PostLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PostLoginResponseFromJson(json);
}
