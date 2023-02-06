import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';

// TODO(shimizu-saffle): リリースまでにユーザー向けのデザインとメッセージを表示する
class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.exception,
  });

  static const path = '/error';
  static const name = 'ErrorPage';
  final Exception? exception;

  @override
  Widget build(BuildContext context) {
    late String message;
    if (exception is ApiTimeoutException ||
        exception is NetworkNotConnectedException ||
        exception is SocketException) {
      message = 'ネットワーク接続をご確認ください😌';
    } else {
      message = 'エラーが発生しました。アプリの再起動をお試しください🙇‍♂️';
    }
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}
