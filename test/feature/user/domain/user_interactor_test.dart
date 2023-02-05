import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_app_nativeapp/features/user/data/repositories/user_repository.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';
import 'package:trip_app_nativeapp/features/user/domain/interactor/user_interactor.dart';

@GenerateMocks([UserRepository])
import 'user_interactor_test.mocks.dart';

void main() {
  late ProviderContainer providerContainer;
  final mockUserRepo = MockUserRepository();
  final unexpectedException = Exception('想定外のエラー');

  setUp(
    () {
      providerContainer = ProviderContainer(
        overrides: [userRepositoryProvider.overrideWithValue(mockUserRepo)],
      );
      reset(mockUserRepo);
    },
  );

  test('正常系 fetchUser should call userRepo.fetchUser', () async {
    when(mockUserRepo.fetchUser()).thenAnswer(
      (_) => Future.value(
        const AppUser(
          id: 1,
          name: 'Bob',
          email: 'bob@somedomain.com',
        ),
      ),
    );
    await expectLater(
      providerContainer.read(userInteractorProvider).fetchUser(),
      completes,
    );
    verify(mockUserRepo.fetchUser()).called(1);
  });

  test('準正常系 fetchUser should throw exception', () async {
    when(mockUserRepo.fetchUser()).thenThrow(unexpectedException);
    await expectLater(
      () => providerContainer.read(userInteractorProvider).fetchUser(),
      throwsA(unexpectedException),
    );
    verify(mockUserRepo.fetchUser()).called(1);
  });
}
