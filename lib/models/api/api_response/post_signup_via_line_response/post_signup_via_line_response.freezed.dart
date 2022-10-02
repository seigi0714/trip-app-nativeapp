// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_signup_via_line_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostSignupViaLineResponse _$PostSignupViaLineResponseFromJson(
    Map<String, dynamic> json) {
  return _PostSignupViaLineResponse.fromJson(json);
}

/// @nodoc
mixin _$PostSignupViaLineResponse {
  String get customToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostSignupViaLineResponseCopyWith<PostSignupViaLineResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostSignupViaLineResponseCopyWith<$Res> {
  factory $PostSignupViaLineResponseCopyWith(PostSignupViaLineResponse value,
          $Res Function(PostSignupViaLineResponse) then) =
      _$PostSignupViaLineResponseCopyWithImpl<$Res>;
  $Res call({String customToken});
}

/// @nodoc
class _$PostSignupViaLineResponseCopyWithImpl<$Res>
    implements $PostSignupViaLineResponseCopyWith<$Res> {
  _$PostSignupViaLineResponseCopyWithImpl(this._value, this._then);

  final PostSignupViaLineResponse _value;
  // ignore: unused_field
  final $Res Function(PostSignupViaLineResponse) _then;

  @override
  $Res call({
    Object? customToken = freezed,
  }) {
    return _then(_value.copyWith(
      customToken: customToken == freezed
          ? _value.customToken
          : customToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PostSignupViaLineResponseCopyWith<$Res>
    implements $PostSignupViaLineResponseCopyWith<$Res> {
  factory _$$_PostSignupViaLineResponseCopyWith(
          _$_PostSignupViaLineResponse value,
          $Res Function(_$_PostSignupViaLineResponse) then) =
      __$$_PostSignupViaLineResponseCopyWithImpl<$Res>;
  @override
  $Res call({String customToken});
}

/// @nodoc
class __$$_PostSignupViaLineResponseCopyWithImpl<$Res>
    extends _$PostSignupViaLineResponseCopyWithImpl<$Res>
    implements _$$_PostSignupViaLineResponseCopyWith<$Res> {
  __$$_PostSignupViaLineResponseCopyWithImpl(
      _$_PostSignupViaLineResponse _value,
      $Res Function(_$_PostSignupViaLineResponse) _then)
      : super(_value, (v) => _then(v as _$_PostSignupViaLineResponse));

  @override
  _$_PostSignupViaLineResponse get _value =>
      super._value as _$_PostSignupViaLineResponse;

  @override
  $Res call({
    Object? customToken = freezed,
  }) {
    return _then(_$_PostSignupViaLineResponse(
      customToken: customToken == freezed
          ? _value.customToken
          : customToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostSignupViaLineResponse implements _PostSignupViaLineResponse {
  const _$_PostSignupViaLineResponse({required this.customToken});

  factory _$_PostSignupViaLineResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PostSignupViaLineResponseFromJson(json);

  @override
  final String customToken;

  @override
  String toString() {
    return 'PostSignupViaLineResponse(customToken: $customToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostSignupViaLineResponse &&
            const DeepCollectionEquality()
                .equals(other.customToken, customToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(customToken));

  @JsonKey(ignore: true)
  @override
  _$$_PostSignupViaLineResponseCopyWith<_$_PostSignupViaLineResponse>
      get copyWith => __$$_PostSignupViaLineResponseCopyWithImpl<
          _$_PostSignupViaLineResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostSignupViaLineResponseToJson(
      this,
    );
  }
}

abstract class _PostSignupViaLineResponse implements PostSignupViaLineResponse {
  const factory _PostSignupViaLineResponse(
      {required final String customToken}) = _$_PostSignupViaLineResponse;

  factory _PostSignupViaLineResponse.fromJson(Map<String, dynamic> json) =
      _$_PostSignupViaLineResponse.fromJson;

  @override
  String get customToken;
  @override
  @JsonKey(ignore: true)
  _$$_PostSignupViaLineResponseCopyWith<_$_PostSignupViaLineResponse>
      get copyWith => throw _privateConstructorUsedError;
}
