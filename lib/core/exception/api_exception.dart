import 'dart:io';

import 'package:trip_app_nativeapp/core/constants/string.dart';

/// Trip App API との HTTP 通信時に使用する例外型。
class ApiException implements Exception {
  const ApiException({
    this.statusCode,
    this.errorCode = 'api_exception',
    this.description,
    this.message = serverConnectionFailure,
  });

  /// HTTP ステータスコード
  /// ネットワーク接続が無い場合も ApiException を投げるため、
  /// null 許容型にしている。
  final int? statusCode;

  /// Trip App エラーコード
  final String errorCode;

  /// 開発者向けのエラー詳細
  final String? description;

  /// ユーザー向けのエラーメッセージ
  final String message;
}

class ApiTimeoutException extends ApiException {
  const ApiTimeoutException()
      : super(
          statusCode: HttpStatus.requestTimeout,
          message: '通信環境をご確認のうえ、再度実行してください。',
        );
}

class NetworkNotConnectedException extends ApiException {
  const NetworkNotConnectedException() : super(message: networkNotConnected);
}
