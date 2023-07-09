// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'trip_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tripsHash() => r'8a3992ca76d126ea745ec9522b5b20895197a568';

/// See also [trips].
@ProviderFor(trips)
final tripsProvider = AutoDisposeFutureProvider<List<ExistingTrip>>.internal(
  trips,
  name: r'tripsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tripsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TripsRef = AutoDisposeFutureProviderRef<List<ExistingTrip>>;
String _$duplicatedTripControllerHash() =>
    r'bde4c961b5d3bd3cbdc004db9c068c940e76747b';

/// See also [duplicatedTripController].
@ProviderFor(duplicatedTripController)
final duplicatedTripControllerProvider =
    AutoDisposeProvider<DuplicatedTripController>.internal(
  duplicatedTripController,
  name: r'duplicatedTripControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$duplicatedTripControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DuplicatedTripControllerRef
    = AutoDisposeProviderRef<DuplicatedTripController>;
String _$tripControllerHash() => r'dbd98791a881a22471a0a43cba12be2d95628aa2';

/// See also [TripController].
@ProviderFor(TripController)
final tripControllerProvider = AutoDisposeAsyncNotifierProvider<TripController,
    List<ExistingTrip>>.internal(
  TripController.new,
  name: r'tripControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tripControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TripController = AutoDisposeAsyncNotifier<List<ExistingTrip>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
