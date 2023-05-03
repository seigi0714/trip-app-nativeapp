// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'trip_belonging_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripBelongingResponse _$$_TripBelongingResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_TripBelongingResponse',
      json,
      ($checkedConvert) {
        final val = _$_TripBelongingResponse(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          numOf: $checkedConvert('num_of', (v) => v as int),
          isShareAmongMember:
              $checkedConvert('is_share_among_member', (v) => v as bool),
          isChecked: $checkedConvert('is_checked', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'numOf': 'num_of',
        'isShareAmongMember': 'is_share_among_member',
        'isChecked': 'is_checked'
      },
    );

Map<String, dynamic> _$$_TripBelongingResponseToJson(
        _$_TripBelongingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'num_of': instance.numOf,
      'is_share_among_member': instance.isShareAmongMember,
      'is_checked': instance.isChecked,
    };
