import 'dart:io';

/// Trip App API との HTTP 通信時に使用する例外型。
class ApiException implements Exception {
  const ApiException({
    this.statusCode,
    this.errorCode,
    this.description = 'サーバとの通信に失敗しました。',
  });

  /// HTTP ステータスコード
  final int? statusCode;

  /// Trip App エラーコード
  final String? errorCode;

  final String? description;
}

class ApiTimeoutException extends ApiException {
  const ApiTimeoutException({super.errorCode})
      : super(
          statusCode: HttpStatus.requestTimeout,
          description: '通信環境をご確認のうえ、再度実行してください。',
        );
}

class NetworkNotConnectedException extends ApiException {
  const NetworkNotConnectedException({
    super.statusCode,
    super.errorCode,
  }) : super(description: 'ネットワーク接続がありません。');
}
