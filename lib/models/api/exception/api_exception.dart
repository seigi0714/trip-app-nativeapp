/// Trip App API との HTTP 通信時に使用する例外型。
class ApiException implements Exception {
  const ApiException({
    required this.statusCode,
    required this.errorCode,
    required this.description,
  });

  /// HTTP ステータスコード
  final String statusCode;

  /// Trip App API 独自のエラーコード
  final String errorCode;

  /// Trip App API が返すエラーについての説明
  final String description;
}
