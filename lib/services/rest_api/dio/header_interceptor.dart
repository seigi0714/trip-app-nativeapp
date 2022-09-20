import 'package:dio/dio.dart';

import '../id_token.dart';

/// ヘッダーに認証情報などを付加する
class HeaderInterceptor extends Interceptor {
  HeaderInterceptor([this.overwriteUrl]);

  String? overwriteUrl;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Referer'] = overwriteUrl ?? options.baseUrl;
    options.headers['Origin'] = options.baseUrl;
    options.headers['Accept'] = 'application/json';
    final token = await idToken;
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'IdToken $token';
    }
    return handler.next(options);
  }
}
