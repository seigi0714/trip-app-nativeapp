import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/constants/json.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';
import 'package:trip_app_nativeapp/core/http/api_client/abstract_api_client.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/dio.dart';
import 'package:trip_app_nativeapp/core/http/response/api_response/api_response.dart';
import 'package:trip_app_nativeapp/core/http/response/error_response/error_response.dart';

part 'api_client.g.dart';

/// 認証なしTripAppApiのAPIクライアントクラスを提供する。
@riverpod
ApiClient publicTripAppV1Client(PublicTripAppV1ClientRef ref) {
  return ApiClient(
    ref.watch(
      dioProvider(ApiDestination.publicTripAppV1),
    ),
  );
}

/// 認証ありTripAppApiのAPIクライアントクラスを提供する。
@riverpod
ApiClient privateTripAppV1Client(PrivateTripAppV1ClientRef ref) {
  return ApiClient(
    ref.watch(
      dioProvider(ApiDestination.privateTripAppV1),
    ),
  );
}

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
  }
}
