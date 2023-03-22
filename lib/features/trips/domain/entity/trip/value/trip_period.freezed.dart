// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_period.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TripPeriod {
  DateTime get fromDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_TripPeriod implements _TripPeriod {
  _$_TripPeriod({required this.fromDate, required this.endDate});

  @override
  final DateTime fromDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'TripPeriod._internal(fromDate: $fromDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripPeriod &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromDate, endDate);
}

abstract class _TripPeriod implements TripPeriod {
  factory _TripPeriod(
      {required final DateTime fromDate,
      required final DateTime endDate}) = _$_TripPeriod;

  @override
  DateTime get fromDate;
  @override
  DateTime get endDate;
}
