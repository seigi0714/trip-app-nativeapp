import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/constants/json.dart';
import 'package:trip_app_nativeapp/core/debug/logger.dart';
import 'package:trip_app_nativeapp/core/enum/dio_error_code.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';
import 'package:trip_app_nativeapp/core/extensions/dio.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_client_interface.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/dio.dart';
import 'package:trip_app_nativeapp/core/http/response/api_response/api_response.dart';
import 'package:trip_app_nativeapp/core/http/response/error_response/error_response.dart';

part 'api_client.g.dart';

/// 認証なしTripAppApiのAPIクライアントクラスを提供する。
@riverpod
ApiClientInterface publicTripAppV1Client(PublicTripAppV1ClientRef ref) {
  return ApiClient(
    ref.watch(
      dioProvider(ApiDestination.publicTripAppV1),
    ),
  );
}

/// 認証ありTripAppApiのAPIクライアントクラスを提供する。
@Riverpod(keepAlive: true)
ApiClientInterface privateTripAppV1Client(PrivateTripAppV1ClientRef ref) {
  return ApiClient(
    ref.watch(
      dioProvider(ApiDestination.privateTripAppV1),
    ),
  );
}

class ApiClient implements ApiClientInterface {
  ApiClient(this._dio);

  final Dio _dio;

  @override
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      final response = await _dio.get<Json>(
        path,
        queryParameters: queryParameters,
      );
      return _toApiResponse(response);
    } on DioError catch (e) {
      final exception = _handleDioError(e);
      throw exception;
    }
  }

  @override
  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      final response = await _dio.post<Json>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return _toApiResponse(response);
    } on DioError catch (e) {
      final exception = _handleDioError(e);
      throw exception;
    }
  }

  @override
  Future<ApiResponse> put(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      final response = await _dio.put<Json>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return _toApiResponse(response);
    } on DioError catch (e) {
      final exception = _handleDioError(e);
      throw exception;
    }
  }

  ApiResponse _toApiResponse(Response<Map<String, dynamic>> res) {
    final responseData = res.data;
    final statusCode = res.statusCode;
    if (responseData == null || statusCode == null) {
      throw const ApiException(statusCode: 500);
    }
    if (statusCode >= 400 && statusCode < 600) {
      final errorResponse = ErrorResponse.fromJson(responseData);
      throw ApiException(
        statusCode: statusCode,
        errorCode: errorResponse.errorCode,
        description: errorResponse.errorDescription,
      );
    }
    return ApiResponse.fromJson(responseData);
  }

  /// DioError を受けて [ApiException] もしくはそのサブクラスを返す。
  /// デバッグモードの場合は [DioError] の原因が [SocketException] によるものかを判別して、
  /// そうである場合は、 [SocketException] を返す。
  Exception _handleDioError(DioError dioError) {
    final errorType = dioError.type;
    final dynamic error = dioError.error;
    if (errorType.isTimeout) {
      return const ApiTimeoutException();
    } else if (kDebugMode && dioError.message.contains('SocketException')) {
      logger.e('SocketException: サーバとの接続を確認してください。');
      return const SocketException('サーバとの接続を確認してください。');
    } else if (error is DioErrorCode &&
        error == DioErrorCode.networkNotConnected) {
      return const NetworkNotConnectedException();
    } else {
      return const ApiException();
    }
  }
}
