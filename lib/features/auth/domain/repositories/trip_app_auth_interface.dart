import '../entity/custom_token.dart';

abstract class TripAppAuthInterface {
  Future<CustomToken> loginWithIdToken({
    required String idToken,
    required String nonce,
  });
}
