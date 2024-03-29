// Mocks generated by Mockito 5.4.2 from annotations
// in trip_app_nativeapp/test/feature/user/data/user_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:trip_app_nativeapp/core/http/api_client/api_client.dart' as _i3;
import 'package:trip_app_nativeapp/core/http/response/api_response/api_response.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApiResponse_0 extends _i1.SmartFake implements _i2.ApiResponse {
  _FakeApiResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiClient extends _i1.Mock implements _i3.ApiClient {
  MockApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ApiResponse> get(
    String? path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [path],
          {
            #queryParameters: queryParameters,
            #header: header,
          },
        ),
        returnValue: _i4.Future<_i2.ApiResponse>.value(_FakeApiResponse_0(
          this,
          Invocation.method(
            #get,
            [path],
            {
              #queryParameters: queryParameters,
              #header: header,
            },
          ),
        )),
      ) as _i4.Future<_i2.ApiResponse>);
  @override
  _i4.Future<_i2.ApiResponse> post(
    String? path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #header: header,
          },
        ),
        returnValue: _i4.Future<_i2.ApiResponse>.value(_FakeApiResponse_0(
          this,
          Invocation.method(
            #post,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #header: header,
            },
          ),
        )),
      ) as _i4.Future<_i2.ApiResponse>);
  @override
  _i4.Future<_i2.ApiResponse> put(
    String? path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #header: header,
          },
        ),
        returnValue: _i4.Future<_i2.ApiResponse>.value(_FakeApiResponse_0(
          this,
          Invocation.method(
            #put,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #header: header,
            },
          ),
        )),
      ) as _i4.Future<_i2.ApiResponse>);
}
