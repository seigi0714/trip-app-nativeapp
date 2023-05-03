// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'trip_belonging_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tripBelongingsAsyncControllerHash() =>
    r'48bd343764685fc0707c2effe0401471332d8d65';

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

abstract class _$TripBelongingsAsyncController
    extends BuildlessAutoDisposeAsyncNotifier<List<AddedTripBelonging>> {
  late final int tripId;

  FutureOr<List<AddedTripBelonging>> build({
    required int tripId,
  });
}

/// See also [TripBelongingsAsyncController].
@ProviderFor(TripBelongingsAsyncController)
const tripBelongingsAsyncControllerProvider =
    TripBelongingsAsyncControllerFamily();

/// See also [TripBelongingsAsyncController].
class TripBelongingsAsyncControllerFamily
    extends Family<AsyncValue<List<AddedTripBelonging>>> {
  /// See also [TripBelongingsAsyncController].
  const TripBelongingsAsyncControllerFamily();

  /// See also [TripBelongingsAsyncController].
  TripBelongingsAsyncControllerProvider call({
    required int tripId,
  }) {
    return TripBelongingsAsyncControllerProvider(
      tripId: tripId,
    );
  }

  @override
  TripBelongingsAsyncControllerProvider getProviderOverride(
    covariant TripBelongingsAsyncControllerProvider provider,
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
  String? get name => r'tripBelongingsAsyncControllerProvider';
}

/// See also [TripBelongingsAsyncController].
class TripBelongingsAsyncControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TripBelongingsAsyncController,
        List<AddedTripBelonging>> {
  /// See also [TripBelongingsAsyncController].
  TripBelongingsAsyncControllerProvider({
    required this.tripId,
  }) : super.internal(
          () => TripBelongingsAsyncController()..tripId = tripId,
          from: tripBelongingsAsyncControllerProvider,
          name: r'tripBelongingsAsyncControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tripBelongingsAsyncControllerHash,
          dependencies: TripBelongingsAsyncControllerFamily._dependencies,
          allTransitiveDependencies:
              TripBelongingsAsyncControllerFamily._allTransitiveDependencies,
        );

  final int tripId;

  @override
  bool operator ==(Object other) {
    return other is TripBelongingsAsyncControllerProvider &&
        other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<AddedTripBelonging>> runNotifierBuild(
    covariant TripBelongingsAsyncController notifier,
  ) {
    return notifier.build(
      tripId: tripId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
