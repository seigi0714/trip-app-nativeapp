import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/baseurl_interceptor.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/header_interceptor.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/request_interceptor.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/response_interceptor.dart';

import '../../../constants/number.dart';
import '../api_destination.dart';

/// Dio のインスタンスを各種設定を済ませて提供するプロバイダ。
/// プロバイダー経由で各種設定に必要な情報を集めてDioインスタンスを生成する。
final dioProviderFamily =
    Provider.family<Dio, ApiDestination>((ref, apiDestination) {
  final baseUrl = ref.read(baseUrlProviderFamily(apiDestination));
  final interceptors = [
    ref.read(headerInterceptorProviderFamily(apiDestination)),
    if (kDebugMode) ...[
      ref.read(requestInterceptorProvider),
      ref.read(responseInterceptorProvider),
    ]
  ];

  return _dioFactory(interceptors: interceptors, baseUrl: baseUrl);
});

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
