import 'package:flutter_test/flutter_test.dart';
import 'package:trip_app_nativeapp/models/api/api_response/api_response.dart';

void main() {
  test('ApiResponse のパーステスト', () {
    final json = <String, dynamic>{
      'data': {'token': '*************'}
    };
    final testResponse1 = ApiResponse.fromJson(json);
    expect(
      testResponse1,
      isA<ApiResponse>(),
    );
    expect(
      testResponse1.toJson(),
      json,
    );
    final nestedJson = <String, dynamic>{
      'data': <String, dynamic>{
        'items': <dynamic>[
          <String, dynamic>{
            'id': 1,
            'name': 'test',
          },
        ],
      },
    };
    final testResponse2 = ApiResponse.fromJson(nestedJson);
    expect(
      ApiResponse.fromJson(nestedJson),
      isA<ApiResponse>(),
    );
    expect(
      testResponse2.toJson(),
      nestedJson,
    );
  });
}
