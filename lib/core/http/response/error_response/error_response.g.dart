// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorResponse _$$_ErrorResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_ErrorResponse',
      json,
      ($checkedConvert) {
        final val = _$_ErrorResponse(
          errorCode: $checkedConvert('error_code', (v) => v as String? ?? ''),
          errorDescription:
              $checkedConvert('error_description', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'errorCode': 'error_code',
        'errorDescription': 'error_description'
      },
    );

Map<String, dynamic> _$$_ErrorResponseToJson(_$_ErrorResponse instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_description': instance.errorDescription,
    };
