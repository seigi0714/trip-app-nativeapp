// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'firebase_auth_repository.dart';

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

String $firebaseAuthHash() => r'e9b402f7c78fff0de442bc85fa64f91849d0eb45';

/// See also [firebaseAuth].
final firebaseAuthProvider = AutoDisposeProvider<FirebaseAuth>(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $firebaseAuthHash,
);
typedef FirebaseAuthRef = AutoDisposeProviderRef<FirebaseAuth>;
String $firebaseAuthRepositoryHash() =>
    r'd15bac294cad72ed28f714e426e86c329a8eb7da';

/// See also [firebaseAuthRepository].
final firebaseAuthRepositoryProvider =
    AutoDisposeProvider<FirebaseAuthInterface>(
  firebaseAuthRepository,
  name: r'firebaseAuthRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $firebaseAuthRepositoryHash,
);
typedef FirebaseAuthRepositoryRef
    = AutoDisposeProviderRef<FirebaseAuthInterface>;
