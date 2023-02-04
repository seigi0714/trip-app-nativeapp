import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/http/api_client/abstract_api_client.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_client.dart';
import 'package:trip_app_nativeapp/features/user/data/models/get_user_response.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';
import 'package:trip_app_nativeapp/features/user/domain/repositories/user_repository_Interface.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepositoryInterface userRepository(UserRepositoryRef ref) {
  return UserRepository(
    privateV1Client: ref.watch(privateTripAppV1ClientProvider),
  );
}

class UserRepository implements UserRepositoryInterface {
  UserRepository({
    required this.privateV1Client,
  });
  final AbstractApiClient privateV1Client;
  static const _basePath = '/my/profile';

  @override
  Future<AppUser> fetchUser() async {
    final res = await privateV1Client.get(_basePath);
    final userRes = GetUserResponse.fromJson(res.data);
    return AppUser(
      id: userRes.id,
      name: userRes.name,
      email: userRes.email,
    );
  }
}
