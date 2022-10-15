import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/exception/api_exception.dart';
import '../../../../core/http/api_client/api_client.dart';
import '../../domain/entity/custom_token.dart';
import '../../domain/repositories/trip_app_auth_interface.dart';
import '../models/post_login_response/post_login_response.dart';

final tripAppAuthRepositoryProvider = Provider<TripAppAuthInterface>((ref) {
  return TripAppAuthRepository(
    ref.watch(apiClientProvider),
  );
});

class TripAppAuthRepository implements TripAppAuthInterface {
  TripAppAuthRepository(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<CustomToken> loginWithIdToken({
    required String idToken,
    required String nonce,
  }) async {
    try {
      final response = await _apiClient.post(
        '/api/v1/auth/signup/line',
        data: <String, String>{
          'line_id_token': idToken,
          'nonce': nonce,
        },
      );
      return PostLoginResponse.fromJson(response.data).customToken;
    } on DioError {
      rethrow;
    } on ApiException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
