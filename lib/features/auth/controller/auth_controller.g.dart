// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'auth_controller.dart';

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

String $loginHash() => r'35fdd451a5d808a1e69af28d2da2dcc7360f1ac8';

/// See also [login].
class LoginProvider extends AutoDisposeFutureProvider<void> {
  LoginProvider(
    this.loginType,
  ) : super(
          (ref) => login(
            ref,
            loginType,
          ),
          from: loginProvider,
          name: r'loginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : $loginHash,
        );

  final LoginType loginType;

  @override
  bool operator ==(Object other) {
    return other is LoginProvider && other.loginType == loginType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, loginType.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef LoginRef = AutoDisposeFutureProviderRef<void>;

/// See also [login].
final loginProvider = LoginFamily();

class LoginFamily extends Family<AsyncValue<void>> {
  LoginFamily();

  LoginProvider call(
    LoginType loginType,
  ) {
    return LoginProvider(
      loginType,
    );
  }

  @override
  AutoDisposeFutureProvider<void> getProviderOverride(
    covariant LoginProvider provider,
  ) {
    return call(
      provider.loginType,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'loginProvider';
}

String $logOutHash() => r'81532b889defb2a5a11c08d2f7ec85f6bffa247e';

/// See also [logOut].
final logOutProvider = AutoDisposeFutureProvider<void>(
  logOut,
  name: r'logOutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $logOutHash,
);
typedef LogOutRef = AutoDisposeFutureProviderRef<void>;
