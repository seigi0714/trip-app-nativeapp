// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_trips_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchTripsResponse _$FetchTripsResponseFromJson(Map<String, dynamic> json) {
  return _FetchTripsResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchTripsResponse {
  List<FetchTripResponse> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchTripsResponseCopyWith<FetchTripsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchTripsResponseCopyWith<$Res> {
  factory $FetchTripsResponseCopyWith(
          FetchTripsResponse value, $Res Function(FetchTripsResponse) then) =
      _$FetchTripsResponseCopyWithImpl<$Res, FetchTripsResponse>;
  @useResult
  $Res call({List<FetchTripResponse> items});
}

/// @nodoc
class _$FetchTripsResponseCopyWithImpl<$Res, $Val extends FetchTripsResponse>
    implements $FetchTripsResponseCopyWith<$Res> {
  _$FetchTripsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FetchTripResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchTripsResponseCopyWith<$Res>
    implements $FetchTripsResponseCopyWith<$Res> {
  factory _$$_FetchTripsResponseCopyWith(_$_FetchTripsResponse value,
          $Res Function(_$_FetchTripsResponse) then) =
      __$$_FetchTripsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FetchTripResponse> items});
}

/// @nodoc
class __$$_FetchTripsResponseCopyWithImpl<$Res>
    extends _$FetchTripsResponseCopyWithImpl<$Res, _$_FetchTripsResponse>
    implements _$$_FetchTripsResponseCopyWith<$Res> {
  __$$_FetchTripsResponseCopyWithImpl(
      _$_FetchTripsResponse _value, $Res Function(_$_FetchTripsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_FetchTripsResponse(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FetchTripResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchTripsResponse implements _FetchTripsResponse {
  const _$_FetchTripsResponse({final List<FetchTripResponse> items = const []})
      : _items = items;

  factory _$_FetchTripsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchTripsResponseFromJson(json);

  final List<FetchTripResponse> _items;
  @override
  @JsonKey()
  List<FetchTripResponse> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'FetchTripsResponse(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchTripsResponse &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchTripsResponseCopyWith<_$_FetchTripsResponse> get copyWith =>
      __$$_FetchTripsResponseCopyWithImpl<_$_FetchTripsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchTripsResponseToJson(
      this,
    );
  }
}

abstract class _FetchTripsResponse implements FetchTripsResponse {
  const factory _FetchTripsResponse({final List<FetchTripResponse> items}) =
      _$_FetchTripsResponse;

  factory _FetchTripsResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchTripsResponse.fromJson;

  @override
  List<FetchTripResponse> get items;
  @override
  @JsonKey(ignore: true)
  _$$_FetchTripsResponseCopyWith<_$_FetchTripsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
