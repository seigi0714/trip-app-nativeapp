// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponse _$$_ApiResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_ApiResponse',
      json,
      ($checkedConvert) {
        final val = _$_ApiResponse(
          data:
              $checkedConvert('data', (v) => const DataConverter().fromJson(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_ApiResponseToJson(_$_ApiResponse instance) =>
    <String, dynamic>{
      'data': const DataConverter().toJson(instance.data),
    };
