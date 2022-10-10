import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/utils/extensions/build_context.dart';

import '../features/auth.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const path = '/';
  static const name = 'HomePage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(signOutProvider).call(),
                child: const Text('ログアウト'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
