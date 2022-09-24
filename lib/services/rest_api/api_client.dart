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
      final responseData = response.data;
      if (responseData == null) {
        return ResponseResult<T>.failure(
          message: 'レスポンスデータを正常に取得できませんでした',
        );
      }
      return ResponseResult<T>.success(responseData: responseData);
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
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: header),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      final responseData = response.data;
      if (responseData == null) {
        return ResponseResult<T>.failure(
          message: 'レスポンスデータを正常に取得できませんでした',
        );
      }
      return ResponseResult<T>.success(responseData: responseData);
    } on DioError catch (dioError) {
      return ResponseResult<T>.failure(
        message: dioError.message,
      );
    }
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
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: header),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      final responseData = response.data;
      if (responseData == null) {
        return ResponseResult<T>.failure(
          message: 'レスポンスデータを正常に取得できませんでした',
        );
      }
      return ResponseResult<T>.success(responseData: responseData);
    } on DioError catch (dioError) {
      return ResponseResult<T>.failure(
        message: dioError.message,
      );
    }
  }

  @override
  Future<ResponseResult<T>> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: header),
        cancelToken: cancelToken,
      );
      final responseData = response.data;
      if (responseData == null) {
        return ResponseResult<T>.failure(
          message: 'レスポンスデータを正常に取得できませんでした',
        );
      }
      return ResponseResult<T>.success(responseData: responseData);
    } on DioError catch (dioError) {
      return ResponseResult<T>.failure(
        message: dioError.message,
      );
    }
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
  }) async {
    try {
      final response = await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: header),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      final responseData = response.data;
      if (responseData == null) {
        return ResponseResult<T>.failure(
          message: 'レスポンスデータを正常に取得できませんでした',
        );
      }
      return ResponseResult<T>.success(responseData: responseData);
    } on DioError catch (dioError) {
      return ResponseResult<T>.failure(
        message: dioError.message,
      );
    }
  }
}
