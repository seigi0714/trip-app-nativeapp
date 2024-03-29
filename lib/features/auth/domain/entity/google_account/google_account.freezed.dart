// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$GoogleAccountCopyWithImpl<$Res, GoogleAccount>;
  @useResult
  $Res call({String displayName, ThirdPartyCredential credential});

  $ThirdPartyCredentialCopyWith<$Res> get credential;
}

/// @nodoc
class _$GoogleAccountCopyWithImpl<$Res, $Val extends GoogleAccount>
    implements $GoogleAccountCopyWith<$Res> {
  _$GoogleAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? credential = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      credential: null == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as ThirdPartyCredential,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThirdPartyCredentialCopyWith<$Res> get credential {
    return $ThirdPartyCredentialCopyWith<$Res>(_value.credential, (value) {
      return _then(_value.copyWith(credential: value) as $Val);
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
  @useResult
  $Res call({String displayName, ThirdPartyCredential credential});

  @override
  $ThirdPartyCredentialCopyWith<$Res> get credential;
}

/// @nodoc
class __$$_GoogleAccountCopyWithImpl<$Res>
    extends _$GoogleAccountCopyWithImpl<$Res, _$_GoogleAccount>
    implements _$$_GoogleAccountCopyWith<$Res> {
  __$$_GoogleAccountCopyWithImpl(
      _$_GoogleAccount _value, $Res Function(_$_GoogleAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? credential = null,
  }) {
    return _then(_$_GoogleAccount(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      credential: null == credential
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
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.credential, credential) ||
                other.credential == credential));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayName, credential);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
