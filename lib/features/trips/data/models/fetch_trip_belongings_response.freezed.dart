// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_trip_belongings_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchTripBelongingsResponse _$FetchTripBelongingsResponseFromJson(
    Map<String, dynamic> json) {
  return _FetchTripBelongingsResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchTripBelongingsResponse {
  List<TripBelongingResponse> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchTripBelongingsResponseCopyWith<FetchTripBelongingsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchTripBelongingsResponseCopyWith<$Res> {
  factory $FetchTripBelongingsResponseCopyWith(
          FetchTripBelongingsResponse value,
          $Res Function(FetchTripBelongingsResponse) then) =
      _$FetchTripBelongingsResponseCopyWithImpl<$Res,
          FetchTripBelongingsResponse>;
  @useResult
  $Res call({List<TripBelongingResponse> items});
}

/// @nodoc
class _$FetchTripBelongingsResponseCopyWithImpl<$Res,
        $Val extends FetchTripBelongingsResponse>
    implements $FetchTripBelongingsResponseCopyWith<$Res> {
  _$FetchTripBelongingsResponseCopyWithImpl(this._value, this._then);

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
              as List<TripBelongingResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchTripBelongingsResponseCopyWith<$Res>
    implements $FetchTripBelongingsResponseCopyWith<$Res> {
  factory _$$_FetchTripBelongingsResponseCopyWith(
          _$_FetchTripBelongingsResponse value,
          $Res Function(_$_FetchTripBelongingsResponse) then) =
      __$$_FetchTripBelongingsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TripBelongingResponse> items});
}

/// @nodoc
class __$$_FetchTripBelongingsResponseCopyWithImpl<$Res>
    extends _$FetchTripBelongingsResponseCopyWithImpl<$Res,
        _$_FetchTripBelongingsResponse>
    implements _$$_FetchTripBelongingsResponseCopyWith<$Res> {
  __$$_FetchTripBelongingsResponseCopyWithImpl(
      _$_FetchTripBelongingsResponse _value,
      $Res Function(_$_FetchTripBelongingsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_FetchTripBelongingsResponse(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TripBelongingResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchTripBelongingsResponse implements _FetchTripBelongingsResponse {
  const _$_FetchTripBelongingsResponse(
      {required final List<TripBelongingResponse> items})
      : _items = items;

  factory _$_FetchTripBelongingsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchTripBelongingsResponseFromJson(json);

  final List<TripBelongingResponse> _items;
  @override
  List<TripBelongingResponse> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'FetchTripBelongingsResponse(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchTripBelongingsResponse &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchTripBelongingsResponseCopyWith<_$_FetchTripBelongingsResponse>
      get copyWith => __$$_FetchTripBelongingsResponseCopyWithImpl<
          _$_FetchTripBelongingsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchTripBelongingsResponseToJson(
      this,
    );
  }
}

abstract class _FetchTripBelongingsResponse
    implements FetchTripBelongingsResponse {
  const factory _FetchTripBelongingsResponse(
          {required final List<TripBelongingResponse> items}) =
      _$_FetchTripBelongingsResponse;

  factory _FetchTripBelongingsResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchTripBelongingsResponse.fromJson;

  @override
  List<TripBelongingResponse> get items;
  @override
  @JsonKey(ignore: true)
  _$$_FetchTripBelongingsResponseCopyWith<_$_FetchTripBelongingsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
