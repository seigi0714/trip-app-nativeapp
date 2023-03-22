// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'dio.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'15c8dec4d8e099101ccb68517e691728e88394e6';

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

typedef DioRef = ProviderRef<Dio>;

/// プロバイダー経由で必要な情報を集め、各種設定済みの Dio インスタンスを提供する。
///
/// Copied from [dio].
@ProviderFor(dio)
const dioProvider = DioFamily();

/// プロバイダー経由で必要な情報を集め、各種設定済みの Dio インスタンスを提供する。
///
/// Copied from [dio].
class DioFamily extends Family<Dio> {
  /// プロバイダー経由で必要な情報を集め、各種設定済みの Dio インスタンスを提供する。
  ///
  /// Copied from [dio].
  const DioFamily();

  /// プロバイダー経由で必要な情報を集め、各種設定済みの Dio インスタンスを提供する。
  ///
  /// Copied from [dio].
  DioProvider call(
    ApiDestination apiDestination,
  ) {
    return DioProvider(
      apiDestination,
    );
  }

  @override
  DioProvider getProviderOverride(
    covariant DioProvider provider,
  ) {
    return call(
      provider.apiDestination,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dioProvider';
}

/// プロバイダー経由で必要な情報を集め、各種設定済みの Dio インスタンスを提供する。
///
/// Copied from [dio].
class DioProvider extends Provider<Dio> {
  /// プロバイダー経由で必要な情報を集め、各種設定済みの Dio インスタンスを提供する。
  ///
  /// Copied from [dio].
  DioProvider(
    this.apiDestination,
  ) : super.internal(
          (ref) => dio(
            ref,
            apiDestination,
          ),
          from: dioProvider,
          name: r'dioProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
          dependencies: DioFamily._dependencies,
          allTransitiveDependencies: DioFamily._allTransitiveDependencies,
        );

  final ApiDestination apiDestination;

  @override
  bool operator ==(Object other) {
    return other is DioProvider && other.apiDestination == apiDestination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, apiDestination.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
