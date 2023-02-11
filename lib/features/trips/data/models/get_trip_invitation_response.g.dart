// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'get_trip_invitation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetTripInvitationResponse _$$_GetTripInvitationResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_GetTripInvitationResponse',
      json,
      ($checkedConvert) {
        final val = _$_GetTripInvitationResponse(
          invitationCode:
              $checkedConvert('invitation_code', (v) => v as String),
          invitationNum: $checkedConvert('invitation_num', (v) => v as int),
          trip: $checkedConvert(
              'trip', (v) => TripItem.fromJson(v as Map<String, dynamic>)),
          invitationUser: $checkedConvert('invitation_user',
              (v) => InvitationUserItem.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'invitationCode': 'invitation_code',
        'invitationNum': 'invitation_num',
        'invitationUser': 'invitation_user'
      },
    );

Map<String, dynamic> _$$_GetTripInvitationResponseToJson(
        _$_GetTripInvitationResponse instance) =>
    <String, dynamic>{
      'invitation_code': instance.invitationCode,
      'invitation_num': instance.invitationNum,
      'trip': instance.trip,
      'invitation_user': instance.invitationUser,
    };

_$_InvitationUserItem _$$_InvitationUserItemFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_InvitationUserItem',
      json,
      ($checkedConvert) {
        final val = _$_InvitationUserItem(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_InvitationUserItemToJson(
        _$_InvitationUserItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_TripItem _$$_TripItemFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_TripItem',
      json,
      ($checkedConvert) {
        final val = _$_TripItem(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_TripItemToJson(_$_TripItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
