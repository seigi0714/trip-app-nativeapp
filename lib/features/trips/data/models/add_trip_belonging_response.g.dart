// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'add_trip_belonging_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddTripBelongingResponse _$$_AddTripBelongingResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_AddTripBelongingResponse',
      json,
      ($checkedConvert) {
        final val = _$_AddTripBelongingResponse(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          numOf: $checkedConvert('num_of', (v) => v as int),
          isSharedAmongMember:
              $checkedConvert('is_shared_among_member', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {
        'numOf': 'num_of',
        'isSharedAmongMember': 'is_shared_among_member'
      },
    );

Map<String, dynamic> _$$_AddTripBelongingResponseToJson(
        _$_AddTripBelongingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'num_of': instance.numOf,
      'is_shared_among_member': instance.isSharedAmongMember,
    };
