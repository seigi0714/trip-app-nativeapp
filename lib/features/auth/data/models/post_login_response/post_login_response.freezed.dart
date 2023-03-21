// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostLoginResponse _$PostLoginResponseFromJson(Map<String, dynamic> json) {
  return _PostLoginResponse.fromJson(json);
}

/// @nodoc
mixin _$PostLoginResponse {
  String get customToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostLoginResponseCopyWith<PostLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostLoginResponseCopyWith<$Res> {
  factory $PostLoginResponseCopyWith(
          PostLoginResponse value, $Res Function(PostLoginResponse) then) =
      _$PostLoginResponseCopyWithImpl<$Res, PostLoginResponse>;
  @useResult
  $Res call({String customToken});
}

/// @nodoc
class _$PostLoginResponseCopyWithImpl<$Res, $Val extends PostLoginResponse>
    implements $PostLoginResponseCopyWith<$Res> {
  _$PostLoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customToken = null,
  }) {
    return _then(_value.copyWith(
      customToken: null == customToken
          ? _value.customToken
          : customToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostLoginResponseCopyWith<$Res>
    implements $PostLoginResponseCopyWith<$Res> {
  factory _$$_PostLoginResponseCopyWith(_$_PostLoginResponse value,
          $Res Function(_$_PostLoginResponse) then) =
      __$$_PostLoginResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String customToken});
}

/// @nodoc
class __$$_PostLoginResponseCopyWithImpl<$Res>
    extends _$PostLoginResponseCopyWithImpl<$Res, _$_PostLoginResponse>
    implements _$$_PostLoginResponseCopyWith<$Res> {
  __$$_PostLoginResponseCopyWithImpl(
      _$_PostLoginResponse _value, $Res Function(_$_PostLoginResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customToken = null,
  }) {
    return _then(_$_PostLoginResponse(
      customToken: null == customToken
          ? _value.customToken
          : customToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostLoginResponse implements _PostLoginResponse {
  const _$_PostLoginResponse({required this.customToken});

  factory _$_PostLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PostLoginResponseFromJson(json);

  @override
  final String customToken;

  @override
  String toString() {
    return 'PostLoginResponse(customToken: $customToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostLoginResponse &&
            (identical(other.customToken, customToken) ||
                other.customToken == customToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostLoginResponseCopyWith<_$_PostLoginResponse> get copyWith =>
      __$$_PostLoginResponseCopyWithImpl<_$_PostLoginResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostLoginResponseToJson(
      this,
    );
  }
}

abstract class _PostLoginResponse implements PostLoginResponse {
  const factory _PostLoginResponse({required final String customToken}) =
      _$_PostLoginResponse;

  factory _PostLoginResponse.fromJson(Map<String, dynamic> json) =
      _$_PostLoginResponse.fromJson;

  @override
  String get customToken;
  @override
  @JsonKey(ignore: true)
  _$$_PostLoginResponseCopyWith<_$_PostLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
