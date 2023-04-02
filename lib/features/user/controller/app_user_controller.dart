import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/http/network_connectivity.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';
import 'package:trip_app_nativeapp/features/user/domain/interactor/user_interactor.dart';

part 'app_user_controller.g.dart';

/// ログイン中は、ユーザー情報をキャッシュする
/// ログイン中に実行される処理で、[AppUser] の値を使用する場合は、非null表明演算子を使ってnullチェックを省略する
@Riverpod(keepAlive: true)
class AppUserController extends _$AppUserController {
  @override
  FutureOr<AppUser?> build() async {
    // AppUser が null 且つネットワーク接続がない状態で、build がコールされると ErrorPage に遷移する
    // その場合に、ネットワークに再接続した際、アプリを再起動しなくてもユーザー情報を再取得できるように、
    // ネットワーク接続状態を watch する
    ref.watch(networkConnectivityProvider);
    if (ref.watch(firebaseAuthUserProvider).value == null) {
      return null;
    }

    // AppUser がキャッシュされている場合はそれを返す
    // この処理が無いと、ネットワーク接続が切れた場合に ErrorPage にリダイレクトされてしまう
    if (state.value != null) {
      return state.value;
    }

    final appUser = await ref.watch(userInteractorProvider).fetchUser();
    return appUser;
  }
}
