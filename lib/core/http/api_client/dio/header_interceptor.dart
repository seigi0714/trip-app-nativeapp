import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';

import '../../../cache/login_token.dart';

final headerInterceptorProviderFamily =
    Provider.family<HeaderInterceptor, ApiDestination>(HeaderInterceptor.new);

/// ヘッダーに認証情報などを付加する
class HeaderInterceptor extends Interceptor {
  HeaderInterceptor(this._ref, this._apiDestination, [this.overwriteUrl]);

  String? overwriteUrl;
  final ApiDestination _apiDestination;
  final ProviderRef<HeaderInterceptor> _ref;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Referer'] = overwriteUrl ?? options.baseUrl;
    options.headers['Origin'] = options.baseUrl;
    options.headers['Accept'] = 'application/json';

    if (_apiDestination.isRequiredToken) {
      final loginToken = await _ref.read(loginTokenProvider);
      options.headers['Authorization'] = 'Bearer $loginToken';
    }

    return handler.next(options);
  }
}
