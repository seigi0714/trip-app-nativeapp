import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';
import 'package:trip_app_nativeapp/features/user/controller/app_user_controller.dart';
import 'package:trip_app_nativeapp/view/pages/trips/trips_list_page.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  static const path = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(
      ref.read(appUserControllerProvider).value != null,
      'ログイン中はローカルにユーザー情報を保持します。',
    );
    assert(
      kDebugMode,
      'リリースモードの場合、このページは表示されてはいけません。',
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'デバッグ用のページです。\n直接遷移したいページがある場合や、'
                '\n実行したい処理がある場合は追加してください。',
              ),
              ElevatedButton(
                onPressed: () => ref.read(authControllerProvider).logOut(),
                child: const Text('ログアウト'),
              ),
              ElevatedButton(
                onPressed: () => context.go(TripListPage.path),
                child: const Text('旅一覧ページ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
