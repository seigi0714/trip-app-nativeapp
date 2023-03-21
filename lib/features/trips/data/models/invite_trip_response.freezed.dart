// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InviteTripResponse _$InviteTripResponseFromJson(Map<String, dynamic> json) {
  return _InviteTripResponse.fromJson(json);
}

/// @nodoc
mixin _$InviteTripResponse {
  String get invitationCode => throw _privateConstructorUsedError;
  int get invitationNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InviteTripResponseCopyWith<InviteTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InviteTripResponseCopyWith<$Res> {
  factory $InviteTripResponseCopyWith(
          InviteTripResponse value, $Res Function(InviteTripResponse) then) =
      _$InviteTripResponseCopyWithImpl<$Res, InviteTripResponse>;
  @useResult
  $Res call({String invitationCode, int invitationNum});
}

/// @nodoc
class _$InviteTripResponseCopyWithImpl<$Res, $Val extends InviteTripResponse>
    implements $InviteTripResponseCopyWith<$Res> {
  _$InviteTripResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationCode = null,
    Object? invitationNum = null,
  }) {
    return _then(_value.copyWith(
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String,
      invitationNum: null == invitationNum
          ? _value.invitationNum
          : invitationNum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InviteTripResponseCopyWith<$Res>
    implements $InviteTripResponseCopyWith<$Res> {
  factory _$$_InviteTripResponseCopyWith(_$_InviteTripResponse value,
          $Res Function(_$_InviteTripResponse) then) =
      __$$_InviteTripResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String invitationCode, int invitationNum});
}

/// @nodoc
class __$$_InviteTripResponseCopyWithImpl<$Res>
    extends _$InviteTripResponseCopyWithImpl<$Res, _$_InviteTripResponse>
    implements _$$_InviteTripResponseCopyWith<$Res> {
  __$$_InviteTripResponseCopyWithImpl(
      _$_InviteTripResponse _value, $Res Function(_$_InviteTripResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationCode = null,
    Object? invitationNum = null,
  }) {
    return _then(_$_InviteTripResponse(
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String,
      invitationNum: null == invitationNum
          ? _value.invitationNum
          : invitationNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InviteTripResponse implements _InviteTripResponse {
  const _$_InviteTripResponse(
      {required this.invitationCode, required this.invitationNum});

  factory _$_InviteTripResponse.fromJson(Map<String, dynamic> json) =>
      _$$_InviteTripResponseFromJson(json);

  @override
  final String invitationCode;
  @override
  final int invitationNum;

  @override
  String toString() {
    return 'InviteTripResponse(invitationCode: $invitationCode, invitationNum: $invitationNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InviteTripResponse &&
            (identical(other.invitationCode, invitationCode) ||
                other.invitationCode == invitationCode) &&
            (identical(other.invitationNum, invitationNum) ||
                other.invitationNum == invitationNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, invitationCode, invitationNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InviteTripResponseCopyWith<_$_InviteTripResponse> get copyWith =>
      __$$_InviteTripResponseCopyWithImpl<_$_InviteTripResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InviteTripResponseToJson(
      this,
    );
  }
}

abstract class _InviteTripResponse implements InviteTripResponse {
  const factory _InviteTripResponse(
      {required final String invitationCode,
      required final int invitationNum}) = _$_InviteTripResponse;

  factory _InviteTripResponse.fromJson(Map<String, dynamic> json) =
      _$_InviteTripResponse.fromJson;

  @override
  String get invitationCode;
  @override
  int get invitationNum;
  @override
  @JsonKey(ignore: true)
  _$$_InviteTripResponseCopyWith<_$_InviteTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
