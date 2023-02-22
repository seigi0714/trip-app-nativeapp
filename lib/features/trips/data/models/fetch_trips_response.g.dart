// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'fetch_trips_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchTripsResponse _$$_FetchTripsResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_FetchTripsResponse',
      json,
      ($checkedConvert) {
        final val = _$_FetchTripsResponse(
          items: $checkedConvert(
              'items',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          FetchTripResponse.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_FetchTripsResponseToJson(
        _$_FetchTripsResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
