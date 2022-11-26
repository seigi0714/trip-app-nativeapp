import 'package:trip_app_nativeapp/features/auth/domain/entity/third_party_credential/third_party_credential.dart';

abstract class FirebaseAuthInterface {
  /// Firebaseカスタムトークンを用いたログイン
  Future<void> signInWithCustomToken({
    required String customToken,
  });

  ///　Oauthログインで生成されたCredentialを用いたログイン
  Future<void> signInWithGoogle(ThirdPartyCredential credential);

  /// ログアウト
  Future<void> signOut();
}
