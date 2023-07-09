// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateTripResponse _$UpdateTripResponseFromJson(Map<String, dynamic> json) {
  return _UpdateTripResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateTripResponse {
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
  $UpdateTripResponseCopyWith<UpdateTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTripResponseCopyWith<$Res> {
  factory $UpdateTripResponseCopyWith(
          UpdateTripResponse value, $Res Function(UpdateTripResponse) then) =
      _$UpdateTripResponseCopyWithImpl<$Res, UpdateTripResponse>;
  @useResult
  $Res call(
      {int id,
      String name,
      List<FetchTripMemberResponse> members,
      @DateConverter() DateTime fromDate,
      @DateConverter() DateTime endDate});
}

/// @nodoc
class _$UpdateTripResponseCopyWithImpl<$Res, $Val extends UpdateTripResponse>
    implements $UpdateTripResponseCopyWith<$Res> {
  _$UpdateTripResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_UpdateTripResponseCopyWith<$Res>
    implements $UpdateTripResponseCopyWith<$Res> {
  factory _$$_UpdateTripResponseCopyWith(_$_UpdateTripResponse value,
          $Res Function(_$_UpdateTripResponse) then) =
      __$$_UpdateTripResponseCopyWithImpl<$Res>;
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
class __$$_UpdateTripResponseCopyWithImpl<$Res>
    extends _$UpdateTripResponseCopyWithImpl<$Res, _$_UpdateTripResponse>
    implements _$$_UpdateTripResponseCopyWith<$Res> {
  __$$_UpdateTripResponseCopyWithImpl(
      _$_UpdateTripResponse _value, $Res Function(_$_UpdateTripResponse) _then)
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
    return _then(_$_UpdateTripResponse(
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
class _$_UpdateTripResponse implements _UpdateTripResponse {
  const _$_UpdateTripResponse(
      {required this.id,
      required this.name,
      required final List<FetchTripMemberResponse> members,
      @DateConverter() required this.fromDate,
      @DateConverter() required this.endDate})
      : _members = members;

  factory _$_UpdateTripResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateTripResponseFromJson(json);

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
    return 'UpdateTripResponse(id: $id, name: $name, members: $members, fromDate: $fromDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateTripResponse &&
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
  _$$_UpdateTripResponseCopyWith<_$_UpdateTripResponse> get copyWith =>
      __$$_UpdateTripResponseCopyWithImpl<_$_UpdateTripResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateTripResponseToJson(
      this,
    );
  }
}

abstract class _UpdateTripResponse implements UpdateTripResponse {
  const factory _UpdateTripResponse(
          {required final int id,
          required final String name,
          required final List<FetchTripMemberResponse> members,
          @DateConverter() required final DateTime fromDate,
          @DateConverter() required final DateTime endDate}) =
      _$_UpdateTripResponse;

  factory _UpdateTripResponse.fromJson(Map<String, dynamic> json) =
      _$_UpdateTripResponse.fromJson;

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
  _$$_UpdateTripResponseCopyWith<_$_UpdateTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
