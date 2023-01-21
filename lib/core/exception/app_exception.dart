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

  /// message が空の場合に使用されるメッセージ
  static const String _defaultMessage = 'エラーが発生しました。';

  @override
  String toString() {
    if (code == null) {
      return (message ?? '').ifIsEmpty(_defaultMessage);
    }
    return '[$code] ${(message ?? '').ifIsEmpty(_defaultMessage)}';
  }

  // 画面表示用メッセージ
  String toDisplayMessage() {
   return (message ?? '').ifIsEmpty(_defaultMessage);
  }
}
