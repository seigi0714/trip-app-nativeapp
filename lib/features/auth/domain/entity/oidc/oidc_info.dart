import 'package:freezed_annotation/freezed_annotation.dart';

part 'oidc_info.freezed.dart';

@freezed
class OidcInfo with _$OidcInfo {
  const factory OidcInfo({
    required String idToken,
    required String nonce,
  }) = _OidcInfo;
}
