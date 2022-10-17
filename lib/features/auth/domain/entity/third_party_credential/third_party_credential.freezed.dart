// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$ThirdPartyCredentialCopyWithImpl<$Res>;
  $Res call({String idToken, String accessToken});
}

/// @nodoc
class _$ThirdPartyCredentialCopyWithImpl<$Res>
    implements $ThirdPartyCredentialCopyWith<$Res> {
  _$ThirdPartyCredentialCopyWithImpl(this._value, this._then);

  final ThirdPartyCredential _value;
  // ignore: unused_field
  final $Res Function(ThirdPartyCredential) _then;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ThirdPartyCredentialCopyWith<$Res>
    implements $ThirdPartyCredentialCopyWith<$Res> {
  factory _$$_ThirdPartyCredentialCopyWith(_$_ThirdPartyCredential value,
          $Res Function(_$_ThirdPartyCredential) then) =
      __$$_ThirdPartyCredentialCopyWithImpl<$Res>;
  @override
  $Res call({String idToken, String accessToken});
}

/// @nodoc
class __$$_ThirdPartyCredentialCopyWithImpl<$Res>
    extends _$ThirdPartyCredentialCopyWithImpl<$Res>
    implements _$$_ThirdPartyCredentialCopyWith<$Res> {
  __$$_ThirdPartyCredentialCopyWithImpl(_$_ThirdPartyCredential _value,
      $Res Function(_$_ThirdPartyCredential) _then)
      : super(_value, (v) => _then(v as _$_ThirdPartyCredential));

  @override
  _$_ThirdPartyCredential get _value => super._value as _$_ThirdPartyCredential;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_$_ThirdPartyCredential(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
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
            const DeepCollectionEquality().equals(other.idToken, idToken) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idToken),
      const DeepCollectionEquality().hash(accessToken));

  @JsonKey(ignore: true)
  @override
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
