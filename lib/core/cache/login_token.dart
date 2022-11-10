import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';

part 'login_token.g.dart';

@riverpod
Future<String> loginToken(LoginTokenRef ref) {
  final user = ref.watch(firebaseAuthUserProvider);
  return user.value?.getIdToken() ?? Future.value('');
}
