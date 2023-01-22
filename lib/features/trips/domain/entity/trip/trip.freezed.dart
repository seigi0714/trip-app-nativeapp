// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Trip {
  TripTitle get title => throw _privateConstructorUsedError;
  TripPeriod get tripPeriod => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Trip implements _Trip {
  const _$_Trip({required this.title, required this.tripPeriod});

  @override
  final TripTitle title;
  @override
  final TripPeriod tripPeriod;

  @override
  String toString() {
    return 'Trip(title: $title, tripPeriod: $tripPeriod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Trip &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tripPeriod, tripPeriod) ||
                other.tripPeriod == tripPeriod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, tripPeriod);
}

abstract class _Trip implements Trip {
  const factory _Trip(
      {required final TripTitle title,
      required final TripPeriod tripPeriod}) = _$_Trip;

  @override
  TripTitle get title;
  @override
  TripPeriod get tripPeriod;
}
