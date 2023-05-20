// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'change_check_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChangeCheckStatusResponse _$$_ChangeCheckStatusResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_ChangeCheckStatusResponse',
      json,
      ($checkedConvert) {
        final val = _$_ChangeCheckStatusResponse(
          isChecked: $checkedConvert('is_checked', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isChecked': 'is_checked'},
    );

Map<String, dynamic> _$$_ChangeCheckStatusResponseToJson(
        _$_ChangeCheckStatusResponse instance) =>
    <String, dynamic>{
      'is_checked': instance.isChecked,
    };
