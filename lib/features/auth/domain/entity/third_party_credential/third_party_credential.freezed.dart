// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'third_party_credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThirdPartyCredential {
  String get idToken => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThirdPartyCredentialCopyWith<ThirdPartyCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThirdPartyCredentialCopyWith<$Res> {
  factory $ThirdPartyCredentialCopyWith(ThirdPartyCredential value,
          $Res Function(ThirdPartyCredential) then) =
      _$ThirdPartyCredentialCopyWithImpl<$Res, ThirdPartyCredential>;
  @useResult
  $Res call({String idToken, String accessToken});
}

/// @nodoc
class _$ThirdPartyCredentialCopyWithImpl<$Res,
        $Val extends ThirdPartyCredential>
    implements $ThirdPartyCredentialCopyWith<$Res> {
  _$ThirdPartyCredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThirdPartyCredentialCopyWith<$Res>
    implements $ThirdPartyCredentialCopyWith<$Res> {
  factory _$$_ThirdPartyCredentialCopyWith(_$_ThirdPartyCredential value,
          $Res Function(_$_ThirdPartyCredential) then) =
      __$$_ThirdPartyCredentialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idToken, String accessToken});
}

/// @nodoc
class __$$_ThirdPartyCredentialCopyWithImpl<$Res>
    extends _$ThirdPartyCredentialCopyWithImpl<$Res, _$_ThirdPartyCredential>
    implements _$$_ThirdPartyCredentialCopyWith<$Res> {
  __$$_ThirdPartyCredentialCopyWithImpl(_$_ThirdPartyCredential _value,
      $Res Function(_$_ThirdPartyCredential) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? accessToken = null,
  }) {
    return _then(_$_ThirdPartyCredential(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ThirdPartyCredential implements _ThirdPartyCredential {
  const _$_ThirdPartyCredential(
      {required this.idToken, required this.accessToken});

  @override
  final String idToken;
  @override
  final String accessToken;

  @override
  String toString() {
    return 'ThirdPartyCredential(idToken: $idToken, accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThirdPartyCredential &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idToken, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThirdPartyCredentialCopyWith<_$_ThirdPartyCredential> get copyWith =>
      __$$_ThirdPartyCredentialCopyWithImpl<_$_ThirdPartyCredential>(
          this, _$identity);
}

abstract class _ThirdPartyCredential implements ThirdPartyCredential {
  const factory _ThirdPartyCredential(
      {required final String idToken,
      required final String accessToken}) = _$_ThirdPartyCredential;

  @override
  String get idToken;
  @override
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$_ThirdPartyCredentialCopyWith<_$_ThirdPartyCredential> get copyWith =>
      throw _privateConstructorUsedError;
}
