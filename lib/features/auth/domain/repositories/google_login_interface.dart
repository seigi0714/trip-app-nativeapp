
import '../entity/third_perty_credential/third_perty_credential.dart';

abstract class GoogleLoginInterface {
  Future<ThirdPertyCredential> login();
}
