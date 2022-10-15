import '../entity/oidc/oidc_info.dart';

abstract class LineLoginInterface {
  Future<OidcInfo> login();
}
