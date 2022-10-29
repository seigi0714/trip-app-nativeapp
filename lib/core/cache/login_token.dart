import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';

final loginTokenProvider = Provider<Future<String>>((ref) {
  final user = ref.watch(firebaseAuthUserProvider);
  final idToken = user.maybeWhen(
    data: (user) async {
      final idToken = await user?.getIdToken();
      return idToken ?? '';
    },
    orElse: () async => '',
  );

  return idToken;
});
