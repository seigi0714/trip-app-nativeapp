// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'fetch_trip_belongings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchTripBelongingsResponse _$$_FetchTripBelongingsResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_FetchTripBelongingsResponse',
      json,
      ($checkedConvert) {
        final val = _$_FetchTripBelongingsResponse(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      TripBelongingResponse.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_FetchTripBelongingsResponseToJson(
        _$_FetchTripBelongingsResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
