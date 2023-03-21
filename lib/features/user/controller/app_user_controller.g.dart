// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'app_user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appUserControllerHash() => r'078403fbf5a1101522bbb337b2caa11a9101317b';

/// ログイン中は、ユーザー情報をキャッシュする
/// ログイン中に実行される処理で、[AppUser] の値を使用する場合は、非null表明演算子を使ってnullチェックを省略する
///
/// Copied from [AppUserController].
@ProviderFor(AppUserController)
final appUserControllerProvider =
    AsyncNotifierProvider<AppUserController, AppUser?>.internal(
  AppUserController.new,
  name: r'appUserControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUserControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppUserController = AsyncNotifier<AppUser?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
