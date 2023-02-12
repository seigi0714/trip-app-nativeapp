// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_trip_member_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchTripMemberResponse _$FetchTripMemberResponseFromJson(
    Map<String, dynamic> json) {
  return _FetchTripMemberResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchTripMemberResponse {
  bool get isHost => throw _privateConstructorUsedError;
  GetUserResponse get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_FetchTripMemberResponse implements _FetchTripMemberResponse {
  const _$_FetchTripMemberResponse({required this.isHost, required this.user});

  factory _$_FetchTripMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchTripMemberResponseFromJson(json);

  @override
  final bool isHost;
  @override
  final GetUserResponse user;

  @override
  String toString() {
    return 'FetchTripMemberResponse(isHost: $isHost, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchTripMemberResponse &&
            (identical(other.isHost, isHost) || other.isHost == isHost) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isHost, user);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchTripMemberResponseToJson(
      this,
    );
  }
}

abstract class _FetchTripMemberResponse implements FetchTripMemberResponse {
  const factory _FetchTripMemberResponse(
      {required final bool isHost,
      required final GetUserResponse user}) = _$_FetchTripMemberResponse;

  factory _FetchTripMemberResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchTripMemberResponse.fromJson;

  @override
  bool get isHost;
  @override
  GetUserResponse get user;
}
