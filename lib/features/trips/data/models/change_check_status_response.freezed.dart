// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_check_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChangeCheckStatusResponse _$ChangeCheckStatusResponseFromJson(
    Map<String, dynamic> json) {
  return _ChangeCheckStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$ChangeCheckStatusResponse {
  bool get isChecked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangeCheckStatusResponseCopyWith<ChangeCheckStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeCheckStatusResponseCopyWith<$Res> {
  factory $ChangeCheckStatusResponseCopyWith(ChangeCheckStatusResponse value,
          $Res Function(ChangeCheckStatusResponse) then) =
      _$ChangeCheckStatusResponseCopyWithImpl<$Res, ChangeCheckStatusResponse>;
  @useResult
  $Res call({bool isChecked});
}

/// @nodoc
class _$ChangeCheckStatusResponseCopyWithImpl<$Res,
        $Val extends ChangeCheckStatusResponse>
    implements $ChangeCheckStatusResponseCopyWith<$Res> {
  _$ChangeCheckStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChecked = null,
  }) {
    return _then(_value.copyWith(
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangeCheckStatusResponseCopyWith<$Res>
    implements $ChangeCheckStatusResponseCopyWith<$Res> {
  factory _$$_ChangeCheckStatusResponseCopyWith(
          _$_ChangeCheckStatusResponse value,
          $Res Function(_$_ChangeCheckStatusResponse) then) =
      __$$_ChangeCheckStatusResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isChecked});
}

/// @nodoc
class __$$_ChangeCheckStatusResponseCopyWithImpl<$Res>
    extends _$ChangeCheckStatusResponseCopyWithImpl<$Res,
        _$_ChangeCheckStatusResponse>
    implements _$$_ChangeCheckStatusResponseCopyWith<$Res> {
  __$$_ChangeCheckStatusResponseCopyWithImpl(
      _$_ChangeCheckStatusResponse _value,
      $Res Function(_$_ChangeCheckStatusResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChecked = null,
  }) {
    return _then(_$_ChangeCheckStatusResponse(
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChangeCheckStatusResponse implements _ChangeCheckStatusResponse {
  const _$_ChangeCheckStatusResponse({required this.isChecked});

  factory _$_ChangeCheckStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChangeCheckStatusResponseFromJson(json);

  @override
  final bool isChecked;

  @override
  String toString() {
    return 'ChangeCheckStatusResponse(isChecked: $isChecked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeCheckStatusResponse &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isChecked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeCheckStatusResponseCopyWith<_$_ChangeCheckStatusResponse>
      get copyWith => __$$_ChangeCheckStatusResponseCopyWithImpl<
          _$_ChangeCheckStatusResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChangeCheckStatusResponseToJson(
      this,
    );
  }
}

abstract class _ChangeCheckStatusResponse implements ChangeCheckStatusResponse {
  const factory _ChangeCheckStatusResponse({required final bool isChecked}) =
      _$_ChangeCheckStatusResponse;

  factory _ChangeCheckStatusResponse.fromJson(Map<String, dynamic> json) =
      _$_ChangeCheckStatusResponse.fromJson;

  @override
  bool get isChecked;
  @override
  @JsonKey(ignore: true)
  _$$_ChangeCheckStatusResponseCopyWith<_$_ChangeCheckStatusResponse>
      get copyWith => throw _privateConstructorUsedError;
}
