import 'package:dio/dio.dart';
import 'package:trip_app_nativeapp/core/http/response/api_response/api_response.dart';

abstract interface class ApiClientInterface {
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

  Future<ApiResponse> put(
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
