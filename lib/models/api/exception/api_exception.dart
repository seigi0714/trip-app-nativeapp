/// Trip App API との HTTP 通信時に使用する例外型。
class ApiException implements Exception {
  const ApiException({
    this.statusCode,
    this.errorCode,
    this.description = 'サーバとの通信に失敗しました。',
  });

  /// HTTP ステータスコード
  final int? statusCode;

  /// Trip App API 独自のエラーコード
  final String? errorCode;

  /// Trip App API が返すエラーについての説明
  final String? description;
}
