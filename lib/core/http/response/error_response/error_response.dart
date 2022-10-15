import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

/// Trip App API が返す、ステータスコードが 400 以上の時のレスポンスボディ。
@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    /// Trip App API 独自のエラーコード
    @Default('') String errorCode,

    /// Trip App API が返すエラーについての説明
    @Default('') String description,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
