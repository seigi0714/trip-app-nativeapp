// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'header_interceptor.dart';

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

String $headerInterceptorHash() => r'70fab2e645180399e947741ebd749dc8f1671857';

/// See also [headerInterceptor].
class HeaderInterceptorProvider extends Provider<HeaderInterceptor> {
  HeaderInterceptorProvider(
    this.apiDestination,
  ) : super(
          (ref) => headerInterceptor(
            ref,
            apiDestination,
          ),
          from: headerInterceptorProvider,
          name: r'headerInterceptorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $headerInterceptorHash,
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

typedef HeaderInterceptorRef = ProviderRef<HeaderInterceptor>;

/// See also [headerInterceptor].
final headerInterceptorProvider = HeaderInterceptorFamily();

class HeaderInterceptorFamily extends Family<HeaderInterceptor> {
  HeaderInterceptorFamily();

  HeaderInterceptorProvider call(
    ApiDestination apiDestination,
  ) {
    return HeaderInterceptorProvider(
      apiDestination,
    );
  }

  @override
  Provider<HeaderInterceptor> getProviderOverride(
    covariant HeaderInterceptorProvider provider,
  ) {
    return call(
      provider.apiDestination,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'headerInterceptorProvider';
}
