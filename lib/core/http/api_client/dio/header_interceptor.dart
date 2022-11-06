import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';

import '../../../cache/login_token.dart';

part 'header_interceptor.g.dart';

@riverpod
HeaderInterceptor headerInterceptor(
  HeaderInterceptorRef ref,
  ApiDestination apiDestination,
) {
  return HeaderInterceptor(
    apiDestination,
    ref.watch(loginTokenProvider.future),
  );
}

/// ヘッダーに認証情報などを付加する
class HeaderInterceptor extends Interceptor {
  HeaderInterceptor(
    this._apiDestination,
    this._loginTokenProvider, [
    this.overwriteUrl,
  ]);

  String? overwriteUrl;
  final ApiDestination _apiDestination;
  final Future<String> _loginTokenProvider;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Referer'] = overwriteUrl ?? options.baseUrl;
    options.headers['Origin'] = options.baseUrl;
    options.headers['Accept'] = 'application/json';

    if (_apiDestination.isRequiredToken) {
      final loginToken = await _loginTokenProvider;
      options.headers['Authorization'] = 'Bearer $loginToken';
    }

    return handler.next(options);
  }
}
