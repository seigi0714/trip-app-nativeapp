import 'package:trip_app_nativeapp/features/auth/domain/entity/custom_token.dart';

abstract class TripAppAuthInterface {
  /// LINE IdTokenを用いたユーザー登録
  Future<CustomToken> loginWithIdToken({
    required String idToken,
    required String nonce,
  });

  /// Firebase IdTokenを用いたユーザー登録
  Future<void> createUserWithFirebaseIdToken({required String name});
}
