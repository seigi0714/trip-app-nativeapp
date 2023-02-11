// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_trip_invitation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetTripInvitationResponse _$GetTripInvitationResponseFromJson(
    Map<String, dynamic> json) {
  return _GetTripInvitationResponse.fromJson(json);
}

/// @nodoc
mixin _$GetTripInvitationResponse {
  String get invitationCode => throw _privateConstructorUsedError;
  int get invitationNum => throw _privateConstructorUsedError;
  TripItem get trip => throw _privateConstructorUsedError;
  InvitationUserItem get invitationUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetTripInvitationResponseCopyWith<GetTripInvitationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTripInvitationResponseCopyWith<$Res> {
  factory $GetTripInvitationResponseCopyWith(GetTripInvitationResponse value,
          $Res Function(GetTripInvitationResponse) then) =
      _$GetTripInvitationResponseCopyWithImpl<$Res, GetTripInvitationResponse>;
  @useResult
  $Res call(
      {String invitationCode,
      int invitationNum,
      TripItem trip,
      InvitationUserItem invitationUser});

  $TripItemCopyWith<$Res> get trip;
  $InvitationUserItemCopyWith<$Res> get invitationUser;
}

/// @nodoc
class _$GetTripInvitationResponseCopyWithImpl<$Res,
        $Val extends GetTripInvitationResponse>
    implements $GetTripInvitationResponseCopyWith<$Res> {
  _$GetTripInvitationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationCode = null,
    Object? invitationNum = null,
    Object? trip = null,
    Object? invitationUser = null,
  }) {
    return _then(_value.copyWith(
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String,
      invitationNum: null == invitationNum
          ? _value.invitationNum
          : invitationNum // ignore: cast_nullable_to_non_nullable
              as int,
      trip: null == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as TripItem,
      invitationUser: null == invitationUser
          ? _value.invitationUser
          : invitationUser // ignore: cast_nullable_to_non_nullable
              as InvitationUserItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TripItemCopyWith<$Res> get trip {
    return $TripItemCopyWith<$Res>(_value.trip, (value) {
      return _then(_value.copyWith(trip: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InvitationUserItemCopyWith<$Res> get invitationUser {
    return $InvitationUserItemCopyWith<$Res>(_value.invitationUser, (value) {
      return _then(_value.copyWith(invitationUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GetTripInvitationResponseCopyWith<$Res>
    implements $GetTripInvitationResponseCopyWith<$Res> {
  factory _$$_GetTripInvitationResponseCopyWith(
          _$_GetTripInvitationResponse value,
          $Res Function(_$_GetTripInvitationResponse) then) =
      __$$_GetTripInvitationResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String invitationCode,
      int invitationNum,
      TripItem trip,
      InvitationUserItem invitationUser});

  @override
  $TripItemCopyWith<$Res> get trip;
  @override
  $InvitationUserItemCopyWith<$Res> get invitationUser;
}

/// @nodoc
class __$$_GetTripInvitationResponseCopyWithImpl<$Res>
    extends _$GetTripInvitationResponseCopyWithImpl<$Res,
        _$_GetTripInvitationResponse>
    implements _$$_GetTripInvitationResponseCopyWith<$Res> {
  __$$_GetTripInvitationResponseCopyWithImpl(
      _$_GetTripInvitationResponse _value,
      $Res Function(_$_GetTripInvitationResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationCode = null,
    Object? invitationNum = null,
    Object? trip = null,
    Object? invitationUser = null,
  }) {
    return _then(_$_GetTripInvitationResponse(
      invitationCode: null == invitationCode
          ? _value.invitationCode
          : invitationCode // ignore: cast_nullable_to_non_nullable
              as String,
      invitationNum: null == invitationNum
          ? _value.invitationNum
          : invitationNum // ignore: cast_nullable_to_non_nullable
              as int,
      trip: null == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as TripItem,
      invitationUser: null == invitationUser
          ? _value.invitationUser
          : invitationUser // ignore: cast_nullable_to_non_nullable
              as InvitationUserItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetTripInvitationResponse implements _GetTripInvitationResponse {
  const _$_GetTripInvitationResponse(
      {required this.invitationCode,
      required this.invitationNum,
      required this.trip,
      required this.invitationUser});

  factory _$_GetTripInvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetTripInvitationResponseFromJson(json);

  @override
  final String invitationCode;
  @override
  final int invitationNum;
  @override
  final TripItem trip;
  @override
  final InvitationUserItem invitationUser;

  @override
  String toString() {
    return 'GetTripInvitationResponse(invitationCode: $invitationCode, invitationNum: $invitationNum, trip: $trip, invitationUser: $invitationUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTripInvitationResponse &&
            (identical(other.invitationCode, invitationCode) ||
                other.invitationCode == invitationCode) &&
            (identical(other.invitationNum, invitationNum) ||
                other.invitationNum == invitationNum) &&
            (identical(other.trip, trip) || other.trip == trip) &&
            (identical(other.invitationUser, invitationUser) ||
                other.invitationUser == invitationUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, invitationCode, invitationNum, trip, invitationUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetTripInvitationResponseCopyWith<_$_GetTripInvitationResponse>
      get copyWith => __$$_GetTripInvitationResponseCopyWithImpl<
          _$_GetTripInvitationResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetTripInvitationResponseToJson(
      this,
    );
  }
}

abstract class _GetTripInvitationResponse implements GetTripInvitationResponse {
  const factory _GetTripInvitationResponse(
          {required final String invitationCode,
          required final int invitationNum,
          required final TripItem trip,
          required final InvitationUserItem invitationUser}) =
      _$_GetTripInvitationResponse;

  factory _GetTripInvitationResponse.fromJson(Map<String, dynamic> json) =
      _$_GetTripInvitationResponse.fromJson;

  @override
  String get invitationCode;
  @override
  int get invitationNum;
  @override
  TripItem get trip;
  @override
  InvitationUserItem get invitationUser;
  @override
  @JsonKey(ignore: true)
  _$$_GetTripInvitationResponseCopyWith<_$_GetTripInvitationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

InvitationUserItem _$InvitationUserItemFromJson(Map<String, dynamic> json) {
  return _InvitationUserItem.fromJson(json);
}

/// @nodoc
mixin _$InvitationUserItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvitationUserItemCopyWith<InvitationUserItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationUserItemCopyWith<$Res> {
  factory $InvitationUserItemCopyWith(
          InvitationUserItem value, $Res Function(InvitationUserItem) then) =
      _$InvitationUserItemCopyWithImpl<$Res, InvitationUserItem>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$InvitationUserItemCopyWithImpl<$Res, $Val extends InvitationUserItem>
    implements $InvitationUserItemCopyWith<$Res> {
  _$InvitationUserItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvitationUserItemCopyWith<$Res>
    implements $InvitationUserItemCopyWith<$Res> {
  factory _$$_InvitationUserItemCopyWith(_$_InvitationUserItem value,
          $Res Function(_$_InvitationUserItem) then) =
      __$$_InvitationUserItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$_InvitationUserItemCopyWithImpl<$Res>
    extends _$InvitationUserItemCopyWithImpl<$Res, _$_InvitationUserItem>
    implements _$$_InvitationUserItemCopyWith<$Res> {
  __$$_InvitationUserItemCopyWithImpl(
      _$_InvitationUserItem _value, $Res Function(_$_InvitationUserItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_InvitationUserItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvitationUserItem implements _InvitationUserItem {
  const _$_InvitationUserItem({required this.id, required this.name});

  factory _$_InvitationUserItem.fromJson(Map<String, dynamic> json) =>
      _$$_InvitationUserItemFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'InvitationUserItem(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvitationUserItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvitationUserItemCopyWith<_$_InvitationUserItem> get copyWith =>
      __$$_InvitationUserItemCopyWithImpl<_$_InvitationUserItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvitationUserItemToJson(
      this,
    );
  }
}

abstract class _InvitationUserItem implements InvitationUserItem {
  const factory _InvitationUserItem(
      {required final int id,
      required final String name}) = _$_InvitationUserItem;

  factory _InvitationUserItem.fromJson(Map<String, dynamic> json) =
      _$_InvitationUserItem.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_InvitationUserItemCopyWith<_$_InvitationUserItem> get copyWith =>
      throw _privateConstructorUsedError;
}

TripItem _$TripItemFromJson(Map<String, dynamic> json) {
  return _TripItem.fromJson(json);
}

/// @nodoc
mixin _$TripItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @DateConverter()
  DateTime get fromDate => throw _privateConstructorUsedError;
  @DateConverter()
  DateTime get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripItemCopyWith<TripItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripItemCopyWith<$Res> {
  factory $TripItemCopyWith(TripItem value, $Res Function(TripItem) then) =
      _$TripItemCopyWithImpl<$Res, TripItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      @DateConverter() DateTime fromDate,
      @DateConverter() DateTime endDate});
}

/// @nodoc
class _$TripItemCopyWithImpl<$Res, $Val extends TripItem>
    implements $TripItemCopyWith<$Res> {
  _$TripItemCopyWithImpl(this._value, this._then);

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
abstract class _$$_TripItemCopyWith<$Res> implements $TripItemCopyWith<$Res> {
  factory _$$_TripItemCopyWith(
          _$_TripItem value, $Res Function(_$_TripItem) then) =
      __$$_TripItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @DateConverter() DateTime fromDate,
      @DateConverter() DateTime endDate});
}

/// @nodoc
class __$$_TripItemCopyWithImpl<$Res>
    extends _$TripItemCopyWithImpl<$Res, _$_TripItem>
    implements _$$_TripItemCopyWith<$Res> {
  __$$_TripItemCopyWithImpl(
      _$_TripItem _value, $Res Function(_$_TripItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fromDate = null,
    Object? endDate = null,
  }) {
    return _then(_$_TripItem(
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
class _$_TripItem implements _TripItem {
  const _$_TripItem(
      {required this.id,
      required this.name,
      @DateConverter() required this.fromDate,
      @DateConverter() required this.endDate});

  factory _$_TripItem.fromJson(Map<String, dynamic> json) =>
      _$$_TripItemFromJson(json);

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
    return 'TripItem(id: $id, name: $name, fromDate: $fromDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripItem &&
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
  _$$_TripItemCopyWith<_$_TripItem> get copyWith =>
      __$$_TripItemCopyWithImpl<_$_TripItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripItemToJson(
      this,
    );
  }
}

abstract class _TripItem implements TripItem {
  const factory _TripItem(
      {required final int id,
      required final String name,
      @DateConverter() required final DateTime fromDate,
      @DateConverter() required final DateTime endDate}) = _$_TripItem;

  factory _TripItem.fromJson(Map<String, dynamic> json) = _$_TripItem.fromJson;

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
  _$$_TripItemCopyWith<_$_TripItem> get copyWith =>
      throw _privateConstructorUsedError;
}
