import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_check_status_response.freezed.dart';
part 'change_check_status_response.g.dart';

@freezed
class ChangeCheckStatusResponse with _$ChangeCheckStatusResponse {
  const factory ChangeCheckStatusResponse({
    required bool isChecked,
  }) = _ChangeCheckStatusResponse;

  factory ChangeCheckStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeCheckStatusResponseFromJson(json);
}
