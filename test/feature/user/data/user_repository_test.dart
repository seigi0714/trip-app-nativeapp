import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_client.dart';
import 'package:trip_app_nativeapp/core/http/response/api_response/api_response.dart';
import 'package:trip_app_nativeapp/features/user/data/repositories/user_repository.dart';

@GenerateMocks([ApiClient])
import 'user_repository_test.mocks.dart';

Future<void> main() async {
  late ProviderContainer providerContainer;
  final mockApiClient = MockApiClient();

  const validId = 1;
  const validName = 'Bob';
  const validEmail = 'bob@somedomain.com';
  final unexpectedException = Exception('想定外のエラー');

  setUp(() {
    providerContainer = ProviderContainer(
      overrides: [
        privateTripAppV1ClientProvider.overrideWith((_) => mockApiClient),
      ],
    );
    reset(mockApiClient);
  });

  group('fetchUser', () {
    test('正常系', () async {
      when(mockApiClient.get('/my/profile')).thenAnswer((_) async {
        return const ApiResponse(
          data: {
            'id': validId,
            'name': validName,
            'email': validEmail,
          },
        );
      });

      final result =
          await providerContainer.read(userRepositoryProvider).fetchUser();

      expect(result.id, validId);
      expect(result.name, validName);
      expect(result.email, validEmail);
    });

    test('準正常系 APIリクエスト時に発生した例外はそのままリスローする', () async {
      when(mockApiClient.get('/my/profile')).thenThrow(unexpectedException);

      await expectLater(
        () => providerContainer.read(userRepositoryProvider).fetchUser(),
        throwsA(unexpectedException),
      );
    });
  });
}
