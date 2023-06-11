import 'package:trip_app_nativeapp/features/auth/domain/entity/oidc/oidc_info.dart';

abstract interface class LineLoginInterface {
  Future<OidcInfo> login();
}
