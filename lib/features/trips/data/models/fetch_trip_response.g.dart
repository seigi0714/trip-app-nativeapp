// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'fetch_trip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchTripResponse _$$_FetchTripResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_FetchTripResponse',
      json,
      ($checkedConvert) {
        final val = _$_FetchTripResponse(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          members: $checkedConvert(
              'members',
              (v) => (v as List<dynamic>)
                  .map((e) => FetchTripMemberResponse.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          fromDate: $checkedConvert(
              'from_date', (v) => const DateConverter().fromJson(v as String)),
          endDate: $checkedConvert(
              'end_date', (v) => const DateConverter().fromJson(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'fromDate': 'from_date', 'endDate': 'end_date'},
    );

Map<String, dynamic> _$$_FetchTripResponseToJson(
        _$_FetchTripResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'members': instance.members,
      'from_date': const DateConverter().toJson(instance.fromDate),
      'end_date': const DateConverter().toJson(instance.endDate),
    };
