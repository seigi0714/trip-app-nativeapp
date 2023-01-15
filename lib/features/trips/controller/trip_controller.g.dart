// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'trip_controller.dart';

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

String $createTripHash() => r'ee3afc9e917c077d9a5a85aae875bfc877998cd4';

/// See also [createTrip].
class CreateTripProvider extends AutoDisposeFutureProvider<void> {
  CreateTripProvider({
    required this.title,
    required this.fromDate,
    required this.endDate,
  }) : super(
          (ref) => createTrip(
            ref,
            title: title,
            fromDate: fromDate,
            endDate: endDate,
          ),
          from: createTripProvider,
          name: r'createTripProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $createTripHash,
        );

  final String title;
  final DateTime fromDate;
  final DateTime endDate;

  @override
  bool operator ==(Object other) {
    return other is CreateTripProvider &&
        other.title == title &&
        other.fromDate == fromDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, fromDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef CreateTripRef = AutoDisposeFutureProviderRef<void>;

/// See also [createTrip].
final createTripProvider = CreateTripFamily();

class CreateTripFamily extends Family<AsyncValue<void>> {
  CreateTripFamily();

  CreateTripProvider call({
    required String title,
    required DateTime fromDate,
    required DateTime endDate,
  }) {
    return CreateTripProvider(
      title: title,
      fromDate: fromDate,
      endDate: endDate,
    );
  }

  @override
  AutoDisposeFutureProvider<void> getProviderOverride(
    covariant CreateTripProvider provider,
  ) {
    return call(
      title: provider.title,
      fromDate: provider.fromDate,
      endDate: provider.endDate,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'createTripProvider';
}
