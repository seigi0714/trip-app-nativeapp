import 'package:freezed_annotation/freezed_annotation.dart';

part 'third_perty_credential.freezed.dart';

@freezed
class ThirdPertyCredential with _$ThirdPertyCredential {
  const factory ThirdPertyCredential({
    required String idToken,
    required String accessToken,
  }) = _ThirdPertyCredential;
}
