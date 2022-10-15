import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/custom_token.dart';

part 'post_login_response.freezed.dart';
part 'post_login_response.g.dart';

@freezed
class PostLoginResponse with _$PostLoginResponse {
  const factory PostLoginResponse({
    required CustomToken customToken,
  }) = _PostLoginResponse;

  factory PostLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PostLoginResponseFromJson(json);
}
