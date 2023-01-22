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
    r'e844bf9ae7ff8562d1a4f51c0c09e08b70aa184e';

/// 認証なしTripAppApiのAPIクライアントクラスを提供する。
///
/// Copied from [publicTripAppV1Client].
final publicTripAppV1ClientProvider = AutoDisposeProvider<AbstractApiClient>(
  publicTripAppV1Client,
  name: r'publicTripAppV1ClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $publicTripAppV1ClientHash,
);
typedef PublicTripAppV1ClientRef = AutoDisposeProviderRef<AbstractApiClient>;
String $privateTripAppV1ClientHash() =>
    r'6607602059c90d88ac7a8fca95171acbc0637ad2';

/// 認証ありTripAppApiのAPIクライアントクラスを提供する。
///
/// Copied from [privateTripAppV1Client].
final privateTripAppV1ClientProvider = AutoDisposeProvider<AbstractApiClient>(
  privateTripAppV1Client,
  name: r'privateTripAppV1ClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $privateTripAppV1ClientHash,
);
typedef PrivateTripAppV1ClientRef = AutoDisposeProviderRef<AbstractApiClient>;
