
import '../entity/google_account/google_account.dart';

abstract class GoogleLoginInterface {
  Future<GoogleAccount> login();
}
