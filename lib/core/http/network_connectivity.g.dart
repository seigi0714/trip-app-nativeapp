// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'network_connectivity.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isNetworkConnectedHash() =>
    r'15c19859b29a363b03b2c9976eb6ad0bc59cac5d';

/// ネットワーク接続状態を ref.read したい場合に使う
///
/// Copied from [isNetworkConnected].
@ProviderFor(isNetworkConnected)
final isNetworkConnectedProvider = AutoDisposeFutureProvider<bool>.internal(
  isNetworkConnected,
  name: r'isNetworkConnectedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isNetworkConnectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsNetworkConnectedRef = AutoDisposeFutureProviderRef<bool>;
String _$networkConnectivityHash() =>
    r'ae1c71ff048e6e204d1d13f48b2d4cf8f7909890';

/// ネットワーク接続状態を ref.watch したい場合に使う
///
/// Copied from [networkConnectivity].
@ProviderFor(networkConnectivity)
final networkConnectivityProvider = StreamProvider<ConnectivityResult>.internal(
  networkConnectivity,
  name: r'networkConnectivityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkConnectivityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NetworkConnectivityRef = StreamProviderRef<ConnectivityResult>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
