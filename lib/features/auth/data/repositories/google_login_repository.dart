import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/exception/app_exception.dart';
import '../../domain/entity/third_perty_credential/third_perty_credential.dart';
import '../../domain/repositories/google_login_interface.dart';

final googleLoginRepositoryProvider =
    Provider<GoogleLoginInterface>((ref) => GoogleLoginRepository());

class GoogleLoginRepository implements GoogleLoginInterface {
  @override
  Future<ThirdPertyCredential> login() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth?.idToken == null || googleAuth?.accessToken == null) {
      throw const AppException(message: 'idToken または accessToken が取得できませんでした');
    }

    return ThirdPertyCredential(
      idToken: googleAuth!.idToken!,
      accessToken: googleAuth.accessToken!,
    );
  }
}
