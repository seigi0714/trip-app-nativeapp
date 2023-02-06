import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/debug/logger.dart';

part 'response_interceptor.g.dart';

@Riverpod(keepAlive: true)
ResponseInterceptor responseInterceptor(ResponseInterceptorRef ref) {
  return ResponseInterceptor();
}

/// レスポンス内容をコンソールに出力する
class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final requestOptions = response.requestOptions;
    logger
      ..i('*** Response ***')
      ..i(
        '${requestOptions.method} '
        '${requestOptions.baseUrl}${requestOptions.path}',
      )
      ..i('${response.statusCode} ${response.statusMessage}')
      ..i(response.headers.toString())
      ..i(response.data.toString());
    super.onResponse(response, handler);
  }
}
