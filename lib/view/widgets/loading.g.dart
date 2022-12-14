// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'loading.dart';

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

String $OverlayLoadingHash() => r'43f1ca0e99e92cb0b9531d52ecbecc76be4a414b';

/// OverlayLoading 中か否かを切り替える操作を提供する NotifierProvider を生成する
///
/// Copied from [OverlayLoading].
final overlayLoadingProvider =
    AutoDisposeNotifierProvider<OverlayLoading, bool>(
  OverlayLoading.new,
  name: r'overlayLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $OverlayLoadingHash,
);
typedef OverlayLoadingRef = AutoDisposeNotifierProviderRef<bool>;

abstract class _$OverlayLoading extends AutoDisposeNotifier<bool> {
  @override
  bool build();
}
