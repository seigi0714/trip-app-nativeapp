import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.errorMessage,
  });

  static const path = '/error';
  static const name = 'ErrorPage';

  final String errorMessage;

  // TODO(shimizu-saffle): リリースまでにユーザー向けのデザインとメッセージを表示する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorMessage),
      ),
    );
  }
}
