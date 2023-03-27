// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'theme.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lightThemeDataHash() => r'b5f5bd981d2a607f4890d3c39074654b038068e7';

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

typedef LightThemeDataRef = AutoDisposeProviderRef<ThemeData>;

/// See also [lightThemeData].
@ProviderFor(lightThemeData)
const lightThemeDataProvider = LightThemeDataFamily();

/// See also [lightThemeData].
class LightThemeDataFamily extends Family<ThemeData> {
  /// See also [lightThemeData].
  const LightThemeDataFamily();

  /// See also [lightThemeData].
  LightThemeDataProvider call(
    BuildContext context,
  ) {
    return LightThemeDataProvider(
      context,
    );
  }

  @override
  LightThemeDataProvider getProviderOverride(
    covariant LightThemeDataProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'lightThemeDataProvider';
}

/// See also [lightThemeData].
class LightThemeDataProvider extends AutoDisposeProvider<ThemeData> {
  /// See also [lightThemeData].
  LightThemeDataProvider(
    this.context,
  ) : super.internal(
          (ref) => lightThemeData(
            ref,
            context,
          ),
          from: lightThemeDataProvider,
          name: r'lightThemeDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lightThemeDataHash,
          dependencies: LightThemeDataFamily._dependencies,
          allTransitiveDependencies:
              LightThemeDataFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is LightThemeDataProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$darkThemeDataHash() => r'8f22fe3d2b8c1fac6f02c9d038c8b19ffae7bb74';
typedef DarkThemeDataRef = AutoDisposeProviderRef<ThemeData>;

/// See also [darkThemeData].
@ProviderFor(darkThemeData)
const darkThemeDataProvider = DarkThemeDataFamily();

/// See also [darkThemeData].
class DarkThemeDataFamily extends Family<ThemeData> {
  /// See also [darkThemeData].
  const DarkThemeDataFamily();

  /// See also [darkThemeData].
  DarkThemeDataProvider call(
    BuildContext context,
  ) {
    return DarkThemeDataProvider(
      context,
    );
  }

  @override
  DarkThemeDataProvider getProviderOverride(
    covariant DarkThemeDataProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'darkThemeDataProvider';
}

/// See also [darkThemeData].
class DarkThemeDataProvider extends AutoDisposeProvider<ThemeData> {
  /// See also [darkThemeData].
  DarkThemeDataProvider(
    this.context,
  ) : super.internal(
          (ref) => darkThemeData(
            ref,
            context,
          ),
          from: darkThemeDataProvider,
          name: r'darkThemeDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$darkThemeDataHash,
          dependencies: DarkThemeDataFamily._dependencies,
          allTransitiveDependencies:
              DarkThemeDataFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is DarkThemeDataProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
