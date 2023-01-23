import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/cache/app_user/model/app_user.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_client.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';

part 'app_user_notifier.g.dart';

@Riverpod(keepAlive: true)
class AppUserNotifier extends _$AppUserNotifier {
  @override
  Future<AppUser?> build() async {
    final authUserAsync = ref.watch(firebaseAuthUserProvider);
    if (authUserAsync.value != null) {
      final res =
          await ref.read(privateTripAppV1ClientProvider).get('/my/profile');
      return AppUser.fromJson(res.data);
    }
    return null;
  }
}
