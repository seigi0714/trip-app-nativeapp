import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/enum/dio_error_code.dart';
import 'package:trip_app_nativeapp/core/http/network_connectivity.dart';

part 'connectivity_interceptor.g.dart';

@riverpod
ConnectivityInterceptor connectivityInterceptor(
  ConnectivityInterceptorRef ref,
) {
  return ConnectivityInterceptor(ref);
}

/// リクエスト時にネットワーク接続を確認するための Interceptor
/// ApiClient で [DioErrorCode.networkNotConnected] をハンドリングする
class ConnectivityInterceptor extends Interceptor {
  ConnectivityInterceptor(this._ref);

  final Ref _ref;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isNetworkConnected =
        await _ref.read(isNetworkConnectedProvider.future);
    if (isNetworkConnected) {
      return handler.reject(
        DioError(
          error: DioErrorCode.networkNotConnected,
          requestOptions: options,
        ),
      );
    }
    return handler.next(options);
  }
}
