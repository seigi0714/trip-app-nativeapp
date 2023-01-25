import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.exception,
  });

  static const path = '/error';
  static const name = 'ErrorPage';

  final Exception? exception;

  // TODO(shimizu-saffle): リリースまでにユーザー向けのデザインとメッセージを表示する
  @override
  Widget build(BuildContext context) {
    if (exception is ApiTimeoutException ||
        exception is NetworkNotConnectedException) {
      return const Scaffold(
        body: Center(
          child: Text('ネットワーク接続をご確認ください😌'),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Text('エラーが発生しました。アプリの再起動をお試しください🙇‍♂️'),
        ),
      );
    }
  }
}
