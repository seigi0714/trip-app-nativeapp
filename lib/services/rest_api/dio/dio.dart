import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/services/rest_api/dio/header_interceptor.dart';
import 'package:trip_app_nativeapp/services/rest_api/dio/request_interceptor.dart';

import '../../../utils/constants/number.dart';

/// Dio のインスタンスを各種設定を済ませて提供するプロバイダ。
final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio()
      ..httpClientAdapter = DefaultHttpClientAdapter()
      ..options = BaseOptions(
        // TODO(shimizu-saffle): 環境に応じて変更されるようにする。
        baseUrl: 'http://localhost:8003',
        connectTimeout: connectionTimeoutMilliSeconds,
        receiveTimeout: receiveTimeoutMilliSeconds,
      )
      ..interceptors.addAll(
        <Interceptor>[
          ref.watch(headerInterceptorProvider),
          if (kDebugMode) ref.watch(requestInterceptorProvider),
          // TODO(shimizu-saffle): デバッグモードでは ResponseInterceptor を追加する。
        ],
      );
    return dio;
  },
);
