// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'google_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleAccount {
  String get displayName => throw _privateConstructorUsedError;
  ThirdPartyCredential get credential => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleAccountCopyWith<GoogleAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleAccountCopyWith<$Res> {
  factory $GoogleAccountCopyWith(
          GoogleAccount value, $Res Function(GoogleAccount) then) =
      _$GoogleAccountCopyWithImpl<$Res>;
  $Res call({String displayName, ThirdPartyCredential credential});

  $ThirdPartyCredentialCopyWith<$Res> get credential;
}

/// @nodoc
class _$GoogleAccountCopyWithImpl<$Res>
    implements $GoogleAccountCopyWith<$Res> {
  _$GoogleAccountCopyWithImpl(this._value, this._then);

  final GoogleAccount _value;
  // ignore: unused_field
  final $Res Function(GoogleAccount) _then;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? credential = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as ThirdPartyCredential,
    ));
  }

  @override
  $ThirdPartyCredentialCopyWith<$Res> get credential {
    return $ThirdPartyCredentialCopyWith<$Res>(_value.credential, (value) {
      return _then(_value.copyWith(credential: value));
    });
  }
}

/// @nodoc
abstract class _$$_GoogleAccountCopyWith<$Res>
    implements $GoogleAccountCopyWith<$Res> {
  factory _$$_GoogleAccountCopyWith(
          _$_GoogleAccount value, $Res Function(_$_GoogleAccount) then) =
      __$$_GoogleAccountCopyWithImpl<$Res>;
  @override
  $Res call({String displayName, ThirdPartyCredential credential});

  @override
  $ThirdPartyCredentialCopyWith<$Res> get credential;
}

/// @nodoc
class __$$_GoogleAccountCopyWithImpl<$Res>
    extends _$GoogleAccountCopyWithImpl<$Res>
    implements _$$_GoogleAccountCopyWith<$Res> {
  __$$_GoogleAccountCopyWithImpl(
      _$_GoogleAccount _value, $Res Function(_$_GoogleAccount) _then)
      : super(_value, (v) => _then(v as _$_GoogleAccount));

  @override
  _$_GoogleAccount get _value => super._value as _$_GoogleAccount;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? credential = freezed,
  }) {
    return _then(_$_GoogleAccount(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as ThirdPartyCredential,
    ));
  }
}

/// @nodoc

class _$_GoogleAccount implements _GoogleAccount {
  const _$_GoogleAccount({required this.displayName, required this.credential});

  @override
  final String displayName;
  @override
  final ThirdPartyCredential credential;

  @override
  String toString() {
    return 'GoogleAccount(displayName: $displayName, credential: $credential)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleAccount &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality()
                .equals(other.credential, credential));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(credential));

  @JsonKey(ignore: true)
  @override
  _$$_GoogleAccountCopyWith<_$_GoogleAccount> get copyWith =>
      __$$_GoogleAccountCopyWithImpl<_$_GoogleAccount>(this, _$identity);
}

abstract class _GoogleAccount implements GoogleAccount {
  const factory _GoogleAccount(
      {required final String displayName,
      required final ThirdPartyCredential credential}) = _$_GoogleAccount;

  @override
  String get displayName;
  @override
  ThirdPartyCredential get credential;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleAccountCopyWith<_$_GoogleAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
