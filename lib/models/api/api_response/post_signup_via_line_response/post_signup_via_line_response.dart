import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_signup_via_line_response.freezed.dart';
part 'post_signup_via_line_response.g.dart';

@freezed
class PostSignupViaLineResponse with _$PostSignupViaLineResponse {
  const factory PostSignupViaLineResponse({
    required String customToken,
  }) = _PostSignupViaLineResponse;

  factory PostSignupViaLineResponse.fromJson(Map<String, dynamic> json) =>
      _$PostSignupViaLineResponseFromJson(json);
}
