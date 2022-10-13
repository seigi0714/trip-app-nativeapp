import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lineLoginRepositoryProvider = Provider<LineLoginRepository>(
  (_) => LineLoginRepository(),
);

class LineLoginRepository {
  Future<LoginResult> login() async {
    try {
      final result = await LineSDK.instance.login(
        scopes: ['profile', 'openid', 'email'],
      );
      return result;
    } on PlatformException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
