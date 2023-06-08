// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$publicTripAppV1ClientHash() =>
    r'6e754f23af11ead12aed9e82d1239aefead2a224';

/// 認証なしTripAppApiのAPIクライアントクラスを提供する。
///
/// Copied from [publicTripAppV1Client].
@ProviderFor(publicTripAppV1Client)
final publicTripAppV1ClientProvider =
    AutoDisposeProvider<ApiClientInterface>.internal(
  publicTripAppV1Client,
  name: r'publicTripAppV1ClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$publicTripAppV1ClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PublicTripAppV1ClientRef = AutoDisposeProviderRef<ApiClientInterface>;
String _$privateTripAppV1ClientHash() =>
    r'54646d0b82d97984396f952fb2412f243b6094c8';

/// 認証ありTripAppApiのAPIクライアントクラスを提供する。
///
/// Copied from [privateTripAppV1Client].
@ProviderFor(privateTripAppV1Client)
final privateTripAppV1ClientProvider = Provider<ApiClientInterface>.internal(
  privateTripAppV1Client,
  name: r'privateTripAppV1ClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$privateTripAppV1ClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PrivateTripAppV1ClientRef = ProviderRef<ApiClientInterface>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
