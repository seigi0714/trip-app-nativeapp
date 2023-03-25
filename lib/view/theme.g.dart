// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'theme.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeDataHash() => r'eee79aa51dae82bd2b15329a9ca47099f934b8ee';

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

typedef ThemeDataRef = AutoDisposeProviderRef<ThemeData>;

/// See also [themeData].
@ProviderFor(themeData)
const themeDataProvider = ThemeDataFamily();

/// See also [themeData].
class ThemeDataFamily extends Family<ThemeData> {
  /// See also [themeData].
  const ThemeDataFamily();

  /// See also [themeData].
  ThemeDataProvider call(
    BuildContext context, {
    required bool isDark,
  }) {
    return ThemeDataProvider(
      context,
      isDark: isDark,
    );
  }

  @override
  ThemeDataProvider getProviderOverride(
    covariant ThemeDataProvider provider,
  ) {
    return call(
      provider.context,
      isDark: provider.isDark,
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
  String? get name => r'themeDataProvider';
}

/// See also [themeData].
class ThemeDataProvider extends AutoDisposeProvider<ThemeData> {
  /// See also [themeData].
  ThemeDataProvider(
    this.context, {
    required this.isDark,
  }) : super.internal(
          (ref) => themeData(
            ref,
            context,
            isDark: isDark,
          ),
          from: themeDataProvider,
          name: r'themeDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$themeDataHash,
          dependencies: ThemeDataFamily._dependencies,
          allTransitiveDependencies: ThemeDataFamily._allTransitiveDependencies,
        );

  final BuildContext context;
  final bool isDark;

  @override
  bool operator ==(Object other) {
    return other is ThemeDataProvider &&
        other.context == context &&
        other.isDark == isDark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, isDark.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
