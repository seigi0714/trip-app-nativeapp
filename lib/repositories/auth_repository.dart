import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/models/api/exception/api_exception.dart';

import '../models/api/api_response/post_signup_via_line_response/post_signup_via_line_response.dart';
import '../models/api/exception/app_exception.dart';
import '../services/rest_api/api_client.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(apiClientProvider),
    ref.watch(firebaseAuthProvider),
  );
});

final firebaseAuthProvider =
    Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

class AuthRepository {
  AuthRepository(
    this._apiClient,
    this._firebaseAuth,
  );

  final ApiClient _apiClient;
  final FirebaseAuth _firebaseAuth;

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
    } on PlatformException {
      rethrow;
    } on AppException {
      rethrow;
    } on ApiException {
      rethrow;
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  /// Firebase Auth のカスタムトークン認証でサインインする。
  Future<UserCredential> signInWithCustomToken(String customToken) async {
    try {
      final userCredential =
          await _firebaseAuth.signInWithCustomToken(customToken);
      return userCredential;
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
