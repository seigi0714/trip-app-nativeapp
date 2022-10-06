import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  static const path = '/error';
  static const name = 'ErrorPage';

  // TODO(shimizu-saffle): リリースまでにユーザー向けのデザインとメッセージを表示する
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ルーティング関連のエラーが発生しました'),
      ),
    );
  }
}
