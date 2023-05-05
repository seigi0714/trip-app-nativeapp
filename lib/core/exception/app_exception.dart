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

// 招待コードの形式が不正な場合の例外
class InvalidInvitationCodeException extends AppException {
  const InvalidInvitationCodeException()
      : super(
          message: '無効な招待コードです🥺 \n'
              'ホストメンバーに再度招待リンクを発行してもらってください🙏',
        );
}

// 招待リンクによって参加できるメンバー数の上限に達した場合の例外
class InviteesReachedLimitException extends AppException {
  const InviteesReachedLimitException()
      : super(
          message: 'この招待リンクから参加できるメンバー数の上限に達しました🥺 \n'
              'ホストメンバーに再度招待リンクを発行してもらってください🙏',
        );
}

/// 招待コードの有効期限が切れている場合にスローされる例外
class InvitationExpiredException extends AppException {
  const InvitationExpiredException()
      : super(
          message: '招待コードの有効期限が切れています🥺 \n'
              'ホストメンバーに再度招待リンクを発行してもらってください🙏',
        );
}
