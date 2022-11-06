import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/http/api_client/api_client.dart';
import '../../domain/entity/custom_token.dart';
import '../../domain/repositories/trip_app_auth_interface.dart';
import '../models/post_login_response/post_login_response.dart';

part 'trip_app_auth_repository.g.dart';

@riverpod
TripAppAuthInterface tripAppAuthRepository(TripAppAuthRepositoryRef ref) {
  return TripAppAuthRepository(
    publicV1Client: ref.watch(publicTripAppV1ClientProvider),
    privateV1Client: ref.watch(privateTripAppV1ClientProvider),
  );
}

class TripAppAuthRepository implements TripAppAuthInterface {
  TripAppAuthRepository({
    required this.publicV1Client,
    required this.privateV1Client,
  });

  final ApiClient publicV1Client;
  final ApiClient privateV1Client;

  @override
  Future<CustomToken> loginWithIdToken({
    required String idToken,
    required String nonce,
  }) async {
    final response = await publicV1Client.post(
      '/auth/signup/line',
      data: <String, String>{
        'line_id_token': idToken,
        'nonce': nonce,
      },
    );
    return PostLoginResponse.fromJson(response.data).customToken;
  }

  @override
  Future<void> createUserWithFirebaseIdToken({required String name}) async {
    await privateV1Client.post(
      '/auth/signup/firebase_id_token',
      data: <String, String>{
        'name': name,
      },
    );
  }
}
