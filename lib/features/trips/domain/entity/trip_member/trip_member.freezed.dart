// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trip_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripMember _$TripMemberFromJson(Map<String, dynamic> json) {
  return _TripMember.fromJson(json);
}

/// @nodoc
mixin _$TripMember {
  AppUser get member => throw _privateConstructorUsedError;
  bool get isHost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripMemberCopyWith<TripMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripMemberCopyWith<$Res> {
  factory $TripMemberCopyWith(
          TripMember value, $Res Function(TripMember) then) =
      _$TripMemberCopyWithImpl<$Res, TripMember>;
  @useResult
  $Res call({AppUser member, bool isHost});

  $AppUserCopyWith<$Res> get member;
}

/// @nodoc
class _$TripMemberCopyWithImpl<$Res, $Val extends TripMember>
    implements $TripMemberCopyWith<$Res> {
  _$TripMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? isHost = null,
  }) {
    return _then(_value.copyWith(
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as AppUser,
      isHost: null == isHost
          ? _value.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get member {
    return $AppUserCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TripMemberCopyWith<$Res>
    implements $TripMemberCopyWith<$Res> {
  factory _$$_TripMemberCopyWith(
          _$_TripMember value, $Res Function(_$_TripMember) then) =
      __$$_TripMemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppUser member, bool isHost});

  @override
  $AppUserCopyWith<$Res> get member;
}

/// @nodoc
class __$$_TripMemberCopyWithImpl<$Res>
    extends _$TripMemberCopyWithImpl<$Res, _$_TripMember>
    implements _$$_TripMemberCopyWith<$Res> {
  __$$_TripMemberCopyWithImpl(
      _$_TripMember _value, $Res Function(_$_TripMember) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? isHost = null,
  }) {
    return _then(_$_TripMember(
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as AppUser,
      isHost: null == isHost
          ? _value.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripMember implements _TripMember {
  const _$_TripMember({required this.member, required this.isHost});

  factory _$_TripMember.fromJson(Map<String, dynamic> json) =>
      _$$_TripMemberFromJson(json);

  @override
  final AppUser member;
  @override
  final bool isHost;

  @override
  String toString() {
    return 'TripMember(member: $member, isHost: $isHost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripMember &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.isHost, isHost) || other.isHost == isHost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, member, isHost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripMemberCopyWith<_$_TripMember> get copyWith =>
      __$$_TripMemberCopyWithImpl<_$_TripMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripMemberToJson(
      this,
    );
  }
}

abstract class _TripMember implements TripMember {
  const factory _TripMember(
      {required final AppUser member,
      required final bool isHost}) = _$_TripMember;

  factory _TripMember.fromJson(Map<String, dynamic> json) =
      _$_TripMember.fromJson;

  @override
  AppUser get member;
  @override
  bool get isHost;
  @override
  @JsonKey(ignore: true)
  _$$_TripMemberCopyWith<_$_TripMember> get copyWith =>
      throw _privateConstructorUsedError;
}
