// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'baseurl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$baseUrlHash() => r'78fd8bf439744938def536f38451b2e54e394773';

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

typedef BaseUrlRef = ProviderRef<String>;

/// See also [baseUrl].
@ProviderFor(baseUrl)
const baseUrlProvider = BaseUrlFamily();

/// See also [baseUrl].
class BaseUrlFamily extends Family<String> {
  /// See also [baseUrl].
  const BaseUrlFamily();

  /// See also [baseUrl].
  BaseUrlProvider call(
    ApiDestination apiDestination,
  ) {
    return BaseUrlProvider(
      apiDestination,
    );
  }

  @override
  BaseUrlProvider getProviderOverride(
    covariant BaseUrlProvider provider,
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
  String? get name => r'baseUrlProvider';
}

/// See also [baseUrl].
class BaseUrlProvider extends Provider<String> {
  /// See also [baseUrl].
  BaseUrlProvider(
    this.apiDestination,
  ) : super.internal(
          (ref) => baseUrl(
            ref,
            apiDestination,
          ),
          from: baseUrlProvider,
          name: r'baseUrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$baseUrlHash,
          dependencies: BaseUrlFamily._dependencies,
          allTransitiveDependencies: BaseUrlFamily._allTransitiveDependencies,
        );

  final ApiDestination apiDestination;

  @override
  bool operator ==(Object other) {
    return other is BaseUrlProvider && other.apiDestination == apiDestination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, apiDestination.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
