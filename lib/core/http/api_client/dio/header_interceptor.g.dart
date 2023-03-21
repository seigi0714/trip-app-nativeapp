// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'header_interceptor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$headerInterceptorHash() => r'70fab2e645180399e947741ebd749dc8f1671857';

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

typedef HeaderInterceptorRef = ProviderRef<HeaderInterceptor>;

/// See also [headerInterceptor].
@ProviderFor(headerInterceptor)
const headerInterceptorProvider = HeaderInterceptorFamily();

/// See also [headerInterceptor].
class HeaderInterceptorFamily extends Family<HeaderInterceptor> {
  /// See also [headerInterceptor].
  const HeaderInterceptorFamily();

  /// See also [headerInterceptor].
  HeaderInterceptorProvider call(
    ApiDestination apiDestination,
  ) {
    return HeaderInterceptorProvider(
      apiDestination,
    );
  }

  @override
  HeaderInterceptorProvider getProviderOverride(
    covariant HeaderInterceptorProvider provider,
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
  String? get name => r'headerInterceptorProvider';
}

/// See also [headerInterceptor].
class HeaderInterceptorProvider extends Provider<HeaderInterceptor> {
  /// See also [headerInterceptor].
  HeaderInterceptorProvider(
    this.apiDestination,
  ) : super.internal(
          (ref) => headerInterceptor(
            ref,
            apiDestination,
          ),
          from: headerInterceptorProvider,
          name: r'headerInterceptorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$headerInterceptorHash,
          dependencies: HeaderInterceptorFamily._dependencies,
          allTransitiveDependencies:
              HeaderInterceptorFamily._allTransitiveDependencies,
        );

  final ApiDestination apiDestination;

  @override
  bool operator ==(Object other) {
    return other is HeaderInterceptorProvider &&
        other.apiDestination == apiDestination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, apiDestination.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
