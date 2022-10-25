import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';

final loginTokenProvider = Provider<AsyncValue<String>>((ref) {
  final value = ref.read(getLoginTokenProvider);
  return value.whenData((token) => token ?? '');
});

final getLoginTokenProvider = FutureProvider<String?>((ref) async {
  final user = await ref.read(firebaseAuthUserProvider.future);
  return user?.getIdToken();
});
