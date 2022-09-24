import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../login_token.dart';

final headerInterceptorProvider =
    Provider<HeaderInterceptor>(HeaderInterceptor.new);

/// ヘッダーに認証情報などを付加する
class HeaderInterceptor extends Interceptor {
  HeaderInterceptor(this._ref, [this.overwriteUrl]);

  String? overwriteUrl;
  final ProviderRef<HeaderInterceptor> _ref;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Referer'] = overwriteUrl ?? options.baseUrl;
    options.headers['Origin'] = options.baseUrl;
    options.headers['Accept'] = 'application/json';
    final idToken = _ref.watch(idTokenProvider);
    if (idToken.isNotEmpty) {
      options.headers['Authorization'] = 'IdToken $idToken';
    }
    return handler.next(options);
  }
}
