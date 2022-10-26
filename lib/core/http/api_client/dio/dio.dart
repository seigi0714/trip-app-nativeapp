import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/number.dart';
import '../../../env.dart';
import '../api_destination.dart';
import 'header_interceptor.dart';
import 'request_interceptor.dart';
import 'response_interceptor.dart';

/// Dio のインスタンスを各種設定を済ませて提供するプロバイダ。
final tripAppV1DioProvider = Provider.family<Dio,ApiDestination>(
  (ref,apiDestination) {
    final dio = Dio()
      ..httpClientAdapter = DefaultHttpClientAdapter()
      ..options = BaseOptions(
        // TODO(shimizu-saffle): 環境に応じて変更されるようにする。
        baseUrl: 'http://${Env.tripAppApiUrl}:${Env.tripAppApiPort}',
        connectTimeout: connectionTimeoutMilliSeconds,
        receiveTimeout: receiveTimeoutMilliSeconds,
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
      )
      ..interceptors.addAll(
        <Interceptor>[
          ref.watch(headerInterceptorProvider(apiDestination)),
          if (kDebugMode) ...[
            ref.watch(requestInterceptorProvider),
            ref.watch(responseInterceptorProvider),
          ],
        ],
      );
    return dio;
  },
);
