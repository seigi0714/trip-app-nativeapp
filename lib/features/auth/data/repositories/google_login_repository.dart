import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/extensions/google_sign_in_account.dart';
import 'package:trip_app_nativeapp/core/extensions/google_sign_in_authentication.dart';
import 'package:trip_app_nativeapp/features/auth/domain/entity/google_account/google_account.dart';
import 'package:trip_app_nativeapp/features/auth/domain/repositories/google_login_interface.dart';

part 'google_login_repository.g.dart';

@riverpod
GoogleLoginInterface googleLoginRepository(GoogleLoginRepositoryRef ref) {
  return GoogleLoginRepository();
}

class GoogleLoginRepository implements GoogleLoginInterface {
  @override
  Future<GoogleAccount> login() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw const AppException(message: 'Googleアカウントの取得に失敗しました。');
    }
    final googleAuth = await googleUser.authentication;

    if (!googleAuth.isValid) {
      throw const AppException(message: 'idToken または accessToken が取得できませんでした');
    }

    return googleUser.toEntity(googleAuth);
  }
}
