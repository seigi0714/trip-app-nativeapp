import 'package:google_sign_in/google_sign_in.dart';
import 'package:trip_app_nativeapp/features/auth/domain/entity/google_account/google_account.dart';
import 'google_sign_in_authentication.dart';

extension GoogleSignInAccountExtensions on GoogleSignInAccount {
  GoogleAccount toEntity(GoogleSignInAuthentication googleAuth) {
    return GoogleAccount(
      displayName: displayName ?? '',
      credential: googleAuth.toEntity(),
    );
  }
}
