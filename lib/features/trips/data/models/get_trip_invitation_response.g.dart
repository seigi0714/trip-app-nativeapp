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
          inviteCode: $checkedConvert('invite_code', (v) => v as String),
          inviteNum: $checkedConvert('invite_num', (v) => v as int),
          inviteStatus: $checkedConvert('invite_status', (v) => v as String),
          expiredAt: $checkedConvert('expired_at',
              (v) => const DateTimeConverter().fromJson(v as String)),
          trip: $checkedConvert(
              'trip', (v) => TripItem.fromJson(v as Map<String, dynamic>)),
          invitationUser: $checkedConvert('invitation_user',
              (v) => InvitationUserItem.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'inviteCode': 'invite_code',
        'inviteNum': 'invite_num',
        'inviteStatus': 'invite_status',
        'expiredAt': 'expired_at',
        'invitationUser': 'invitation_user'
      },
    );

Map<String, dynamic> _$$_GetTripInvitationResponseToJson(
        _$_GetTripInvitationResponse instance) =>
    <String, dynamic>{
      'invite_code': instance.inviteCode,
      'invite_num': instance.inviteNum,
      'invite_status': instance.inviteStatus,
      'expired_at': const DateTimeConverter().toJson(instance.expiredAt),
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
          fromDate: $checkedConvert(
              'from_date', (v) => const DateConverter().fromJson(v as String)),
          endDate: $checkedConvert(
              'end_date', (v) => const DateConverter().fromJson(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'fromDate': 'from_date', 'endDate': 'end_date'},
    );

Map<String, dynamic> _$$_TripItemToJson(_$_TripItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'from_date': const DateConverter().toJson(instance.fromDate),
      'end_date': const DateConverter().toJson(instance.endDate),
    };
