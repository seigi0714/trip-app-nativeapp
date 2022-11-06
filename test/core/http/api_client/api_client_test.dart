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
  TestWidgetsFlutterBinding.ensureInitialized();
  late Dio dio;
  late DioAdapter dioAdapter;
  late ProviderContainer container;

  group(
    'ApiClient test',
    () {
      const testBaseUrl = 'https://test.com';

      setUp(
        () {
          dio = Dio(
            BaseOptions(
              baseUrl: testBaseUrl,
              validateStatus: (status) => true,
            ),
          );
          dioAdapter = DioAdapter(
            dio: dio,
            matcher: const UrlRequestMatcher(),
          );
          container = ProviderContainer(
            overrides: [
              dioProviderFamily(ApiDestination.publicTripAppV1)
                  .overrideWithValue(dio),
            ],
          );
          container
              .read(
                dioProviderFamily(ApiDestination.publicTripAppV1),
              )
              .httpClientAdapter = dioAdapter;
        },
      );

      test(
        'post 正常系',
        () async {
          const route = '/post';

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
            route,
            (server) => server.reply(
              200,
              testResponse,
            ),
            data: testRequest,
          );

          final response =
              await container.read(publicTripAppV1ClientProvider).post(
                    route,
                    data: testRequest,
                  );

          expect(response.data, testItems);
        },
      );

      test(
        'post 異常系 ステータスコードが 401 の場合は ApiException が スローされるはず。',
        () async {
          const route = '/post';
          dioAdapter.onPost(
            route,
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
              await container.read(publicTripAppV1ClientProvider).post(
                    route,
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

      test('post 異常系 レスポンスが null の場合は、ApiException が スローされるはず。', () async {
        const route = '/post';
        dioAdapter.onPost(
          route,
          (server) => server.reply(
            HttpStatus.internalServerError,
            null,
          ),
        );
        await expectLater(
          () async {
            await container.read(publicTripAppV1ClientProvider).post(
                  route,
                );
          },
          throwsA(
            isA<ApiException>().having(
              (e) => e.statusCode,
              'statusCode',
              HttpStatus.internalServerError,
            ),
          ),
        );
      });
    },
  );
}
