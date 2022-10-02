import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/api/api_response/post_signup_via_line_response/post_signup_via_line_response.dart';
import '../models/api/exception/app_exception.dart';
import '../services/rest_api/api_client.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(apiClientProvider));
});

class AuthRepository {
  AuthRepository(
    this._apiClient,
  );

  final ApiClient _apiClient;

  Future<PostSignupViaLineResponse> signUpWithLINE() async {
    try {
      final result = await LineSDK.instance.login(
        scopes: ['profile', 'openid', 'email'],
      );
      final idToken = result.accessToken.idTokenRaw;
      final nonce = result.idTokenNonce;
      if (idToken == null || nonce == null) {
        throw const AppException(message: 'idToken または nonce が取得できませんでした');
      }
      final response = await _apiClient.post(
        '/api/v1/auth/signup/line',
        data: <String, dynamic>{
          'line_id_token': idToken,
          'nonce': nonce,
        },
      );
      return PostSignupViaLineResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }
}
