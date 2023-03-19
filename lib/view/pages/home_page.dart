import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';
import 'package:trip_app_nativeapp/features/user/controller/app_user_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const path = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(
      ref.read(appUserControllerProvider).value != null,
      'ログイン中はローカルにユーザー情報を保持します。',
    );
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
                onPressed: () => ref.read(authControllerProvider).logOut(),
                child: const Text('ログアウト'),
              ),
              ElevatedButton(
                onPressed: () => context.go('/trips'),
                child: const Text('旅一覧ページ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
