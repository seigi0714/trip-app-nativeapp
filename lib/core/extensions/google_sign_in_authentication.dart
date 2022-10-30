import 'package:google_sign_in/google_sign_in.dart';
import 'package:trip_app_nativeapp/features/auth/domain/entity/third_party_credential/third_party_credential.dart';

extension GoogleSignInAuthenticationExtension on GoogleSignInAuthentication {
  /// トークンの情報が抜け落ちている場合有効ではない扱いとする
  bool get isValid => idToken != null && accessToken != null;

  /// 独自エンティティへ変換する。
  /// 事前にisValidでトークンの情報があることを仮定して非null演算を行ってます。
  ThirdPartyCredential toEntity() {
    return ThirdPartyCredential(
      idToken: idToken!,
      accessToken: accessToken!,
    );
  }
}
