import 'package:flutter/foundation.dart';
import 'package:trip_app_nativeapp/core/constants/string.dart';
import 'package:trip_app_nativeapp/core/extensions/string.dart';

/// アプリ内で使用する例外型のインターフェース。
class AppException implements Exception {
  const AppException({
    this.code,
    this.message,
  });

  /// ステータスコードや独自のエラーコードなどのエラー種別を識別するための文字列
  final String? code;

  /// 例外の内容によって、ユーザー向けに表示するメッセージ
  final String? message;

  @override
  String toString() {
    if (code == null) {
      return (message ?? '').ifIsEmpty(generalExceptionMessage);
    } else if (kDebugMode) {
      return '[$code] ${(message ?? '').ifIsEmpty(generalExceptionMessage)}';
    } else {
      return (message ?? '').ifIsEmpty(generalExceptionMessage);
    }
  }
}
