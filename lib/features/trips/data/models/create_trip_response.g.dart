// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'create_trip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateTripResponse _$$_CreateTripResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_CreateTripResponse',
      json,
      ($checkedConvert) {
        final val = _$_CreateTripResponse(
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

Map<String, dynamic> _$$_CreateTripResponseToJson(
        _$_CreateTripResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'from_date': const DateConverter().toJson(instance.fromDate),
      'end_date': const DateConverter().toJson(instance.endDate),
    };
