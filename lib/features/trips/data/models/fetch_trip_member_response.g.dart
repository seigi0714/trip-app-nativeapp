// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'fetch_trip_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchTripMemberResponse _$$_FetchTripMemberResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_FetchTripMemberResponse',
      json,
      ($checkedConvert) {
        final val = _$_FetchTripMemberResponse(
          isHost: $checkedConvert('is_host', (v) => v as bool),
          user: $checkedConvert('user',
              (v) => GetUserResponse.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'isHost': 'is_host'},
    );

Map<String, dynamic> _$$_FetchTripMemberResponseToJson(
        _$_FetchTripMemberResponse instance) =>
    <String, dynamic>{
      'is_host': instance.isHost,
      'user': instance.user,
    };
