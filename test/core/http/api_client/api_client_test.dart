import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_client.dart';
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
            BaseOptions(baseUrl: testBaseUrl),
          );
          dioAdapter = DioAdapter(
            dio: dio,
            matcher: const UrlRequestMatcher(),
          );
          container = ProviderContainer(
            overrides: [
              dioProvider.overrideWithValue(dio),
            ],
          );
          container.read(dioProvider).httpClientAdapter = dioAdapter;
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
              // Adds one-sec delay to reply method.
              // Basically, I'd wait for one second before returning reply data.
              // See -> issue:[106] & pr:[126]
              delay: const Duration(seconds: 1),
            ),
            data: testRequest,
          );

          final response = await container.read(apiClientProvider).post(
                route,
                data: testRequest,
              );

          expect(response.data, testItems);
        },
      );
    },
  );
}
