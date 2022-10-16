import '../entity/third_perty_credential/third_perty_credential.dart';

abstract class FirebaseAuthInterface {
  // Firebase customtokenを用いたログイン
  Future<void> signInWithCustomToken({
    required String customToken,
  });
  //　Oauthログインで生成されたCredentialを用いたログイン
  Future<void> signInWithGoogle(ThirdPertyCredential credential);
  // ログアウト
  Future<void> signOut();
}
