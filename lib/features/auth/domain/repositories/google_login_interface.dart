import 'package:trip_app_nativeapp/features/auth/domain/entity/google_account/google_account.dart';

abstract class GoogleLoginInterface {
  Future<GoogleAccount> login();
}
