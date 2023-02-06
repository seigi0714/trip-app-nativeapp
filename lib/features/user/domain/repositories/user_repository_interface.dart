import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';

abstract class UserRepositoryInterface {
  /// ユーザー情報取得
  Future<AppUser> fetchUser();
}
