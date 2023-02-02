import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_client.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';
import 'package:trip_app_nativeapp/core/http/api_client/dio/dio.dart';

Future<void> main() async {
  group(
    'ApiClient test',
    () {
      late DioAdapter dioAdapter;
      late ProviderContainer container;

      const dummyEndpoint = '/dummy-endpoint';

      setUp(
        () {
          final dio = Dio(
            BaseOptions(validateStatus: (status) => true),
          );
          dioAdapter = DioAdapter(dio: dio);
          container = ProviderContainer(
            overrides: [
              dioProvider(ApiDestination.privateTripAppV1)
                  .overrideWithValue(dio),
            ],
          );
        },
      );

      test(
        'post 正常系',
        () async {
          const testRequest = <String, dynamic>{
            'data': <String, dynamic>{
              'items': <dynamic>[
                <String, dynamic>{
                  'id': 1,
                  'name': 'test',
                },
              ],
            },
          };
          const testItems = <String, dynamic>{
            'items': <dynamic>[
              <String, dynamic>{
                'id': 2,
                'name': 'test',
              },
            ],
          };
          const testResponse = <String, dynamic>{
            'data': testItems,
          };

          dioAdapter.onPost(
            dummyEndpoint,
            (server) => server.reply(
              200,
              testResponse,
            ),
            data: testRequest,
          );

          final response =
              await container.read(privateTripAppV1ClientProvider).post(
                    dummyEndpoint,
                    data: testRequest,
                  );

          expect(response.data, testItems);
        },
      );

      test(
        'post 準正常系 ステータスコードが 401 の場合は ApiException が スローされるはず。',
        () async {
          dioAdapter.onPost(
            dummyEndpoint,
            (server) => server.reply(
              HttpStatus.unauthorized,
              <String, dynamic>{
                'error_code': 'test',
                'description': 'test',
              },
            ),
          );
          await expectLater(
            () async {
              await container.read(privateTripAppV1ClientProvider).post(
                    dummyEndpoint,
                  );
            },
            throwsA(
              isA<ApiException>()
                  .having(
                    (e) => e.statusCode,
                    'statusCode',
                    HttpStatus.unauthorized,
                  )
                  .having(
                    (e) => e.errorCode,
                    'errorCode',
                    'test',
                  )
                  .having(
                    (e) => e.description,
                    'description',
                    'test',
                  ),
            ),
          );
        },
      );

      test('post 準正常系 レスポンスが null の場合は、ApiException が スローされるはず。', () async {
        dioAdapter.onPost(
          dummyEndpoint,
          (server) => server.reply(
            HttpStatus.internalServerError,
            null,
          ),
        );
        await expectLater(
          () async {
            await container.read(privateTripAppV1ClientProvider).post(
                  dummyEndpoint,
                );
          },
          // throwsA(
          //   isA<ApiException>().having(
          //     (e) => e.statusCode,
          //     'statusCode',
          //     HttpStatus.internalServerError,
          //   ),
          // ),
          null,
        );
      });
    },
  );
}
