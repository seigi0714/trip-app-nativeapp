// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'trip_belonging_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tripBelongingsControllerHash() =>
    r'bb340cfbecab66b713ca8b66f610a42da36ef23b';

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

abstract class _$TripBelongingsController
    extends BuildlessAutoDisposeAsyncNotifier<List<AddedTripBelonging>> {
  late final int tripId;

  FutureOr<List<AddedTripBelonging>> build({
    required int tripId,
  });
}

/// See also [TripBelongingsController].
@ProviderFor(TripBelongingsController)
const tripBelongingsControllerProvider = TripBelongingsControllerFamily();

/// See also [TripBelongingsController].
class TripBelongingsControllerFamily
    extends Family<AsyncValue<List<AddedTripBelonging>>> {
  /// See also [TripBelongingsController].
  const TripBelongingsControllerFamily();

  /// See also [TripBelongingsController].
  TripBelongingsControllerProvider call({
    required int tripId,
  }) {
    return TripBelongingsControllerProvider(
      tripId: tripId,
    );
  }

  @override
  TripBelongingsControllerProvider getProviderOverride(
    covariant TripBelongingsControllerProvider provider,
  ) {
    return call(
      tripId: provider.tripId,
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
  String? get name => r'tripBelongingsControllerProvider';
}

/// See also [TripBelongingsController].
class TripBelongingsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TripBelongingsController,
        List<AddedTripBelonging>> {
  /// See also [TripBelongingsController].
  TripBelongingsControllerProvider({
    required this.tripId,
  }) : super.internal(
          () => TripBelongingsController()..tripId = tripId,
          from: tripBelongingsControllerProvider,
          name: r'tripBelongingsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tripBelongingsControllerHash,
          dependencies: TripBelongingsControllerFamily._dependencies,
          allTransitiveDependencies:
              TripBelongingsControllerFamily._allTransitiveDependencies,
        );

  final int tripId;

  @override
  bool operator ==(Object other) {
    return other is TripBelongingsControllerProvider && other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<AddedTripBelonging>> runNotifierBuild(
    covariant TripBelongingsController notifier,
  ) {
    return notifier.build(
      tripId: tripId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
