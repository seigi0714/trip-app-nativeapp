import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/cache/login_token.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';

part 'header_interceptor.g.dart';

@Riverpod(keepAlive: true)
HeaderInterceptor headerInterceptor(
  HeaderInterceptorRef ref,
  ApiDestination apiDestination,
) {
  return HeaderInterceptor(
    apiDestination,
    ref,
  );
}

/// ヘッダーに認証情報などを付加する
class HeaderInterceptor extends Interceptor {
  HeaderInterceptor(
    this._apiDestination,
    this._ref, [
    this.overwriteUrl,
  ]);

  String? overwriteUrl;
  final ApiDestination _apiDestination;
  final Ref _ref;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Referer'] = overwriteUrl ?? options.baseUrl;
    options.headers['Origin'] = options.baseUrl;
    options.headers['Accept'] = 'application/json';

    if (_apiDestination.isRequiredToken) {
      final loginToken = await _ref.read(loginTokenProvider.future);
      options.headers['Authorization'] = 'Bearer $loginToken';
    }

    return handler.next(options);
  }
}
