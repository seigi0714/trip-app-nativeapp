import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/logger.dart';

final responseInterceptorProvider = Provider<ResponseInterceptor>(
  (_) => ResponseInterceptor(),
);

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
