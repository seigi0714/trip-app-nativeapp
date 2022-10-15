import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/dio.dart';

import '../../constants/json.dart';
import '../../exception/api_exception.dart';
import '../response/api_response/api_response.dart';
import '../response/error_response/error_response.dart';
import 'abstract_api_client.dart';

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(
    ref.watch(dioProvider),
  ),
);

class ApiClient implements AbstractApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  @override
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<Json>(
        path,
        queryParameters: queryParameters,
        options: options ?? Options(headers: header),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      final responseData = response.data;
      final statusCode = response.statusCode;
      if (responseData == null || statusCode == null) {
        throw const ApiException(statusCode: 500);
      }
      if (statusCode >= 400 && statusCode < 600) {
        final errorResponse = ErrorResponse.fromJson(responseData);
        throw ApiException(
          statusCode: statusCode,
          errorCode: errorResponse.errorCode,
          description: errorResponse.description,
        );
      }
      return ApiResponse.fromJson(responseData);
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> post(
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
      final response = await _dio.post<Json>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: header),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      final responseData = response.data;
      final statusCode = response.statusCode;
      if (responseData == null || statusCode == null) {
        throw const ApiException(statusCode: 500);
      }
      if (statusCode >= 400 && statusCode < 600) {
        final errorResponse = ErrorResponse.fromJson(responseData);
        throw ApiException(
          statusCode: statusCode,
          errorCode: errorResponse.errorCode,
          description: errorResponse.description,
        );
      }
      return ApiResponse.fromJson(responseData);
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
