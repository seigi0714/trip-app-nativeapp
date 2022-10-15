// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostLoginResponse _$$_PostLoginResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_PostLoginResponse',
      json,
      ($checkedConvert) {
        final val = _$_PostLoginResponse(
          customToken: $checkedConvert('custom_token', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'customToken': 'custom_token'},
    );

Map<String, dynamic> _$$_PostLoginResponseToJson(
        _$_PostLoginResponse instance) =>
    <String, dynamic>{
      'custom_token': instance.customToken,
    };
