// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateTripResponse _$CreateTripResponseFromJson(Map<String, dynamic> json) {
  return _CreateTripResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateTripResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @DateConverter()
  DateTime get fromDate => throw _privateConstructorUsedError;
  @DateConverter()
  DateTime get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTripResponseCopyWith<CreateTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTripResponseCopyWith<$Res> {
  factory $CreateTripResponseCopyWith(
          CreateTripResponse value, $Res Function(CreateTripResponse) then) =
      _$CreateTripResponseCopyWithImpl<$Res, CreateTripResponse>;
  @useResult
  $Res call(
      {int id,
      String name,
      @DateConverter() DateTime fromDate,
      @DateConverter() DateTime endDate});
}

/// @nodoc
class _$CreateTripResponseCopyWithImpl<$Res, $Val extends CreateTripResponse>
    implements $CreateTripResponseCopyWith<$Res> {
  _$CreateTripResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
abstract class _$$_CreateTripResponseCopyWith<$Res>
    implements $CreateTripResponseCopyWith<$Res> {
  factory _$$_CreateTripResponseCopyWith(_$_CreateTripResponse value,
          $Res Function(_$_CreateTripResponse) then) =
      __$$_CreateTripResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @DateConverter() DateTime fromDate,
      @DateConverter() DateTime endDate});
}

/// @nodoc
class __$$_CreateTripResponseCopyWithImpl<$Res>
    extends _$CreateTripResponseCopyWithImpl<$Res, _$_CreateTripResponse>
    implements _$$_CreateTripResponseCopyWith<$Res> {
  __$$_CreateTripResponseCopyWithImpl(
      _$_CreateTripResponse _value, $Res Function(_$_CreateTripResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fromDate = null,
    Object? endDate = null,
  }) {
    return _then(_$_CreateTripResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_CreateTripResponse implements _CreateTripResponse {
  const _$_CreateTripResponse(
      {required this.id,
      required this.name,
      @DateConverter() required this.fromDate,
      @DateConverter() required this.endDate});

  factory _$_CreateTripResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CreateTripResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @DateConverter()
  final DateTime fromDate;
  @override
  @DateConverter()
  final DateTime endDate;

  @override
  String toString() {
    return 'CreateTripResponse(id: $id, name: $name, fromDate: $fromDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTripResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, fromDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateTripResponseCopyWith<_$_CreateTripResponse> get copyWith =>
      __$$_CreateTripResponseCopyWithImpl<_$_CreateTripResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateTripResponseToJson(
      this,
    );
  }
}

abstract class _CreateTripResponse implements CreateTripResponse {
  const factory _CreateTripResponse(
          {required final int id,
          required final String name,
          @DateConverter() required final DateTime fromDate,
          @DateConverter() required final DateTime endDate}) =
      _$_CreateTripResponse;

  factory _CreateTripResponse.fromJson(Map<String, dynamic> json) =
      _$_CreateTripResponse.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @DateConverter()
  DateTime get fromDate;
  @override
  @DateConverter()
  DateTime get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTripResponseCopyWith<_$_CreateTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
