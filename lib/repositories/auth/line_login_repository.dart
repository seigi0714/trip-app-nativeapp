import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/api/exception/app_exception.dart';

final lineLoginRepositoryProvider = Provider<LineLoginRepository>(
  (_) => LineLoginRepository(),
);

class LineLoginRepository {
  Future<LoginResult> login() async {
    try {
      final result = await LineSDK.instance.login(
        scopes: ['profile', 'openid', 'email'],
      );
      final idToken = result.accessToken.idTokenRaw;
      final nonce = result.idTokenNonce;
      if (idToken == null || nonce == null) {
        throw const AppException(message: 'idToken または nonce が取得できませんでした');
      }
      return result;
    } on PlatformException {
      rethrow;
    } on AppException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
