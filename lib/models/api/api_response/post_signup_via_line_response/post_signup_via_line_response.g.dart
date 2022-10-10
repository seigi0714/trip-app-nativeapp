// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_signup_via_line_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostSignupViaLineResponse _$$_PostSignupViaLineResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_PostSignupViaLineResponse',
      json,
      ($checkedConvert) {
        final val = _$_PostSignupViaLineResponse(
          customToken: $checkedConvert('custom_token', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'customToken': 'custom_token'},
    );

Map<String, dynamic> _$$_PostSignupViaLineResponseToJson(
        _$_PostSignupViaLineResponse instance) =>
    <String, dynamic>{
      'custom_token': instance.customToken,
    };
