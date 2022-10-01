import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// APIレスポンス（正常系）のベースクラス
@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    @DataConverter() required Map<String, dynamic> data,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}

class DataConverter implements JsonConverter<Map<String, dynamic>, dynamic> {
  const DataConverter();

  @override
  Map<String, dynamic> fromJson(dynamic data) {
    if (data is List) {
      return <String, List<dynamic>>{'items': data};
    }
    return data as Map<String, dynamic>;
  }

  @override
  Map<String, dynamic> toJson(Map<String, dynamic> data) => data;
}
