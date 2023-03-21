// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$publicTripAppV1ClientHash() =>
    r'e844bf9ae7ff8562d1a4f51c0c09e08b70aa184e';

/// 認証なしTripAppApiのAPIクライアントクラスを提供する。
///
/// Copied from [publicTripAppV1Client].
@ProviderFor(publicTripAppV1Client)
final publicTripAppV1ClientProvider =
    AutoDisposeProvider<AbstractApiClient>.internal(
  publicTripAppV1Client,
  name: r'publicTripAppV1ClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$publicTripAppV1ClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PublicTripAppV1ClientRef = AutoDisposeProviderRef<AbstractApiClient>;
String _$privateTripAppV1ClientHash() =>
    r'1dc34ff1cab9ecb3b11d3cd8d43630bd864073ce';

/// 認証ありTripAppApiのAPIクライアントクラスを提供する。
///
/// Copied from [privateTripAppV1Client].
@ProviderFor(privateTripAppV1Client)
final privateTripAppV1ClientProvider = Provider<AbstractApiClient>.internal(
  privateTripAppV1Client,
  name: r'privateTripAppV1ClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$privateTripAppV1ClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PrivateTripAppV1ClientRef = ProviderRef<AbstractApiClient>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
