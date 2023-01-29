import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/cache/app_user/model/app_user.dart';
import 'package:trip_app_nativeapp/core/debug/logger.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_client.dart';
import 'package:trip_app_nativeapp/core/http/network_connectivity.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';

part 'app_user_notifier.g.dart';

@Riverpod(keepAlive: true)
class AppUserNotifier extends _$AppUserNotifier {
  @override
  Future<AppUser?> build() async {
    // AppUser が null 且つネットワーク接続がない状態で、build がコールされると ErrorPage に遷移する
    // その場合に、ネットワークに接続した際にアプリを再起動しなくても、ユーザー情報を再取得するために、
    // ネットワーク接続状態を watch する。
    final networkConnectivity = ref.watch(networkConnectivityProvider).value;
    if (kDebugMode) {
      logger.i('NetworkConnectivity: $networkConnectivity');
    }
    // AppUser がキャッシュされている場合はそれを返す
    // この処理が無いと、ネットワーク接続が切れた場合に ErrorPage にリダイレクトされてしまう
    if (state.value != null) {
      return state.value;
    }
    final authUserAsync = ref.watch(firebaseAuthUserProvider);
    if (authUserAsync.value != null) {
      final res =
          await ref.read(privateTripAppV1ClientProvider).get('/my/profile');
      return AppUser.fromJson(res.data);
    }
    return null;
  }
}
