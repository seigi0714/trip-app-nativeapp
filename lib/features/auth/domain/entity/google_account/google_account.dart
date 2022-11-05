import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/features/auth/domain/entity/third_party_credential/third_party_credential.dart';

part 'google_account.freezed.dart';

@freezed
class GoogleAccount with _$GoogleAccount {
  const factory GoogleAccount({
    required String displayName,
    required ThirdPartyCredential credential,
  }) = _GoogleAccount;
}
