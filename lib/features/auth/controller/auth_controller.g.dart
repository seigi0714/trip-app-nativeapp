// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthUserHash() => r'ffb1a892262d80f60d87e9c52c4ad030773b68c0';

/// See also [firebaseAuthUser].
@ProviderFor(firebaseAuthUser)
final firebaseAuthUserProvider = StreamProvider<User?>.internal(
  firebaseAuthUser,
  name: r'firebaseAuthUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthUserRef = StreamProviderRef<User?>;
String _$authControllerHash() => r'59574e6e1cdcabbe18cb9e242363875abd753473';

/// See also [authController].
@ProviderFor(authController)
final authControllerProvider = AutoDisposeProvider<AuthController>.internal(
  authController,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthControllerRef = AutoDisposeProviderRef<AuthController>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
