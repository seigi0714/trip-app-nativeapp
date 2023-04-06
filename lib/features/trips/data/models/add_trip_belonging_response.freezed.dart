// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_trip_belonging_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddTripBelongingResponse _$AddTripBelongingResponseFromJson(
    Map<String, dynamic> json) {
  return _AddTripBelongingResponse.fromJson(json);
}

/// @nodoc
mixin _$AddTripBelongingResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get numOf => throw _privateConstructorUsedError;
  bool get isSharedAmongMember => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_AddTripBelongingResponse implements _AddTripBelongingResponse {
  const _$_AddTripBelongingResponse(
      {required this.id,
      required this.name,
      required this.numOf,
      required this.isSharedAmongMember});

  factory _$_AddTripBelongingResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AddTripBelongingResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int numOf;
  @override
  final bool isSharedAmongMember;

  @override
  String toString() {
    return 'AddTripBelongingResponse(id: $id, name: $name, numOf: $numOf, isSharedAmongMember: $isSharedAmongMember)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTripBelongingResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.numOf, numOf) || other.numOf == numOf) &&
            (identical(other.isSharedAmongMember, isSharedAmongMember) ||
                other.isSharedAmongMember == isSharedAmongMember));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, numOf, isSharedAmongMember);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddTripBelongingResponseToJson(
      this,
    );
  }
}

abstract class _AddTripBelongingResponse implements AddTripBelongingResponse {
  const factory _AddTripBelongingResponse(
      {required final int id,
      required final String name,
      required final int numOf,
      required final bool isSharedAmongMember}) = _$_AddTripBelongingResponse;

  factory _AddTripBelongingResponse.fromJson(Map<String, dynamic> json) =
      _$_AddTripBelongingResponse.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get numOf;
  @override
  bool get isSharedAmongMember;
}
