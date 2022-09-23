import 'package:dio/dio.dart';

import '../../models/api/response_result/response_result.dart';

/// dio.dart の abstract class Dio の形式に沿った
/// API クライアントの抽象クラス
abstract class AbstractApiClient {
  Future<ResponseResult<T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  });

  Future<ResponseResult<T>> put<T>(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });

  Future<ResponseResult<T>> patch<T>(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  });

  Future<ResponseResult<T>> post<T>(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });

  Future<ResponseResult<T>> delete<T>(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    Options options,
    CancelToken cancelToken,
  });
}
