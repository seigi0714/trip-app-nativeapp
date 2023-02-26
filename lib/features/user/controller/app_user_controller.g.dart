// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'app_user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$AppUserControllerHash() => r'078403fbf5a1101522bbb337b2caa11a9101317b';

/// ログイン中は、ユーザー情報をキャッシュする
/// ログイン中に実行される処理で、[AppUser] の値を使用する場合は、非null表明演算子を使ってnullチェックを省略する
///
/// Copied from [AppUserController].
final appUserControllerProvider =
    AsyncNotifierProvider<AppUserController, AppUser?>(
  AppUserController.new,
  name: r'appUserControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$AppUserControllerHash,
);
typedef AppUserControllerRef = AsyncNotifierProviderRef<AppUser?>;

abstract class _$AppUserController extends AsyncNotifier<AppUser?> {
  @override
  FutureOr<AppUser?> build();
}
