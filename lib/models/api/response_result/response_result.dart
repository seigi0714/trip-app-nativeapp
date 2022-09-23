import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_result.freezed.dart';

@freezed
class ResponseResult<T> with _$ResponseResult<T> {
  const factory ResponseResult.success({
    required T responseData,
    String? message,
    @Default(true) bool success,
  }) = _ResponseResult;

  const factory ResponseResult.failure({
    @Default('サーバーとの通信に失敗しました。') String message,
  }) = Failure<T>;
}
