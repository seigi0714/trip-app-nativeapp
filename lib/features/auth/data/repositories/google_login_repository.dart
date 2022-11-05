import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/exception/app_exception.dart';
import '../../../../core/extensions/google_sign_in_account.dart';
import '../../../../core/extensions/google_sign_in_authentication.dart';
import '../../domain/entity/google_account/google_account.dart';
import '../../domain/repositories/google_login_interface.dart';

final googleLoginRepositoryProvider =
    Provider<GoogleLoginInterface>((ref) => GoogleLoginRepository());

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
