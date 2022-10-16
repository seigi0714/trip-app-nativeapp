// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'third_perty_credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThirdPertyCredential {
  String get idToken => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThirdPertyCredentialCopyWith<ThirdPertyCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThirdPertyCredentialCopyWith<$Res> {
  factory $ThirdPertyCredentialCopyWith(ThirdPertyCredential value,
          $Res Function(ThirdPertyCredential) then) =
      _$ThirdPertyCredentialCopyWithImpl<$Res>;
  $Res call({String idToken, String accessToken});
}

/// @nodoc
class _$ThirdPertyCredentialCopyWithImpl<$Res>
    implements $ThirdPertyCredentialCopyWith<$Res> {
  _$ThirdPertyCredentialCopyWithImpl(this._value, this._then);

  final ThirdPertyCredential _value;
  // ignore: unused_field
  final $Res Function(ThirdPertyCredential) _then;

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
abstract class _$$_ThirdPertyCredentialCopyWith<$Res>
    implements $ThirdPertyCredentialCopyWith<$Res> {
  factory _$$_ThirdPertyCredentialCopyWith(_$_ThirdPertyCredential value,
          $Res Function(_$_ThirdPertyCredential) then) =
      __$$_ThirdPertyCredentialCopyWithImpl<$Res>;
  @override
  $Res call({String idToken, String accessToken});
}

/// @nodoc
class __$$_ThirdPertyCredentialCopyWithImpl<$Res>
    extends _$ThirdPertyCredentialCopyWithImpl<$Res>
    implements _$$_ThirdPertyCredentialCopyWith<$Res> {
  __$$_ThirdPertyCredentialCopyWithImpl(_$_ThirdPertyCredential _value,
      $Res Function(_$_ThirdPertyCredential) _then)
      : super(_value, (v) => _then(v as _$_ThirdPertyCredential));

  @override
  _$_ThirdPertyCredential get _value => super._value as _$_ThirdPertyCredential;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_$_ThirdPertyCredential(
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

class _$_ThirdPertyCredential implements _ThirdPertyCredential {
  const _$_ThirdPertyCredential(
      {required this.idToken, required this.accessToken});

  @override
  final String idToken;
  @override
  final String accessToken;

  @override
  String toString() {
    return 'ThirdPertyCredential(idToken: $idToken, accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThirdPertyCredential &&
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
  _$$_ThirdPertyCredentialCopyWith<_$_ThirdPertyCredential> get copyWith =>
      __$$_ThirdPertyCredentialCopyWithImpl<_$_ThirdPertyCredential>(
          this, _$identity);
}

abstract class _ThirdPertyCredential implements ThirdPertyCredential {
  const factory _ThirdPertyCredential(
      {required final String idToken,
      required final String accessToken}) = _$_ThirdPertyCredential;

  @override
  String get idToken;
  @override
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$_ThirdPertyCredentialCopyWith<_$_ThirdPertyCredential> get copyWith =>
      throw _privateConstructorUsedError;
}
