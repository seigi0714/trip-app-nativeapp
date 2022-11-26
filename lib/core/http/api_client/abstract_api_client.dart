import 'package:dio/dio.dart';
import 'package:trip_app_nativeapp/core/http/response/api_response/api_response.dart';

/// dio.dart の abstract class Dio の形式に沿った
/// API クライアントの抽象クラス
abstract class AbstractApiClient {
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  });

  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
}
