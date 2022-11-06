// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'api_client.dart';

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

String $publicTripAppV1ClientHash() =>
    r'9863c5f6145c728f720a07238e53d47c088237eb';

/// 認証なしTripAppApiのAPIクライアントクラスを提供する。
///
/// Copied from [publicTripAppV1Client].
final publicTripAppV1ClientProvider = AutoDisposeProvider<ApiClient>(
  publicTripAppV1Client,
  name: r'publicTripAppV1ClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $publicTripAppV1ClientHash,
);
typedef PublicTripAppV1ClientRef = AutoDisposeProviderRef<ApiClient>;
String $privateTripAppV1ClientHash() =>
    r'c96a3b0dbe12bd5219e3fa53fd1825669e61f8a5';

/// 認証ありTripAppApiのAPIクライアントクラスを提供する。
///
/// Copied from [privateTripAppV1Client].
final privateTripAppV1ClientProvider = AutoDisposeProvider<ApiClient>(
  privateTripAppV1Client,
  name: r'privateTripAppV1ClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $privateTripAppV1ClientHash,
);
typedef PrivateTripAppV1ClientRef = AutoDisposeProviderRef<ApiClient>;
