// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_belonging.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TripBelonging {
  int get id => throw _privateConstructorUsedError;
  TripBelongingName get name => throw _privateConstructorUsedError;
  TripBelongingNum get numOf => throw _privateConstructorUsedError;
  bool get isSharedAmongMember => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_TripBelonging implements _TripBelonging {
  const _$_TripBelonging(
      {required this.id,
      required this.name,
      required this.numOf,
      required this.isSharedAmongMember});

  @override
  final int id;
  @override
  final TripBelongingName name;
  @override
  final TripBelongingNum numOf;
  @override
  final bool isSharedAmongMember;

  @override
  String toString() {
    return 'TripBelonging(id: $id, name: $name, numOf: $numOf, isSharedAmongMember: $isSharedAmongMember)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripBelonging &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.numOf, numOf) || other.numOf == numOf) &&
            (identical(other.isSharedAmongMember, isSharedAmongMember) ||
                other.isSharedAmongMember == isSharedAmongMember));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, numOf, isSharedAmongMember);
}

abstract class _TripBelonging implements TripBelonging {
  const factory _TripBelonging(
      {required final int id,
      required final TripBelongingName name,
      required final TripBelongingNum numOf,
      required final bool isSharedAmongMember}) = _$_TripBelonging;

  @override
  int get id;
  @override
  TripBelongingName get name;
  @override
  TripBelongingNum get numOf;
  @override
  bool get isSharedAmongMember;
}
