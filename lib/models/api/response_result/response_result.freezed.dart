// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'response_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResponseResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T responseData, String? message, bool success)
        success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T responseData, String? message, bool success)? success,
    TResult Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T responseData, String? message, bool success)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseResult<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResponseResult<T> value)? success,
    TResult Function(Failure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseResult<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseResultCopyWith<T, $Res> {
  factory $ResponseResultCopyWith(
          ResponseResult<T> value, $Res Function(ResponseResult<T>) then) =
      _$ResponseResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ResponseResultCopyWithImpl<T, $Res>
    implements $ResponseResultCopyWith<T, $Res> {
  _$ResponseResultCopyWithImpl(this._value, this._then);

  final ResponseResult<T> _value;
  // ignore: unused_field
  final $Res Function(ResponseResult<T>) _then;
}

/// @nodoc
abstract class _$$_ResponseResultCopyWith<T, $Res> {
  factory _$$_ResponseResultCopyWith(_$_ResponseResult<T> value,
          $Res Function(_$_ResponseResult<T>) then) =
      __$$_ResponseResultCopyWithImpl<T, $Res>;
  $Res call({T responseData, String? message, bool success});
}

/// @nodoc
class __$$_ResponseResultCopyWithImpl<T, $Res>
    extends _$ResponseResultCopyWithImpl<T, $Res>
    implements _$$_ResponseResultCopyWith<T, $Res> {
  __$$_ResponseResultCopyWithImpl(
      _$_ResponseResult<T> _value, $Res Function(_$_ResponseResult<T>) _then)
      : super(_value, (v) => _then(v as _$_ResponseResult<T>));

  @override
  _$_ResponseResult<T> get _value => super._value as _$_ResponseResult<T>;

  @override
  $Res call({
    Object? responseData = freezed,
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$_ResponseResult<T>(
      responseData: responseData == freezed
          ? _value.responseData
          : responseData // ignore: cast_nullable_to_non_nullable
              as T,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ResponseResult<T> implements _ResponseResult<T> {
  const _$_ResponseResult(
      {required this.responseData, this.message, this.success = true});

  @override
  final T responseData;
  @override
  final String? message;
  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'ResponseResult<$T>.success(responseData: $responseData, message: $message, success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseResult<T> &&
            const DeepCollectionEquality()
                .equals(other.responseData, responseData) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.success, success));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(responseData),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(success));

  @JsonKey(ignore: true)
  @override
  _$$_ResponseResultCopyWith<T, _$_ResponseResult<T>> get copyWith =>
      __$$_ResponseResultCopyWithImpl<T, _$_ResponseResult<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T responseData, String? message, bool success)
        success,
    required TResult Function(String message) failure,
  }) {
    return success(responseData, message, this.success);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T responseData, String? message, bool success)? success,
    TResult Function(String message)? failure,
  }) {
    return success?.call(responseData, message, this.success);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T responseData, String? message, bool success)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(responseData, message, this.success);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseResult<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResponseResult<T> value)? success,
    TResult Function(Failure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseResult<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ResponseResult<T> implements ResponseResult<T> {
  const factory _ResponseResult(
      {required final T responseData,
      final String? message,
      final bool success}) = _$_ResponseResult<T>;

  T get responseData;
  String? get message;
  bool get success;
  @JsonKey(ignore: true)
  _$$_ResponseResultCopyWith<T, _$_ResponseResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureCopyWith<T, $Res> {
  factory _$$FailureCopyWith(
          _$Failure<T> value, $Res Function(_$Failure<T>) then) =
      __$$FailureCopyWithImpl<T, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$FailureCopyWithImpl<T, $Res>
    extends _$ResponseResultCopyWithImpl<T, $Res>
    implements _$$FailureCopyWith<T, $Res> {
  __$$FailureCopyWithImpl(
      _$Failure<T> _value, $Res Function(_$Failure<T>) _then)
      : super(_value, (v) => _then(v as _$Failure<T>));

  @override
  _$Failure<T> get _value => super._value as _$Failure<T>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$Failure<T>(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Failure<T> implements Failure<T> {
  const _$Failure({this.message = 'サーバーとの通信に失敗しました。'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ResponseResult<$T>.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failure<T> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$FailureCopyWith<T, _$Failure<T>> get copyWith =>
      __$$FailureCopyWithImpl<T, _$Failure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T responseData, String? message, bool success)
        success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T responseData, String? message, bool success)? success,
    TResult Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T responseData, String? message, bool success)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponseResult<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResponseResult<T> value)? success,
    TResult Function(Failure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponseResult<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T> implements ResponseResult<T> {
  const factory Failure({final String message}) = _$Failure<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureCopyWith<T, _$Failure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
