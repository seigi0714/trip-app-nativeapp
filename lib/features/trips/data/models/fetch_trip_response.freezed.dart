// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchTripResponse _$FetchTripResponseFromJson(Map<String, dynamic> json) {
  return _FetchTripResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchTripResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<FetchTripMemberResponse> get members =>
      throw _privateConstructorUsedError;
  @DateConverter()
  DateTime get fromDate => throw _privateConstructorUsedError;
  @DateConverter()
  DateTime get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchTripResponseCopyWith<FetchTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchTripResponseCopyWith<$Res> {
  factory $FetchTripResponseCopyWith(
          FetchTripResponse value, $Res Function(FetchTripResponse) then) =
      _$FetchTripResponseCopyWithImpl<$Res, FetchTripResponse>;
  @useResult
  $Res call(
      {int id,
      String name,
      List<FetchTripMemberResponse> members,
      @DateConverter() DateTime fromDate,
      @DateConverter() DateTime endDate});
}

/// @nodoc
class _$FetchTripResponseCopyWithImpl<$Res, $Val extends FetchTripResponse>
    implements $FetchTripResponseCopyWith<$Res> {
  _$FetchTripResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? members = null,
    Object? fromDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<FetchTripMemberResponse>,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchTripResponseCopyWith<$Res>
    implements $FetchTripResponseCopyWith<$Res> {
  factory _$$_FetchTripResponseCopyWith(_$_FetchTripResponse value,
          $Res Function(_$_FetchTripResponse) then) =
      __$$_FetchTripResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      List<FetchTripMemberResponse> members,
      @DateConverter() DateTime fromDate,
      @DateConverter() DateTime endDate});
}

/// @nodoc
class __$$_FetchTripResponseCopyWithImpl<$Res>
    extends _$FetchTripResponseCopyWithImpl<$Res, _$_FetchTripResponse>
    implements _$$_FetchTripResponseCopyWith<$Res> {
  __$$_FetchTripResponseCopyWithImpl(
      _$_FetchTripResponse _value, $Res Function(_$_FetchTripResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? members = null,
    Object? fromDate = null,
    Object? endDate = null,
  }) {
    return _then(_$_FetchTripResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<FetchTripMemberResponse>,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchTripResponse implements _FetchTripResponse {
  const _$_FetchTripResponse(
      {required this.id,
      required this.name,
      required final List<FetchTripMemberResponse> members,
      @DateConverter() required this.fromDate,
      @DateConverter() required this.endDate})
      : _members = members;

  factory _$_FetchTripResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchTripResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<FetchTripMemberResponse> _members;
  @override
  List<FetchTripMemberResponse> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @DateConverter()
  final DateTime fromDate;
  @override
  @DateConverter()
  final DateTime endDate;

  @override
  String toString() {
    return 'FetchTripResponse(id: $id, name: $name, members: $members, fromDate: $fromDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchTripResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_members), fromDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchTripResponseCopyWith<_$_FetchTripResponse> get copyWith =>
      __$$_FetchTripResponseCopyWithImpl<_$_FetchTripResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchTripResponseToJson(
      this,
    );
  }
}

abstract class _FetchTripResponse implements FetchTripResponse {
  const factory _FetchTripResponse(
      {required final int id,
      required final String name,
      required final List<FetchTripMemberResponse> members,
      @DateConverter() required final DateTime fromDate,
      @DateConverter() required final DateTime endDate}) = _$_FetchTripResponse;

  factory _FetchTripResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchTripResponse.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<FetchTripMemberResponse> get members;
  @override
  @DateConverter()
  DateTime get fromDate;
  @override
  @DateConverter()
  DateTime get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_FetchTripResponseCopyWith<_$_FetchTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
