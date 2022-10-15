// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'oidc_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OidcInfo {
  String get idToken => throw _privateConstructorUsedError;
  String get nonce => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OidcInfoCopyWith<OidcInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OidcInfoCopyWith<$Res> {
  factory $OidcInfoCopyWith(OidcInfo value, $Res Function(OidcInfo) then) =
      _$OidcInfoCopyWithImpl<$Res>;
  $Res call({String idToken, String nonce});
}

/// @nodoc
class _$OidcInfoCopyWithImpl<$Res> implements $OidcInfoCopyWith<$Res> {
  _$OidcInfoCopyWithImpl(this._value, this._then);

  final OidcInfo _value;
  // ignore: unused_field
  final $Res Function(OidcInfo) _then;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? nonce = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      nonce: nonce == freezed
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OidcInfoCopyWith<$Res> implements $OidcInfoCopyWith<$Res> {
  factory _$$_OidcInfoCopyWith(
          _$_OidcInfo value, $Res Function(_$_OidcInfo) then) =
      __$$_OidcInfoCopyWithImpl<$Res>;
  @override
  $Res call({String idToken, String nonce});
}

/// @nodoc
class __$$_OidcInfoCopyWithImpl<$Res> extends _$OidcInfoCopyWithImpl<$Res>
    implements _$$_OidcInfoCopyWith<$Res> {
  __$$_OidcInfoCopyWithImpl(
      _$_OidcInfo _value, $Res Function(_$_OidcInfo) _then)
      : super(_value, (v) => _then(v as _$_OidcInfo));

  @override
  _$_OidcInfo get _value => super._value as _$_OidcInfo;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? nonce = freezed,
  }) {
    return _then(_$_OidcInfo(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      nonce: nonce == freezed
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OidcInfo implements _OidcInfo {
  const _$_OidcInfo({required this.idToken, required this.nonce});

  @override
  final String idToken;
  @override
  final String nonce;

  @override
  String toString() {
    return 'OidcInfo(idToken: $idToken, nonce: $nonce)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OidcInfo &&
            const DeepCollectionEquality().equals(other.idToken, idToken) &&
            const DeepCollectionEquality().equals(other.nonce, nonce));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idToken),
      const DeepCollectionEquality().hash(nonce));

  @JsonKey(ignore: true)
  @override
  _$$_OidcInfoCopyWith<_$_OidcInfo> get copyWith =>
      __$$_OidcInfoCopyWithImpl<_$_OidcInfo>(this, _$identity);
}

abstract class _OidcInfo implements OidcInfo {
  const factory _OidcInfo(
      {required final String idToken,
      required final String nonce}) = _$_OidcInfo;

  @override
  String get idToken;
  @override
  String get nonce;
  @override
  @JsonKey(ignore: true)
  _$$_OidcInfoCopyWith<_$_OidcInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
