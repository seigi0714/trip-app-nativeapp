// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'trip_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripMember _$$_TripMemberFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_TripMember',
      json,
      ($checkedConvert) {
        final val = _$_TripMember(
          member: $checkedConvert(
              'member', (v) => AppUser.fromJson(v as Map<String, dynamic>)),
          isHost: $checkedConvert('is_host', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isHost': 'is_host'},
    );

Map<String, dynamic> _$$_TripMemberToJson(_$_TripMember instance) =>
    <String, dynamic>{
      'member': instance.member,
      'is_host': instance.isHost,
    };
