import 'package:freezed_annotation/freezed_annotation.dart';

part 'third_party_credential.freezed.dart';

@freezed
class ThirdPartyCredential with _$ThirdPartyCredential {
  const factory ThirdPartyCredential({
    required String idToken,
    required String accessToken,
  }) = _ThirdPartyCredential;
}
