import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/line_login_repository.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/trip_app_auth_repository.dart';

import '../../../../core/exception/api_exception.dart';
import '../../../../core/exception/app_exception.dart';

class Auth {
  Auth(
    this._lineLoginRepository,
    this._tripAppAuthRepository,
    this._firebaseAuthRepository,
  );

  final LineLoginRepository _lineLoginRepository;
  final TripAppAuthRepository _tripAppAuthRepository;
  final FirebaseAuthRepository _firebaseAuthRepository;

  Future<void> login() async {
    try {
      final result = await _lineLoginRepository.login();
      final idToken = result.accessToken.idTokenRaw;
      final nonce = result.idTokenNonce;
      if (idToken == null || nonce == null) {
        throw const AppException(message: 'idToken または nonce が取得できませんでした');
      }
      final response = await _tripAppAuthRepository.loginWithIdToken(
        idToken: idToken,
        nonce: nonce,
      );
      await _firebaseAuthRepository.signInWithCustomToken(response.customToken);
    } on PlatformException {
      rethrow;
    } on FirebaseException {
      rethrow;
    } on ApiException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
