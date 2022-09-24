import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/models/api/response_result/response_result.dart';
import 'package:trip_app_nativeapp/services/rest_api/abstract_api_client.dart';
import 'package:trip_app_nativeapp/services/rest_api/dio/dio.dart';

final apiClientProvider = Provider<AbstractApiClient>(
  (ref) => ApiClient(
    ref.watch(dioProvider),
  ),
);

class ApiClient implements AbstractApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  @override
  Future<ResponseResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options ?? Options(headers: header),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      final data = response.data;
      if (data == null) {
        return ResponseResult<T>.failure(
          message: 'データを取得できませんでした',
        );
      }
      return ResponseResult<T>.success(responseData: data);
    } on DioError catch (dioError) {
      return ResponseResult<T>.failure(
        message: dioError.message,
      );
    }
  }

  @override
  Future<ResponseResult<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<ResponseResult<T>> put<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<ResponseResult<T>> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    Options? options,
    CancelToken? cancelToken,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ResponseResult<T>> patch<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    // TODO: implement patch
    throw UnimplementedError();
  }
}
