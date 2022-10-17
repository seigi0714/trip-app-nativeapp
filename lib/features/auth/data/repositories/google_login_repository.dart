import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/exception/app_exception.dart';
import '../../domain/entity/third_party_credential/third_party_credential.dart';
import '../../domain/repositories/google_login_interface.dart';

final googleLoginRepositoryProvider =
    Provider<GoogleLoginInterface>((ref) => GoogleLoginRepository());

class GoogleLoginRepository implements GoogleLoginInterface {
  @override
  Future<ThirdPartyCredential> login() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final idToken = googleAuth?.idToken;
    final accsesToken = googleAuth?.accessToken;

    if (idToken == null || accsesToken == null) {
      throw const AppException(message: 'idToken または accessToken が取得できませんでした');
    }

    // TODO(seigi0714): ユーザー登録も行うのでGoogleユーザー情報も持ったエンティティを返すようにする
    return ThirdPartyCredential(
      idToken: idToken,
      accessToken: accsesToken,
    );
  }
}
