import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@Freezed(copyWith: false, fromJson: false, toJson: false)
class AppUser with _$AppUser {
  const factory AppUser({
    required int id,
    required String name,
    required String email,
  }) = _AppUser;
}
