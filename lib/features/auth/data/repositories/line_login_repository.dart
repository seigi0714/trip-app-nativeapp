import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/exception/app_exception.dart';
import '../../domain/entity/oidc/oidc_info.dart';
import '../../domain/repositories/line_login_interface.dart';

part 'line_login_repository.g.dart';

@riverpod
LineLoginInterface lineLoginRepository(LineLoginRepositoryRef ref) {
  return LineLoginRepository();
}

class LineLoginRepository implements LineLoginInterface {
  @override
  Future<OidcInfo> login() async {
    final result = await LineSDK.instance.login(
      scopes: ['profile', 'openid', 'email'],
    );
    final idToken = result.accessToken.idTokenRaw;
    final nonce = result.idTokenNonce;
    if (idToken == null || nonce == null) {
      throw const AppException(message: 'idToken または nonce が取得できませんでした');
    }
    return OidcInfo(
      idToken: idToken,
      nonce: nonce,
    );
  }
}
