import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/constants/number.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/baseurl.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/connectivity_interceptor.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/header_interceptor.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/request_interceptor.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/response_interceptor.dart';

part 'dio.g.dart';

/// プロバイダー経由で必要な情報を集め、各種設定済みの Dio インスタンスを提供する。
@riverpod
Dio dio(
  DioRef ref,
  ApiDestination apiDestination,
) {
  final baseUrl = ref.watch(baseUrlProvider(apiDestination));
  final interceptors = [
    ref.watch(connectivityInterceptorProvider),
    ref.watch(headerInterceptorProvider(apiDestination)),
    if (kDebugMode) ...[
      ref.watch(requestInterceptorProvider),
      ref.watch(responseInterceptorProvider),
    ]
  ];
  return _dioFactory(interceptors: interceptors, baseUrl: baseUrl);
}

Dio _dioFactory({
  required List<Interceptor> interceptors,
  required String baseUrl,
}) {
  final dio = Dio()
    ..httpClientAdapter = DefaultHttpClientAdapter()
    ..options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectionTimeoutMilliSeconds,
      receiveTimeout: receiveTimeoutMilliSeconds,
      contentType: Headers.jsonContentType,
      validateStatus: (_) => true,
    )
    ..interceptors.addAll(interceptors);
  return dio;
}
