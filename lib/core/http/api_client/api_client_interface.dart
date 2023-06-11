import 'package:trip_app_nativeapp/core/http/response/api_response/api_response.dart';

abstract interface class ApiClientInterface {
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
  });

  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
  });

  Future<ApiResponse> put(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
  });
}
