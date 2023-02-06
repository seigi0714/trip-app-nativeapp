import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/features/user/data/repositories/user_repository.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';
import 'package:trip_app_nativeapp/features/user/domain/repositories/user_repository_interface.dart';

part 'user_interactor.g.dart';

@Riverpod(keepAlive: true)
UserInteractor userInteractor(UserInteractorRef ref) {
  return UserInteractor(userRepo: ref.watch(userRepositoryProvider));
}

class UserInteractor {
  UserInteractor({required this.userRepo});
  final UserRepositoryInterface userRepo;

  Future<AppUser> fetchUser() => userRepo.fetchUser();
}
