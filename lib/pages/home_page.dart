import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/utils/extensions/build_context.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const path = '/';
  static const name = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'アプリのトップページ\n旅のしおり一覧をグリッド状に表示する',
                style: context.textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
