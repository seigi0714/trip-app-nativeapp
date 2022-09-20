import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../utils/logger.dart';

/// HTTP リクエスト時に付加したい処理を onRequest に記述する
class RequestInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    logger.info('*** Request ***');
    _printCurlCommand(options);
    super.onRequest(options, handler);
  }

  /// Curl コマンドを出力する
  void _printCurlCommand(RequestOptions options) {
    var query = '';
    if (options.method == 'GET' && options.queryParameters.isNotEmpty) {
      query = '?${options.queryParameters.entries.map(
            (e) => '${e.key}=${e.value}',
          ).toList().join('&')}';
    }
    final requestUrl = '${options.baseUrl}${options.path}$query';
    logger.info('curl -X ${options.method} $requestUrl');
    for (final key in options.headers.keys) {
      logger.info('-H "$key: ${options.headers[key]}"');
    }
    if (options.data != null && options.data is Map) {
      logger.info('-d ${jsonEncode(options.data)}');
    }
  }
}
