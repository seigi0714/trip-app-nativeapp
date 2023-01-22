// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'invite_trip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InviteTripResponse _$$_InviteTripResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_InviteTripResponse',
      json,
      ($checkedConvert) {
        final val = _$_InviteTripResponse(
          invitationCode:
              $checkedConvert('invitation_code', (v) => v as String),
          invitationNum: $checkedConvert('invitation_num', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {
        'invitationCode': 'invitation_code',
        'invitationNum': 'invitation_num'
      },
    );

Map<String, dynamic> _$$_InviteTripResponseToJson(
        _$_InviteTripResponse instance) =>
    <String, dynamic>{
      'invitation_code': instance.invitationCode,
      'invitation_num': instance.invitationNum,
    };
