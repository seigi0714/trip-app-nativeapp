// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'baseurl.dart';

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

String $baseUrlHash() => r'a128f97c4b019081b9565c31e6213b71d95917cb';

/// See also [baseUrl].
class BaseUrlProvider extends AutoDisposeProvider<String> {
  BaseUrlProvider(
    this.apiDestination,
  ) : super(
          (ref) => baseUrl(
            ref,
            apiDestination,
          ),
          from: baseUrlProvider,
          name: r'baseUrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $baseUrlHash,
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

typedef BaseUrlRef = AutoDisposeProviderRef<String>;

/// See also [baseUrl].
final baseUrlProvider = BaseUrlFamily();

class BaseUrlFamily extends Family<String> {
  BaseUrlFamily();

  BaseUrlProvider call(
    ApiDestination apiDestination,
  ) {
    return BaseUrlProvider(
      apiDestination,
    );
  }

  @override
  AutoDisposeProvider<String> getProviderOverride(
    covariant BaseUrlProvider provider,
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
  String? get name => r'baseUrlProvider';
}
