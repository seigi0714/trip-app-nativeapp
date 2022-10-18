
import '../entity/third_party_credential/third_party_credential.dart';

abstract class GoogleLoginInterface {
  Future<ThirdPartyCredential> login();
}
